-- 8.1 Ricerca dei programmi a cui partecipa a qualsiasi titolo una certa persona.


CREATE PROCEDURE `getProgrammiWithPersona` (IN idPers INT)
BEGIN

SELECT * FROM coinvolgimento c INNER JOIN programma p on p.id = c.programma_id WHERE c.persona_id = idPers;

END
