--sqlite 
drop table if exists Cinema;
drop table if exists CinemaCliente;
drop table if exists CinemaFuncionario;
drop table if exists Cliente;
drop table if exists Funcionario;
drop table if exists Horario;
drop table if exists Filme;
drop table if exists EmCartaz;
drop table if exists Funcionamento;
drop table if exists Turno;
drop table if exists Bilhete;
drop table if exists FilmeHorarioBilhete;
drop table if exists Lugar;
drop table if exists Sala;
drop table if exists Horário;

--outro método q n seja NOT NULL, (basicamente pa forçar q n se possa escrever nd)
CREATE TABLE Cinema (
    idCinema INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    morada TEXT UNIQUE NOT NULL,
    contacto TEXT CHECK(length(contacto) = 9) UNIQUE NOT NULL 
    );

CREATE TABLE Cliente (
    idPessoa INTEGER PRIMARY KEY,
    nome TEXT NOT NULL, 
    contacto INTEGER UNIQUE,
    dataNascimento DATE NOT NULL,
    --idPessoa INTEGER REFERENCES Pessoa,
    idadeCliente INTEGER CHECK (idadeCliente>3)
    );

CREATE TABLE Funcionario (
    idPessoa INTEGER PRIMARY KEY,
    nome TEXT NOT NULL, 
    contacto INTEGER UNIQUE,
    dataNascimento DATE NOT NULL,
    --idPessoa INTEGER REFERENCES Pessoa,
    idadeFuncionario INTEGER CHECK (idadeFuncionario>=18),
    salario INTEGER CHECK (salario>665),
    especialidade TEXT NOT NULL
    );

CREATE TABLE CinemaCliente (
    idCinema INTEGER REFERENCES Cinema,
    idPessoa INTEGER REFERENCES Cliente,
    PRIMARY KEY(idCinema, idPessoa)
    );

CREATE TABLE CinemaFuncionario (
    idCinema INTEGER REFERENCES Cinema,
    idPessoa INTEGER REFERENCES Funcionario,
    PRIMARY KEY(idCinema, idPessoa)
    );

CREATE TABLE Horario (
    idHorario INTEGER PRIMARY KEY,
    inicio TIME NOT NULL,
    fim TIME NOT NULL,
    data DATE NOT NULL
    );
    
CREATE TABLE Filme (
    idFilme INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    genero TEXT NOT NULL,
    diretor TEXT NOT NULL,
    duracao INTEGER CHECK (duracao>90) NOT NULL
    );

CREATE TABLE EmCartaz (
    idFilme INTEGER REFERENCES Filme,
    idCinema INTEGER REFERENCES  Cinema
    );

CREATE TABLE Funcionamento (
    idCinema INTEGER REFERENCES Cinema,
    idHorario INTEGER REFERENCES Horario
    );

CREATE TABLE Turno (
    idPessoa INTEGER REFERENCES Funcionario,
    idHorario INTEGER REFERENCES Horario
    );


CREATE TABLE Bilhete (
    idBilhete INTEGER PRIMARY KEY,
    preco REAL, -- condiçao preço min (not necessary)
    idPessoa INTEGER REFERENCES Cliente,
    idLugar INTEGER REFERENCES Lugar,
    --FOREIGN KEY(idPessoa) REFERENCES Cliente(idPessoa),
    FOREIGN KEY(idLugar) REFERENCES Lugar(idLugar)
    );

CREATE TABLE FilmeHorarioBilhete (
    idFilme INTEGER REFERENCES Filme,
    idHorario INTEGER REFERENCES Horario,
    idBilhete INTEGER REFERENCES Bilhete
    );

CREATE TABLE Lugar (
    idLugar INTEGER PRIMARY KEY,
    idSala INTEGER REFERENCES Sala
    ); 

CREATE TABLE Sala (
    idSala INTEGER PRIMARY KEY,
    tipoSala TEXT CHECK ((tipoSala = "Padrão" OR
                          tipoSala = "IMAX" OR 
                          tipoSala = "4DX" OR
                          tipoSala = "Atmos" OR
                          tipoSala = "ScreenX Atmos" OR
                          tipoSala = "XVision Atmos")) NOT NULL,
    idCinema INTEGER REFERENCES Cinema
    );




