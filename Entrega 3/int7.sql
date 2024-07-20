.mode columns
.headers on
.nullvalue NULL

select Funcionario.idPessoa, Funcionario.nome as Funcionario, Funcionario.salario as Salario from Funcionario, Turno, Cinema 
where Funcionario.idPessoa=Turno.idPessoa and Cinema.nome = 'Alameda'
group by Funcionario.idPessoa 
having count(Turno.idHorario)<(select avg(idHorario) from Turno group by idPessoa)
order by Funcionario.salario ASC;
