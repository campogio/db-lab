-- 1. Registrazione (inserimento dei dati del profilo) di un utente.

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUtente`(IN uname CHAR(45),IN pword CHAR(45), IN modalita INT)
BEGIN

INSERT INTO utente(username,password,modalitàRicezione) VALUES (uname,pword,modalita);

END