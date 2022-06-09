-- 8.2 Ricerca dei programmi a cui partecipa con un titolo specificato una certa persona.


CREATE PROCEDURE `getProgrammiWithPersonaAndRuolo` (IN idPers INT,IN roleStr varchar(45))
BEGIN

SELECT * FROM coinvolgimento c INNER JOIN programma p on p.id = c.programma_id WHERE c.persona_id = idPers and c.ruolo = roleStr;

END