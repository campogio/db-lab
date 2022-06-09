-- 4. Lista dei canali/date/orari in cui sono trasmessi gli episodi di una certa serie.

use dblab;

SELECT m.canale_numero,m.programma_id,m.inizio,m.fine FROM messainonda m INNER JOIN programma p on m.programma_id = p.id WHERE p.nome = "Nome" and p.isEpisodio = 1