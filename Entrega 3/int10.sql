.mode columns
.headers on
.nullvalue NULL

SELECT Cinema.nome AS Cinema, 

Filme.nome AS Filme, sum(preco) as Valor_Bilheteira
from Bilhete LEFT JOIN Lugar ON Bilhete.idLugar = Lugar.idLugar LEFT JOIN Sala
ON Lugar.idSala = Sala.idSala LEFT JOIN Cinema 
ON Cinema.idCinema = Sala.idCinema left join FilmeHorarioBilhete
ON FilmeHorarioBilhete.idBilhete = Bilhete.idBilhete LEFT JOIN Filme
ON FilmeHorarioBilhete.idFilme = Filme.idFilme
group by Filme.nome, 

Cinema.nome order by cinema.nome, Valor_Bilheteira desc;