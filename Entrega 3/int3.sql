.mode columns
.headers on
.nullvalue NULL


select Filme.nome AS Filme, round(avg(idadeCliente), 1) as Média_Idades from Filme, Bilhete, Cliente, FilmeHorarioBilhete where 
Cliente.idPessoa=Bilhete.idPessoa and idadeCliente>=18 
and Filme.idFilme=FilmeHorarioBilhete.idFilme and Bilhete.idBilhete=FilmeHorarioBilhete.idBilhete 
group by Filme.nome order by Filme.nome ASC;
