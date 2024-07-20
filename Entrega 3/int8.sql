.mode columns
.headers on
.nullvalue NULL

select count(lugares) as Lugares_Nao_Ocupados, Lugar.idSala, Cinema.nome as Cinema 
from Lugar, (select idLugar as lugares from Lugar EXCEPT SELECT idLugar from Bilhete), Sala, Cinema
where Sala.idSala=Lugar.idSala and lugares=Lugar.idLugar and Cinema.idCinema=Sala.idCinema
group by Lugar.idSala, Sala.idCinema;

