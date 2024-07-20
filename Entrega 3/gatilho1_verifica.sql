.mode columns
.headers on
.nullvalue NULL

.print
.print "Tabela de filmes e o seu horario de inicio"
.print

SELECT Filme.idFilme, genero, Horario.idHorario, inicio FROM  FilmeHorarioBilhete, Filme, Horario
WHERE Filme.idFilme = FilmeHorarioBilhete.idFilme 
AND Horario.idHorario = FilmeHorarioBilhete.idHorario 
AND genero like '%Terror%';  

.print
.print "Foi inserido um filme de terror na tabela filme e um horario com hora de inicio: '20:00:00.0' "
.print

INSERT INTO Filme VALUES (11, 'The Shining', 'Thriller | Terror', 'Stephen King', 120);
INSERT INTO Horario VALUES (19, '20:00:00.0', '21:30:00.0', '2021-11-11'); 

.print "Foi associado um tuplo de FilmeHorarioBilhete com os novos filme e horario"

INSERT INTO FilmeHorarioBilhete VALUES (11,19,41);

.print
.print "Tabela de filmes de terror e horario de inicio"
.print

SELECT Filme.idFilme, nome, genero, Horario.idHorario, inicio FROM  FilmeHorarioBilhete, Filme, Horario
WHERE Filme.idFilme = FilmeHorarioBilhete.idFilme 
AND Horario.idHorario = FilmeHorarioBilhete.idHorario 
AND genero like '%Terror%';

.print
.print "Foi inserido um horario com hora de inicio: '18:00:00.0' (ou seja não noturno)"
.print

INSERT INTO Horario VALUES (20, '18:00:00.0', '19:30:00.0', '2021-11-12'); 

.print "Vamos tentar associar um tuplo de FilmeHorarioBilhete com o filme anterior e o novo horario"
.print

INSERT INTO FilmeHorarioBilhete VALUES (11,20,42);

.print
.print "Não foi inserido o tuplo (confirmado pela mensagem de erro acima) na tabela FilmeHorarioBilhete"


.print
.print "Tabela de filmes de terror e horario de inicio"
.print

SELECT Filme.idFilme, nome, genero, Horario.idHorario, inicio FROM  FilmeHorarioBilhete, Filme, Horario
WHERE Filme.idFilme = FilmeHorarioBilhete.idFilme 
AND Horario.idHorario = FilmeHorarioBilhete.idHorario 
AND genero like '%Terror%';

.print
