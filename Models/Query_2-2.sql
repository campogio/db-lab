-- 2. Inserimento di un programma televisivo (caso episodio di una serie)

CREATE PROCEDURE `insertEpisode`(IN name CHAR(45),genre INT,descr TEXT,lnk TEXT,img TEXT,nEpis INT,nSeas INT)
BEGIN

INSERT INTO programma(nome,genere,descrizione,link,image,isEpisodio,nEpisodio,nStagione) VALUES (name,genre,descr,lnk,img,1,nEpis,nSeas);

END
