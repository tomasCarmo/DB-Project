
PRAGMA foreign_keys = ON;

--sqlite 
drop table if exists Sala;
drop table if exists Lugar;
drop table if exists FilmeHorarioBilhete;
drop table if exists Bilhete;
drop table if exists Turno;
drop table if exists Funcionamento;
drop table if exists EmCartaz;
drop table if exists Filme;
drop table if exists Horario;
drop table if exists CinemaFuncionario;
drop table if exists CinemaCliente;
drop table if exists Funcionario;
drop table if exists Cliente;
drop table if exists Cinema;



CREATE TABLE Cinema (
    idCinema INTEGER PRIMARY KEY,
    nome TEXT CONSTRAINT cinema_nome_nn NOT NULL,
    morada TEXT CONSTRAINT cinema_morada_u UNIQUE CONSTRAINT cinema_morada_nn NOT NULL,
    contacto INTEGER CONSTRAINT cinema_contacto_u UNIQUE CONSTRAINT cinema_contacto_nn NOT NULL
    );

CREATE TABLE Cliente (
    idPessoa INTEGER PRIMARY KEY,
    nome TEXT CONSTRAINT cliente_nome_nn NOT NULL, 
    contacto INTEGER CONSTRAINT cliente_contacto_u UNIQUE,
    dataNascimento DATE CONSTRAINT cliente_datanascimento_nn NOT NULL,
    idadeCliente INTEGER CONSTRAINT idade_cliente_check CHECK (idadeCliente>3)
    );

CREATE TABLE Funcionario (
    idPessoa INTEGER PRIMARY KEY,
    nome TEXT CONSTRAINT func_nome_nn NOT NULL, 
    contacto INTEGER CONSTRAINT func_contacto_u UNIQUE,
    dataNascimento DATE CONSTRAINT func_datanascimento_nn NOT NULL,
    idadeFuncionario INTEGER CONSTRAINT idade_func_check CHECK (idadeFuncionario>=18),
    salario FLOAT CONSTRAINT salario_minimo_check CHECK (salario>665),
    especialidade TEXT CONSTRAINT especialidade_nn NOT NULL
    );

CREATE TABLE CinemaCliente (
    idCinema INTEGER REFERENCES Cinema ON DELETE CASCADE ON UPDATE CASCADE,
    idPessoa INTEGER REFERENCES Cliente ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(idCinema, idPessoa)
    );

CREATE TABLE CinemaFuncionario (
    idCinema INTEGER REFERENCES Cinema ON DELETE CASCADE ON UPDATE CASCADE,
    idPessoa INTEGER REFERENCES Funcionario ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(idCinema, idPessoa)
    );

CREATE TABLE Horario (
    idHorario INTEGER PRIMARY KEY,
    inicio TIME CONSTRAINT hora_inicio_nn NOT NULL,
    fim TIME CONSTRAINT hora_fim_nn NOT NULL,
    data DATE CONSTRAINT data_nn NOT NULL
    );
    
CREATE TABLE Filme (
    idFilme INTEGER PRIMARY KEY,
    nome TEXT CONSTRAINT nome_filme_nn NOT NULL,
    genero TEXT CONSTRAINT genero_filme_nn NOT NULL DEFAULT 'unknown',
    diretor TEXT CONSTRAINT diretor_filme_nn NOT NULL DEFAULT 'unknown', 
    duracao FLOAT CONSTRAINT duracao_filme_check CHECK (duracao>90) CONSTRAINT duracao_filme_nn NOT NULL
    );

CREATE TABLE EmCartaz (
    idCinema INTEGER REFERENCES Cinema ON DELETE CASCADE ON UPDATE CASCADE,
    idFilme INTEGER REFERENCES Filme ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(idCinema, idFilme)
    );

CREATE TABLE Funcionamento (
    idCinema INTEGER REFERENCES Cinema ON DELETE CASCADE ON UPDATE CASCADE,
    idHorario INTEGER REFERENCES Horario ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(idCinema, idHorario)
    );

CREATE TABLE Turno (
    idPessoa INTEGER REFERENCES Funcionario ON DELETE CASCADE ON UPDATE CASCADE,
    idHorario INTEGER REFERENCES Horario ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(idPessoa, idHorario)
    );


CREATE TABLE Bilhete (
    idBilhete INTEGER PRIMARY KEY,
    preco REAL,
    idPessoa INTEGER REFERENCES Cliente ON DELETE CASCADE ON UPDATE CASCADE,
    idLugar INTEGER REFERENCES Lugar ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE FilmeHorarioBilhete (
    idFilme INTEGER REFERENCES Filme ON DELETE CASCADE ON UPDATE CASCADE,
    idHorario INTEGER REFERENCES Horario ON DELETE CASCADE ON UPDATE CASCADE,
    idBilhete INTEGER REFERENCES Bilhete ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(idFilme, idHorario, idBilhete)
    );

CREATE TABLE Lugar (
    idLugar INTEGER PRIMARY KEY,
    idSala INTEGER REFERENCES Sala ON DELETE CASCADE ON UPDATE CASCADE
    ); 

CREATE TABLE Sala (
    idSala INTEGER PRIMARY KEY,
    tipoSala TEXT CONSTRAINT tipo_sala_check CHECK (tipoSala = 'Padrão' OR
                          tipoSala = 'IMAX' OR 
                          tipoSala = '4DX' OR
                          tipoSala = 'Atmos' OR
                          tipoSala = 'ScreenX Atmos' OR
                          tipoSala = 'XVision Atmos') CONSTRAINT tipo_sala_nn NOT NULL,
    idCinema INTEGER REFERENCES Cinema ON DELETE CASCADE ON UPDATE CASCADE
    );
