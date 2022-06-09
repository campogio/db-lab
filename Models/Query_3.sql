-- 3. Generazione del palinsesto odierno di un canale (lista di ora di inizio, nome programma, ora 
-- di fine e genere per ogni programma del giorno, ovviamente ordinata per ora di inizio).

CREATE PROCEDURE `getPalinsestoOdierno` (IN numero INT)
BEGIN

SELECT * FROM messainonda WHERE cast(inizio as DATE) = current_date() AND canale_numero = numero  ORDER BY inizio;

END
