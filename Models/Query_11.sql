-- 11. Generazione della email giornaliera per un utente in base alle sue preferenze

CREATE PROCEDURE `generaEmailUtente` (IN idUt INT)
BEGIN

SELECT * FROM messainonda m INNER JOIN iscrizione i on cast(m.inizio as time)>i.oraInizio and cast(m.inizio as time)< i.oraFine WHERE i.utente_id = idUt and m.canale_numero = i.canale_numero and cast(inizio as date) = current_date() GROUP BY m.id;

END
