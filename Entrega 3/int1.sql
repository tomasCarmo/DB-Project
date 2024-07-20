.mode columns
.headers on
.nullvalue NULL

SELECT EmCartaz.idCinema, Cinema.nome AS Cinema, count(*) AS Nº_de_Filmes from EmCartaz, Cinema 
where Cinema.idCinema = EmCartaz.idCinema group by EmCartaz.idCinema order by Cinema.idCinema;