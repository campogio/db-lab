-- 7. Ricerca dei film di un certo genere in programma nei prossimi sette giorni.

CREATE PROCEDURE `getWeekGenreFilms` (IN idGen INT)
BEGIN

SELECT * FROM messainonda m  INNER JOIN programma p ON m.programma_id = p.id WHERE inizio >= current_date() and inizio<= date_add(current_date, INTERVAL 7 DAY) and p.genere = idGen;

END
