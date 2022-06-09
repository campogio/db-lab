-- 10. Minuti totali di programmazione per un certo canale in un certo giorno

CREATE PROCEDURE `getTempoProgrammazioneGiorno` (IN idCanale INT , IN dataStr DATE)
BEGIN

SELECT canale_numero,cast(SUM((fine-inizio))as time) as tempoProgrammazione FROM messainonda WHERE cast(inizio as date) = datastr and canale_numero = idCanale;

END
