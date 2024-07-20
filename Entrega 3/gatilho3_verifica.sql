.mode columns
.headers on
.nullvalue NULL

.print
.print "Foi inserido um funcionario de nome 'John Mayer', com id = 26 e especialidade 'Limpeza' sem salario"
.print

--Adiciona sem especialidade
INSERT INTO Funcionario VALUES (26, 'John Mayer', '984412953', '1990-10-3', 31, NULL, 'Limpeza');

.print
.print "Tabela Funcionario"
.print

SELECT idPessoa, nome, salario, especialidade
FROM Funcionario;

.print
.print "Ao atualizar a especialidade para 'Limpeza' desse funcionario, o seu salario é agora 670"
--Altera especialidade para Limpeza de novo
UPDATE Funcionario SET especialidade = 'Limpeza' WHERE idPessoa = 26;

.print
.print "Tabela Funcionario"
.print

SELECT idPessoa, nome, salario, especialidade
FROM Funcionario;

.print
.print "Ao atualizar a especialidade para 'Comida' desse funcionario, o seu salario é agora 705"

--Altera especialidade para Comida
UPDATE Funcionario SET especialidade = 'Comida' WHERE idPessoa = 26;

.print
.print "Tabela Funcionario"
.print


SELECT idPessoa, nome, salario, especialidade
FROM Funcionario;

.print
.print "Ao atualizar a especialidade para 'Bilheteira' desse funcionario, o seu salario é agora 750"

--Altera especialidade para Bilheteira
UPDATE Funcionario SET especialidade = 'Bilheteira' WHERE idPessoa = 26;

.print
.print "Tabela Funcionario"
.print

SELECT idPessoa, nome, salario, especialidade
FROM Funcionario;

.print
.print "Ao atualizar a especialidade para 'Gestão' desse funcionario, o seu salario é agora 1200"

--Altera especialidade para Gestão
UPDATE Funcionario SET especialidade = 'Gestão' WHERE idPessoa = 26;

.print
.print "Tabela Funcionario"
.print

SELECT idPessoa, nome, salario, especialidade
FROM Funcionario;

.print
.print "Ao atualizar a especialidade para 'Coordenador' desse funcionario, o seu salario é agora 2000"

--Altera especialidade para Coordenador
UPDATE Funcionario SET especialidade = 'Coordenador' WHERE idPessoa = 26;

.print
.print "Tabela Funcionario"
.print

SELECT idPessoa, nome, salario, especialidade
FROM Funcionario;

.print
