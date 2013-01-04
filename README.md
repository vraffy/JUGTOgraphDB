JUG Torino - Meeting 22/12/2012
======
Introduzione ai Graph Database
-----

Qui potete trovare le slide e alcuni esempi di codice relativi al talk di introduzione ai graph database che ho tenuto
al meeting di dicembre del JUG di Torino (http://www.jugtorino.it/).

In particolare:
- nella directory "doc" trovate le slides (sia in formato Open Office, sia convertite in PDF)
- nella directory /src/main/examples si trovano alcuni esempi corrispondenti al grafo di esempio mostrato nella presentazione:

  - *orient*
      - script OrientDB_createDB.osql --> contiene le istruzioni necessarie per generare il database di test
      - script OrientDB_query.osql --> contiene alcuni esempi di query in "SQL" Orient
      - script OrientDB_gremlin.osql --> contiene alcuni esempi di accesso ai dati tramite console gremlin 
  
  - *sqlite*
	    - script RDBMS_createDB.sql --> contiene le istruzioni necessarie per generare il database di test in un RDBMS (sqlite)
	    - script RDBMS_query.sql --> contiene due esempi di query in "SQL" per la "navigazione del grafo"

- nella directory /src/test si trova un file README.txt che contiene alcune indicazioni sull'esecuzione dei test di creazione e interrogazione del database tramite codice Java
