-- 5. Lista dei canali maggiormente “preferiti” dagli utenti (cioè indicati come parte 
-- della loro mail giornaliera).

CREATE PROCEDURE `getCanaliPreferiti` ()
BEGIN

SELECT canale_numero,count(*) as count FROM iscrizione GROUP BY canale_numero ORDER BY count DESC;

END
