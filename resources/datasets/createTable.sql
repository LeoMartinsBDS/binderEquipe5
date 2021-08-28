BEGIN;

DROP DATABASE IF EXISTS marketcamp;
CREATE DATABASE marketcamp;

USE marketcamp;

CREATE TABLE consumidor(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	rua VARCHAR(100) NOT NULL,
	bairro VARCHAR(100) NOT NULL,
	cidade VARCHAR(100) NOT NULL
);

CREATE TABLE consumidortelefone(
	id INT PRIMARY KEY AUTO_INCREMENT,
	consumidorid INT NOT NULL,
	tipotelefone CHAR(1) NOT NULL,
	numero VARCHAR(20) NOT NULL,
	FOREIGN KEY (consumidorid) REFERENCES consumidor(id) ON DELETE CASCADE 
);

CREATE TABLE planoassinatura(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nomeexibicao VARCHAR(50) NOT NULL,
	descricao VARCHAR(200) NOT NULL
);

CREATE TABLE assinante(
	id INT PRIMARY KEY AUTO_INCREMENT,
	planoid INT NOT NULL,
	consumidorid INT NOT NULL,
	dataMensalidade DATE NOT NULL,
	FOREIGN KEY (planoid) REFERENCES planoassinatura(id) ON DELETE CASCADE,
	FOREIGN KEY (consumidorid) REFERENCES consumidor(id) ON DELETE CASCADE
);

CREATE TABLE forumassinatura(
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(30) NOT NULL,
	dataabertura DATE NOT NULL
);

CREATE TABLE mensagem(
	id INT PRIMARY KEY AUTO_INCREMENT,
	forumid INT NOT NULL,
	consumidorid INT NOT NULL,
	data DATE NOT NULL,
	mensagem VARCHAR(200) NOT NULL,
	FOREIGN KEY (forumid) REFERENCES forumassinatura(id) ON DELETE CASCADE,
	FOREIGN KEY (consumidorid) REFERENCES consumidor(id) ON DELETE CASCADE
);

CREATE TABLE avaliacao(
	id INT PRIMARY KEY AUTO_INCREMENT,
	consumidorid INT NOT NULL,
	mensagemid INT NOT NULL,
	gostou boolean DEFAULT FALSE,
	descricaoavaliacao VARCHAR(200) DEFAULT NULL,
	FOREIGN KEY (consumidorid) REFERENCES consumidor(id) ON DELETE CASCADE,
	FOREIGN KEY (mensagemid) REFERENCES mensagem(id) ON DELETE CASCADE
);

COMMIT;