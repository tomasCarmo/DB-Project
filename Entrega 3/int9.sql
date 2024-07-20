.mode columns
.headers on
.nullvalue NULL

SELECT Horario.inicio as Hora_Inicio, Horario.data as Data, Filme.nome as Filme, Cinema.nome as Cinema FROM FilmeHorarioBilhete LEFT JOIN Horario
ON FilmeHorarioBilhete.idHorario = Horario.idHorario LEFT JOIN Filme
ON FilmeHorarioBilhete.idFilme = Filme.idFilme LEFT JOIN Bilhete 
ON FilmeHorarioBilhete.idBilhete = Bilhete.idBilhete LEFT JOIN Lugar 
ON Bilhete.idLugar = Lugar.idLugar LEFT JOIN Sala 
ON Lugar.idSala = Sala.idSala LEFT JOIN Cinema 
ON Sala.idCinema = Cinema.idCinema
group by Cinema.nome, Horario.inicio, Horario.data, Filme.nome
order by Cinema.nome, Horario.data, Horario.inicio;
