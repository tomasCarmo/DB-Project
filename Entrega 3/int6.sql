.mode columns
.headers on
.nullvalue NULL


select Filme.nome as Filme, count(FilmeHorarioBilhete.idBilhete) as NºBilhetes from FilmeHorarioBilhete LEFT JOIN Filme
ON Filme.idFilme = FilmeHorarioBilhete.idFilme LEFT JOIN Bilhete
ON Bilhete.idBilhete = FilmeHorarioBilhete.idBilhete LEFT JOIN Lugar 
ON Bilhete.idLugar = Lugar.idLugar LEFT JOIN Sala
ON Lugar.idSala = Sala.idSala LEFT JOIN Cinema 
ON Sala.idCinema = Cinema.idCinema
where Cinema.nome = 'NorteShopping' GROUP by Filme.nome order by NºBilhetes DESC limit 1;