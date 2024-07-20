.mode columns
.headers on
.nullvalue NULL

--Ao atribuir um filme e horario a um bilhete, caso o filme seja de terror o inicio do mesmo será de noite (depois das 19h)
CREATE TRIGGER IF NOT EXISTS horrorMoviesOnNightSchedule
AFTER INSERT ON FilmeHorarioBilhete
WHEN (SELECT genero FROM Filme WHERE idFilme = new.idFilme) like '%Terror%' 
AND (SELECT inicio FROM Horario WHERE idHorario = new.idHorario) < '19:00:00.0'
BEGIN
   SELECT RAISE(ABORT, 'Filmes de Terror possuem apenas horário noturno!');
END;