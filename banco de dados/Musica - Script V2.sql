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

CREATE TABLE Quiz (
	idQuiz int primary key auto_increment,
    descricao varchar (255)
);

CREATE TABLE Album (
	idAlbum int auto_increment,
    nome varchar (45),
    dtLancamento date,
    fkArtista int,
		FOREIGN KEY fkArtistaAlbum (fkArtista) REFERENCES Artista(idArtista),
    fkGenero int,
		FOREIGN KEY fkGeneroAlbum (fkGenero) REFERENCES Genero(idGenero),
	fkQuiz int,
		FOREIGN KEY fkQuizAlbum (fkQuiz) REFERENCES Quiz(idQuiz),
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

CREATE TABLE Usuario (
	idUsuario int primary key auto_increment,
    nome varchar (255) not null,
    email varchar (255) unique not null,
    senha varchar (255) not null
);

CREATE TABLE Resultado (
	idResultado int auto_increment,
    fkQuiz int,
		FOREIGN KEY fkQuizResultado (fkQuiz) REFERENCES Quiz(idQuiz),
    fkUsuario int,
		FOREIGN KEY fkUsuarioResultado (fkUsuario) REFERENCES Usuario(idUsuario),
	generoMais varchar(45),
	generoMenos varchar(45),
    CONSTRAINT pkCompostaTentativa
		PRIMARY KEY (idResultado, fkQuiz, fkUsuario)
);

-- INSERTS
insert into Artista (nome) VALUES
	('SZA'),
	('Clairo'),
	('Kendrick Lamar'),
	('Linkin Park'),
	('Veigh'),
	('Blackpink'),
	('The Marías'),
	('Luan Santana'),
	('MC Hariel'),
	('Tribalistas'),
	('Marília Mendonça'),
	('Anitta'),
	('Chico Buarque'),
	('Chappel Roan'),
	('Evanescence'),
	('NewJeans');
    
insert into Genero (genero) VALUES 
	('indie'),
	('hiphop'),
	('rock'),
	('funk'),
	('pop'),
	('MPB'),
	('sertanejo'),
	('kpop');
    
insert into Quiz (descricao) VALUES 
	('Quiz para adivinhar o nome e o artista do álbum.');
    
insert into Album (nome, dtLancamento, fkArtista, fkGenero, fkQuiz) VALUES
	('SOS', '2022-12-09', 1, 5, 1),
	('Charm', '2024-07-12', 2, 1, 1),
	('Damn', '2017-04-14', 3, 2, 1),
	('Realidade', '2017-03-06', 11, 7, 1),
	('Anitta', '2013-07-06', 12, 4, 1),
	('Chico Buarque', '1978-01-01', 13, 6, 1),
	('From Zero', '2024-11-15', 4, 3, 1),
	('Eu Venci o Mundo', '2025-06-26', 5, 2, 1),
	('The Album', '2020-10-02', 6, 8, 1),
	('Submarine', '2024-05-31', 7, 1, 1),
	('AO VIVO NA LUA', '2025-02-13', 8, 7, 1),
	('The Rise and Fall of a Midwest Princess', '2023-09-22', 14, 5, 1),
	('Avisa que É o Funk', '2020-10-09', 9, 4, 1),
	('Fallen', '2003-03-04', 15, 3, 1),
	('Tribalistas', '2017-08-25', 10, 6, 1),
	('Get Up', '2023-07-21', 16, 8, 1);
    
select *from Resultado;
select *from Usuario;
    