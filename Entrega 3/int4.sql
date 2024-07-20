.mode columns
.headers on
.nullvalue NULL

SELECT Funcionario.nome as Funcionario, salario as Salario from Funcionario where salario >= 1500 and idadeFuncionario>25  ORDER BY Funcionario.nome;