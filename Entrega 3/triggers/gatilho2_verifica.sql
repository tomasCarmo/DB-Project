.mode columns
.headers on
.nullvalue NULL

.print
.print "Nada foi alterado"
.print

.print "Tabela de bilhetes e os seus filmes por cinema"
.print

SELECT DISTINCT Sala.idCinema, idFilme, FilmeHorarioBilhete.idBilhete FROM
FilmeHorarioBilhete LEFT JOIN Bilhete 
ON FilmeHorarioBilhete.idBilhete = Bilhete.idBilhete LEFT JOIN Lugar 
ON Lugar.idLugar = Bilhete.idlugar LEFT JOIN Sala
ON Lugar.idSala = Sala.idSala order by Sala.idCinema, idFilme;

.print

INSERT INTO FilmeHorarioBilhete VALUES (1,7,41);
.print
.print "Foi inserido o tuplo (1,7,41) na tabela FilmeHorarioBilhete" 
.print

.print "Tabela de bilhetes e os seus filmes por cinema"
.print

SELECT DISTINCT Sala.idCinema, idFilme, FilmeHorarioBilhete.idBilhete FROM
FilmeHorarioBilhete LEFT JOIN Bilhete 
ON FilmeHorarioBilhete.idBilhete = Bilhete.idBilhete LEFT JOIN Lugar 
ON Lugar.idLugar = Bilhete.idlugar LEFT JOIN Sala
ON Lugar.idSala = Sala.idSala order by Sala.idCinema, idFilme;

.print
.print "Vamos (tentar) inserir o tuplo (6,7,42) na tabela FilmeHorarioBilhete"
.print

INSERT INTO FilmeHorarioBilhete VALUES (6,7,42);

.print
.print "Não foi inserido o tuplo (confirmado pela mensagem de erro acima) na tabela FilmeHorarioBilhete" 
.print


.print "Tabela de bilhetes e os seus filmes por cinema"
.print

SELECT DISTINCT Sala.idCinema, idFilme, FilmeHorarioBilhete.idBilhete FROM
FilmeHorarioBilhete LEFT JOIN Bilhete 
ON FilmeHorarioBilhete.idBilhete = Bilhete.idBilhete LEFT JOIN Lugar 
ON Lugar.idLugar = Bilhete.idlugar LEFT JOIN Sala
ON Lugar.idSala = Sala.idSala order by Sala.idCinema, idFilme;

.print
