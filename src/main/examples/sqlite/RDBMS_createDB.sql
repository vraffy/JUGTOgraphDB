-- Creazione di un database relazionale contenente le stesse informazioni della versione graphDB
-- sqlite3 <nomeDB>.db

-- Creazione e inserimento dati nella tabella "Persona" (vertici)
CREATE TABLE Persona(id VARCHAR(30), nome VARCHAR(30), cognome VARCHAR(30));
INSERT INTO Persona(id, nome, cognome) VALUES('perpetua', 'Perpetua', '');
INSERT INTO Persona(id, nome, cognome) VALUES('don_abbondio', 'Abbondio', '');
INSERT INTO Persona(id, nome, cognome) VALUES('renzo', 'Renzo', 'Tramaglino');
INSERT INTO Persona(id, nome, cognome) VALUES('lucia', 'Lucia', 'Mondella');
INSERT INTO Persona(id, nome, cognome) VALUES('agnese', 'Agnese', '');
INSERT INTO Persona(id, nome, cognome) VALUES('fra_cristoforo', 'Lodovico', '');
INSERT INTO Persona(id, nome, cognome) VALUES('don_rodrigo', 'Rodrigo', '');
INSERT INTO Persona(id, nome, cognome) VALUES('griso', 'Griso', '');
INSERT INTO Persona(id, nome, cognome) VALUES('tonio', 'Tonio', '');
INSERT INTO Persona(id, nome, cognome) VALUES('conte_attilio', 'Attilio', '');


-- Creazione e inserimento dati nella tabella "Relazione" (archi)
CREATE TABLE Relazione(sorgente VARCHAR(30), destinazione VARCHAR(30), tipoRelazione VARCHAR(30));
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('perpetua', 'don_abbondio', 'dipendente');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('renzo', 'tonio', 'amico');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('tonio', 'renzo', 'amico');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('renzo', 'fra_cristoforo', 'amico');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('fra_cristoforo', 'renzo', 'amico');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('renzo', 'lucia', 'amico');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('lucia', 'renzo', 'amico');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('agnese', 'fra_cristoforo', 'amico');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('fra_cristoforo', 'agnese', 'amico');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('agnese', 'lucia', 'parente');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('lucia', 'agnese', 'parente');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('lucia', 'fra_cristoforo', 'amico');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('fra_cristoforo', 'lucia', 'amico');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('griso', 'don_rodrigo', 'dipendente');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('don_rodrigo', 'lucia', 'stalker');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('don_rodrigo', 'conte_attilio', 'parente');
INSERT INTO Relazione (sorgente, destinazione, tipoRelazione) VALUES ('conte_attilio', 'don_rodrigo', 'parente');

