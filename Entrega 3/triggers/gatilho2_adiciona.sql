.mode columns
.headers on
.nullvalue NULL

--Verifica se ao atribuir um filme e horário a um bilhete o filme está em cartaz no próprio cinema
CREATE TRIGGER IF NOT EXISTS filmeEmCartaz
BEFORE INSERT ON FilmeHorarioBilhete
WHEN new.idFilme NOT IN (SELECT EmCartaz.idFilme FROM EmCartaz, Sala, Lugar, Bilhete 
WHERE idBilhete = new.idBilhete 
AND Lugar.idLugar = Bilhete.idLugar 
AND Sala.idSala = Lugar.idSala
AND EmCartaz.idCinema  = Sala.idCinema)
BEGIN   
    SELECT RAISE(ABORT, 'Este filme não se apresenta em cartaz!');
END;
