.mode columns
.headers on
.nullvalue NULL

SELECT Cinema, max(salas) AS Nº_Salas_IMAX from (SELECT Cinema.nome as Cinema, count(Sala.idSala) as salas 
FROM Sala, Cinema where Sala.tipoSala='IMAX' AND
Cinema.idCinema=Sala.idCinema GROUP BY Cinema.idCinema);
