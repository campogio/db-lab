-- 2. Inserimento di un programma televisivo (caso: programma singolo)

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertFilm`(IN name CHAR(45),genre INT,descr TEXT,lnk TEXT,img TEXT)
BEGIN

INSERT INTO programma(nome,genere,descrizione,link,image) VALUES (name,genre,descr,lnk,img);

END