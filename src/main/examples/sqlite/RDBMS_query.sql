-- Esempio di query eseguite sul database relazionale
-- sqlite3 <nomeDB>.db

-- Gli amici di Renzo
SELECT p.id, p.nome, p.cognome
  FROM Relazione r 
       INNER JOIN Persona p ON r.destinazione = p.id
 WHERE r.sorgente = 'renzo'
   AND r.tipoRelazione = 'amico';

-- Gli amici degli amici di Renzo
SELECT p.id, p.nome, p.cognome
  FROM Relazione r 
       INNER JOIN Relazione r2 ON r.destinazione = r2.sorgente 
                              AND r2.tipoRelazione = 'amico'
       INNER JOIN Persona p ON r2.destinazione = p.id
 WHERE r.sorgente = 'renzo'
   AND r.tipoRelazione = 'amico'
   AND p.id != 'renzo';
