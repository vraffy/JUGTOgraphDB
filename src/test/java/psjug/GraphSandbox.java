package psjug;

import static junit.framework.Assert.assertEquals;

import java.util.List;

import org.junit.Test;

import com.orientechnologies.orient.core.db.graph.OGraphDatabase;
import com.orientechnologies.orient.core.record.impl.ODocument;
import com.orientechnologies.orient.core.sql.OCommandSQL;
import com.orientechnologies.orient.graph.gremlin.OGremlinHelper;
import com.tinkerpop.blueprints.impls.orient.OrientVertex;

public class GraphSandbox {
	
	private final static String DB_URL = "local:/home/raf/Documents/JUG/graphDB/examples/jugtest";
	private final static String DB_USER = "admin";
	private final static String DB_PWD = "admin";

	/**
	 * Test di creazione di un graph database contenente due tipi di vertici: Paragraph e Chapter.
	 * Vengono generati due vertici di tipo Paragraph e un vertice di tipo Chapter.
	 * Tutti e due i vertici di tipo Paragraph vengono collegati al vertice di tipo Chapter
	 * tramite un arco con label "inChapter".
	 * Una volta eseguito il test è possibile connettersi tramite la console di Orient alla stessa URL
	 * per verificare il contenuto del database (v. file README.txt). 
	 * 
	 */
	@Test
	public void testCreateGraphDB() {

		OGraphDatabase database = new OGraphDatabase(DB_URL);
		if (database.exists()) {
			database.open(DB_USER, DB_PWD);
			database.drop();
		}
		database.create();

		database.createVertexType("Paragraph");
		database.createVertexType("Chapter");

		ODocument p1 = database.createVertex("Paragraph").field("id", "01_001").field("type", "text").field("text", "Quel ramo del lago di Como...");
		p1.save();
		ODocument p2 = database.createVertex("Paragraph").field("id", "01_002").field("type", "dialogo").field("text", "Questo matrimonio non s'ha da fare!");
		p2.save();
		ODocument c1 = database.createVertex("Chapter").field("id", "01").field("title", "Capitolo 01");
		c1.save();

		ODocument e1 = database.createEdge(p1, c1).field(OGraphDatabase.LABEL, "inChapter");
		e1.save();
		ODocument e2 = database.createEdge(p2, c1).field(OGraphDatabase.LABEL, "inChapter");
		e2.save();

		database.close();
	}

	/**
	 * Esegue alcune semplici query sul database generato al passo precedente.
	 * Nota: selezionando a livello di "vertice" si ottengono tutti i vertici (sia quelli di tipo Paragraph sia quello di tipo Chapter).
	 */
	@Test
	public void testReadFromGraphDB() {

		OGraphDatabase database = new OGraphDatabase(DB_URL);
		database.open(DB_USER, DB_PWD);

		OGremlinHelper.global().create();

		List<ODocument> result = database.command(new OCommandSQL("select from Chapter")).execute();
		assertEquals(1, result.size());

		result = database.command(new OCommandSQL("select from Paragraph")).execute();
		assertEquals(2, result.size());

		result = database.command(new OCommandSQL("select from V")).execute();
		assertEquals(3, result.size());

		database.close();
	}

	/**
	 * Esegue una query un po' più complessa utilizzando gremlin.
	 * Per ogni capitolo (in realtà nel database ce n'è un solo) estrae l'elenco dei Paragraph collegati tramite un arco con label "inChapter".
	 */
	@Test
	public void testExtractDataFromDocument() {

		OGraphDatabase database = new OGraphDatabase(DB_URL);
		database.open(DB_USER, DB_PWD);

		OGremlinHelper.global().create();

		List<ODocument> result = database.command(new OCommandSQL("select gremlin('current.inE('inChapter').outV') as value from Chapter")).execute();
		for (ODocument chapter : result) {
			List<OrientVertex> paragraphs = chapter.field("value");
			for (OrientVertex p : paragraphs) {
				System.out.println(p.getIdentity() + " --> " + p.getProperty("id") + "   " + p.getProperty("text"));
			}
		}

		database.close();
	}

}
