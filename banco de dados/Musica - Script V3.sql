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
    data DATETIME DEFAULT CURRENT_TIMESTAMP,
    pontuacao int,
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
    
INSERT INTO Musica (nome, fkAlbum, fkArtista, fkGenero) VALUES
-- 1 — SOS (SZA)
('Kill Bill', 1, 1, 5),
('Snooze', 1, 1, 5),
('Shirt', 1, 1, 5),
('Nobody Gets Me', 1, 1, 5),

-- 2 — Charm (Clairo)
('Sexy to Someone', 2, 2, 1),
('Juna', 2, 2, 1),
('Terrapin', 2, 2, 1),
('Echo', 2, 2, 1),

-- 3 — DAMN. (Kendrick Lamar)
('HUMBLE.', 3, 3, 2),
('DNA.', 3, 3, 2),
('LOVE.', 3, 3, 2),
('LOYALTY.', 3, 3, 2),

-- 4 — Realidade (Marília Mendonça)
('De Quem É a Culpa?', 4, 11, 7),
('Eu Sei de Cor', 4, 11, 7),
('Infiel', 4, 11, 7),

-- 5 — Anitta (Anitta)
('Show das Poderosas', 5, 12, 4),
('Menina Má', 5, 12, 4),
('Proposta', 5, 12, 4),

-- 6 — Chico Buarque (1978)
('Cálice', 6, 13, 6),
('Gota d’Água', 6, 13, 6),
('Mulheres de Atenas', 6, 13, 6),

-- 7 — From Zero (Linkin Park)
('Friendly Fire', 7, 4, 3),
('Healing Foot', 7, 4, 3),
('The Emptiness Machine', 7, 4, 3),

-- 8 — Eu Venci o Mundo (Veigh)
('Novo Balanço', 8, 5, 2),
('Nave', 8, 5, 2),
('Eu Venci o Mundo', 8, 5, 2),

-- 9 — The Album (BLACKPINK)
('How You Like That', 9, 6, 8),
('Lovesick Girls', 9, 6, 8),
('Pretty Savage', 9, 6, 8),

-- 10 — Submarine (The Marías)
('Lejos De Ti', 10, 7, 1),
('Run Your Mouth', 10, 7, 1),
('No One Noticed', 10, 7, 1),

-- 11 — Ao Vivo na Lua (Luan Santana)
('Ambiente Errado', 11, 8, 7),
('Abalo Emocional', 11, 8, 7),
('Coração Cigano', 11, 8, 7),

-- 12 — The Rise and Fall of a Midwest Princess (Chappell Roan)
('Pink Pony Club', 12, 14, 5),
('HOT TO GO!', 12, 14, 5),
('Good Hurt', 12, 14, 5),

-- 13 — Avisa que é o Funk (MC Hariel)
('Maçã Verde', 13, 9, 4),
('Como Que Tá, Pai?', 13, 9, 4),
('Avisa Que É o Funk', 13, 9, 4),

-- 14 — Fallen (Evanescence)
('Bring Me to Life', 14, 15, 3),
('My Immortal', 14, 15, 3),
('Going Under', 14, 15, 3),

-- 15 — Tribalistas (Tribalistas)
('Já Sei Namorar', 15, 10, 6),
('Velha Infância', 15, 10, 6),
('É Você', 15, 10, 6),

-- 16 — Get Up (NewJeans)
('Get Up', 16, 16, 8),
('New Jeans', 16, 16, 8),
('Super Shy', 16, 16, 8);
    
select *from Resultado;
select *from Usuario;
select *from Album;
select *from Musica;
select *from Genero;

select 
	art.nome as 'artista', 
    g.genero as 'gênero',
    a.nome as 'álbum', 
    m.nome as 'música', 
    YEAR(a.dtLancamento) as 'ano de lançamento'
FROM Album a 
	JOIN Artista art ON a.fkArtista = art.idArtista
    JOIN Genero g ON a.fkGenero = g.idGenero
    JOIN Musica m ON m.fkAlbum = a.idAlbum
ORDER BY genero;

-- KPI1
SELECT 
    generoMais AS genero,
    COUNT(*) / (SELECT COUNT(*) FROM Resultado) *100 AS porcentagem
FROM Resultado
GROUP BY generoMais;

-- KPI 2
SELECT 
	generoMais as genero,
	COUNT(*) AS qtd
FROM Resultado
WHERE fkUsuario = 1
GROUP BY generoMais;

-- TABELA RANKING
SELECT 
	u.nome as 'usuario',
    r.pontuacao as 'pontuacao',
    r.data as 'data'
FROM Usuario u
	JOIN Resultado r ON u.idUsuario = r.fkUsuario;

    