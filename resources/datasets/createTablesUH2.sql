BEGIN;

USE marketcamp;

DROP TABLE IF EXISTS loja;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS cargofuncionario;
DROP TABLE IF EXISTS fornecedor;
DROP TABLE IF EXISTS movimentacaofinanceira;
DROP TABLE IF EXISTS documentofiscal;
DROP TABLE IF EXISTS meiopagamento;
DROP TABLE IF EXISTS movimentacaofinanceiraentrada;
DROP TABLE IF EXISTS movimentacaofinanceirasaida;
DROP TABLE IF EXISTS centrodecusto;
DROP TABLE IF EXISTS documentofiscal;
DROP TABLE IF EXISTS meiopagamento;


CREATE TABLE loja(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nomeexibicao VARCHAR(100) NOT NULL,
	cnpj VARCHAR(14) NOT NULL,
	logradouro VARCHAR(200) NOT NULL,
	emailatendimento VARCHAR(100) NOT NULL,
	telefone VARCHAR(20) NOT NULL
);

CREATE TABLE cargofuncionario(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nomecargo VARCHAR(50) NOT NULL,
	descricaocargo VARCHAR(100) NOT NULL
);


CREATE TABLE funcionario(
	id INT PRIMARY KEY AUTO_INCREMENT,
	cargoid INT NOT NULL,
	lojaid INT NOT NULL,
	nome VARCHAR(100) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	email VARCHAR(100) NOT NULL,
	logradouro VARCHAR(200) NOT NULL,
	esocialid INT NOT NULL,
	agenciasalario INT NOT NULL,
	contasalario VARCHAR(10) NOT NULL,
	FOREIGN KEY (cargoid) REFERENCES cargofuncionario(id) ON DELETE NO ACTION,
	FOREIGN KEY (lojaid) REFERENCES  loja(id) ON DELETE NO ACTION 
);


CREATE TABLE centrodecusto(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(50) NOT NULL
);

CREATE TABLE fornecedor(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	cnpj VARCHAR(14) NOT NULL,
	logradouro VARCHAR(200) NOT NULL,
	telefonecontato VARCHAR(20) NOT NULL,
	email VARCHAR(100) NOT NULL
);

CREATE TABLE documentofiscal(
	id INT PRIMARY KEY AUTO_INCREMENT,
	chave VARCHAR(44) NOT NULL,
	xml TEXT NOT NULL
);

CREATE TABLE meiopagamento(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(50) NOT NULL,
	tempocompensacao INT NOT NULL,
	podeparcelar BOOLEAN NOT NULL
);

CREATE TABLE movimentacaofinanceira(
	id INT PRIMARY KEY AUTO_INCREMENT,
	docfiscalid INT NOT NULL,
	lojaid INT NOT NULL,
	valortotal NUMERIC(10,2) NOT NULL,
	datamovimentacao DATE NOT NULL,
	parcelanumero INT NOT NULL,
	numparcelas INT NOT NULL,
	valorparcela NUMERIC(10,2) NOT NULL, 
	FOREIGN KEY (docfiscalid) REFERENCES documentofiscal(id) ON DELETE NO ACTION,
	FOREIGN KEY (lojaid) REFERENCES loja(id) ON DELETE CASCADE
);

CREATE TABLE movimentacaofinanceiraentrada(
	id INT PRIMARY KEY AUTO_INCREMENT,
	movimentacaoid INT NOT NULL,
	meiopagamentoid INT NOT NULL,
	vendedorid INT NOT NULL,
	consumidorid INT NOT NULL,
	FOREIGN KEY (movimentacaoid) REFERENCES movimentacaofinanceira(id) ON DELETE CASCADE,
	FOREIGN KEY (meiopagamentoid) REFERENCES meiopagamento(id) ON DELETE NO ACTION,
	FOREIGN KEY (vendedorid) REFERENCES funcionario(id) ON DELETE NO ACTION,
	FOREIGN KEY (consumidorid) REFERENCES consumidor(id) ON DELETE NO ACTION
);

CREATE TABLE movimentacaofinanceirasaida(
	id INT PRIMARY KEY AUTO_INCREMENT,
	centrodecustoid INT NOT NULL,
	solicitanteid INT NOT NULL,
	aprovadorid INT NOT NULL,
	fornecedorid INT NOT NULL,
	movimentacaoid INT NOT NULL,
	FOREIGN KEY (centrodecustoid) REFERENCES centrodecusto(id) ON DELETE NO ACTION,
	FOREIGN KEY (solicitanteid) REFERENCES funcionario(id) ON DELETE NO ACTION,
	FOREIGN KEY (aprovadorid) REFERENCES funcionario(id) ON DELETE NO ACTION,
	FOREIGN KEY (fornecedorid) REFERENCES fornecedor(id) ON DELETE NO ACTION,
	FOREIGN KEY (movimentacaoid) REFERENCES movimentacaofinanceira(id) ON DELETE CASCADE
);


COMMIT;