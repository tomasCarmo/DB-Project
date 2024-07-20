.mode columns
.headers on
.nullvalue NULL

CREATE TRIGGER IF NOT EXISTS atualizaSalarioLimpeza
AFTER UPDATE OF especialidade ON Funcionario
WHEN new.especialidade = 'Limpeza'
BEGIN
    UPDATE Funcionario
    SET salario = 670
    WHERE idPessoa = new.idPessoa;
END;

CREATE TRIGGER IF NOT EXISTS atualizaSalarioComida
AFTER UPDATE OF especialidade ON Funcionario
WHEN new.especialidade = 'Comida'
BEGIN
    UPDATE Funcionario
    SET salario = 705
    WHERE idPessoa = new.idPessoa;
END;

CREATE TRIGGER IF NOT EXISTS atualizaSalarioBilheteira
AFTER UPDATE OF especialidade ON Funcionario
WHEN new.especialidade = 'Bilheteira'
BEGIN
    UPDATE Funcionario
    SET salario = 750
    WHERE idPessoa = new.idPessoa;
END;

CREATE TRIGGER IF NOT EXISTS atualizaSalarioGestao
AFTER UPDATE OF especialidade ON Funcionario
WHEN new.especialidade = 'Gestão'
BEGIN
    UPDATE Funcionario
    SET salario = 1200
    WHERE idPessoa = new.idPessoa;
END;

CREATE TRIGGER IF NOT EXISTS atualizaSalarioCoordenador
AFTER UPDATE OF especialidade ON Funcionario
WHEN new.especialidade = 'Coordenador'
BEGIN
    UPDATE Funcionario
    SET salario = 2000
    WHERE idPessoa = new.idPessoa;
END;