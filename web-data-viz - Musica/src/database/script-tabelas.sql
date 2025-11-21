-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE Musica;

USE Musica;
SHOW TABLES;

CREATE TABLE Artista (
	idArtista int primary key auto_increment,
    nome varchar (45)
);

CREATE TABLE Genero (
	idGenero int primary key auto_increment,
    genero varchar(45)
);

CREATE TABLE Album (
	idAlbum int auto_increment,
    nome varchar (45),
    dtLancamento date,
    fkArtista int,
		FOREIGN KEY fkArtistaAlbum (fkArtista) REFERENCES Artista(idArtista),
    fkGenero int,
		FOREIGN KEY fkGeneroAlbum (fkGenero) REFERENCES Genero(idGenero),
	CONSTRAINT pkCompostaAlbum
		PRIMARY KEY (idAlbum, fkArtista, fkGenero)
);

CREATE TABLE Musica (
	idMusica int primary key auto_increment,
    nome varchar (45),
    fkAlbum int,
		FOREIGN KEY fkAlbumMusica (fkAlbum) REFERENCES Album(idAlbum),
    fkArtista int,
		FOREIGN KEY fkArtistaMusica (fkArtista) REFERENCES Artista(idArtista),
    fkGenero int,
		FOREIGN KEY fkGeneroMusica (fkGenero) REFERENCES Genero(idGenero)
);

CREATE TABLE Pergunta (
	idPergunta int primary key auto_increment,
    imagem_URL varchar (255)
);

CREATE TABLE Quiz (
	idQuiz int auto_increment,
    fkPergunta int,
		FOREIGN KEY fkPerguntaQuiz (fkPergunta) REFERENCES Pergunta(idPergunta),
    fkAlbum int,
		FOREIGN KEY fkAlbumQuiz (fkAlbum) REFERENCES Album(idAlbum),
    fkArtista int,
		FOREIGN KEY fkArtistaQuiz (fkArtista) REFERENCES Artista(idArtista),
    fkGenero int,
		FOREIGN KEY fkGeneroQuiz (fkGenero) REFERENCES Genero(idGenero),
	CONSTRAINT pkCompostaQuiz 
		PRIMARY KEY (idQuiz, fkPergunta, fkAlbum, fkArtista, fkGenero)
);

CREATE TABLE Usuario (
	idUsuario int primary key auto_increment,
    nome varchar (255) not null,
    email varchar (255) unique not null,
    senha varchar (255) not null
);

CREATE TABLE Tentativa (
	idTentativa int auto_increment,
    fkUsuario int,
		FOREIGN KEY fkUsuarioTentativa (fkUsuario) REFERENCES Usuario(idUsuario),
    fkQuiz int,
		FOREIGN KEY fkQuizTentativa (fkQuiz) REFERENCES Quiz(idQuiz),
    fkPergunta int,
		FOREIGN KEY fkPerguntaTentativa (fkPergunta) REFERENCES Pergunta(idPergunta),
    fkAlbum int,
		FOREIGN KEY fkAlbumTentativa (fkAlbum) REFERENCES Album(idAlbum),
    fkArtista int,
		FOREIGN KEY fkArtistaTentativa (fkArtista) REFERENCES Artista(idArtista),
    fkGenero int,
		FOREIGN KEY fkGeneroTentativa (fkGenero) REFERENCES Genero(idGenero),
    data datetime,
    CONSTRAINT pkCompostaTentativa
		PRIMARY KEY (idTentativa, fkUsuario, fkQuiz, fkPergunta, fkAlbum, fkArtista, fkGenero)
);

insert into empresa (razao_social, codigo_ativacao) values ('Empresa 1', 'ED145B');
insert into empresa (razao_social, codigo_ativacao) values ('Empresa 2', 'A1B2C3');
insert into aquario (descricao, fk_empresa) values ('Aquário de Estrela-do-mar', 1);
insert into aquario (descricao, fk_empresa) values ('Aquário de Peixe-dourado', 2);