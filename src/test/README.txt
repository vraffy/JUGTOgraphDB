Esecuzione dei test in GraphSandbox e verifica dei risultati tramite console di Orient.
=======================================================================================

1. Aggiornare il valore della costante DB_URL contenuta in GraphSandbox con un percorso a piacere (senza cancellare la parte "local:").

2. Eseguire il test "testCreateGraphDB".

3. Scaricare la versione "graphed" di OrientDB (la versione di riferimento utilizzata è la 1.1.0)
	http://code.google.com/p/orient/downloads/detail?name=orientdb-graphed-1.0.zip&can=1&q=
   scompattare semplicemente l'archivio e avviare la console di Orient (comando console.sh o console.bat, a seconda del sistema operativo utilizzato,
   presente nella directory bin).
   
4. Connettersi al database creato dal test: 
	connect local:<DB_URL> admin admin
	
5. Eseguire il comando "info" e verificare la presenza di 3 vertici (OGraphVertex) dei quali 2 Paragraph e 1 Chapter e di 2 archi (OGraphEdge)

6. Disconnettersi dal database (disconnect) prima di procedere.

7. Eseguire il test "testReadFromGraphDB".
   Volendo, è possibile connettersi al database (seguendo i passi indicati sopra) ed eseguire manualmente le stesse query all'interno della console
   per verificare direttamente i risultati restituiti.
   In questo caso, ricordarsi di disconntersi dal database prima di procedere.
   
8. Eseguire il test "testExtractDataFromDocument".
    