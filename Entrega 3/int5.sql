.mode columns
.headers on
.nullvalue NULL

SELECT DISTINCT Cliente.nome from Cliente WHERE Cliente.nome not in (SELECT Funcionario.nome from Funcionario) order by Cliente.nome;