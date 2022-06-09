-- 6. Eliminazione di un programma televisivo dal database

CREATE PROCEDURE `rimuoviProgramma` (IN idProg INT)
BEGIN

DELETE FROM messainonda WHERE programma_id = idProg;

DELETE FROM coinvolgimento WHERE programma_id = idProg;

DELETE FROM programma WHERE id = idProg;

END
