-- 9. Numero programmi distinti trasmessi da ciascuna emittente in un determinato giorno.

CREATE PROCEDURE `getProgrammiNelGiorno` (IN giorno DATE)
BEGIN

SELECT canale_numero,count(*) as numeroProgrammi FROM dblab.messainonda WHERE cast(inizio as date) = giorno GROUP BY canale_numero;

END
