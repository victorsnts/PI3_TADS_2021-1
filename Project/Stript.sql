CREATE TABLE cliente (
    cod INT NOT NULL GENERATED ALWAYS AS IDENTITY unique,
    nome VARCHAR(255) NOT NULL,
    data_nasc DATE,
    telefone VARCHAR(11) NOT NULL,
    email VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL unique,
    cep VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    numero INTEGER NOT NULL,
    uf VARCHAR(2) NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    filial_cadastro INTEGER NOT NULL ,
    PRIMARY KEY (cod, cpf)
);

INSERT INTO INSTRUVERSE.CLIENTE (NOME, DATA_NASC, TELEFONE, EMAIL, CPF, CEP, ENDERECO, NUMERO, UF, BAIRRO, CIDADE, FILIAL_CADASTRO) 
	VALUES ('Victor Freitas dos Santos', '1999-11-16', '11996707781', 'vfreitass16@icloud.com', '50011452870', '04444000', 'Rua miguel Yunes', 485, 'SP', 'Usina Piratininga', 'Sao Pulop', 1)

INSERT INTO INSTRUVERSE.CLIENTE (NOME, DATA_NASC, TELEFONE, EMAIL, CPF, CEP, ENDERECO, NUMERO, UF, BAIRRO, CIDADE, FILIAL_CADASTRO) 
	VALUES ('Lucas Freitas dos Santos', '2016-10-10', '11944440000', 'lucas@icloud.com', '19216809827', '04444000', 'Rua miguel Yunes', 485, 'SP', 'Usina Piratininga', 'Sao Pulop', 2)


CREATE TABLE fornecedor (
    cod INT GENERATED ALWAYS AS IDENTITY not null primary key,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255) NOT NULL,
    data_registro DATE,
    nome_contato VARCHAR(255) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    email VARCHAR(255) NOT NULL,
    site VARCHAR(255) NOT NULL,
    cnpj VARCHAR(14) NOT NULL unique,
    cep VARCHAR(8) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    numero INTEGER NOT NULL,
    pais VARCHAR(255) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    filial_cadastro INTEGER NOT NULL
);


INSERT INTO FORNECEDOR (RAZAO_SOCIAL, NOME_FANTASIA, DATA_REGISTRO, NOME_CONTATO, TELEFONE, EMAIL, SITE, CNPJ, CEP, ENDERECO, NUMERO, PAIS, UF, BAIRRO, CIDADE, FILIAL_CADASTRO) 
    VALUES ('Ambsssev SA', 'AsssMBEV', '2021-04-25', 'Amsssanda', '1156626262', 'Amanda@amasbev.com', 'ambasev.com.br', '11111111111111', '12344', 'Rua teste do sa', 2334, 'assaa', 'SP', 'testeas123', 'Araraasquara', 2)


Create TABLE usuario (
    cod int GENERATED ALWAYS AS IDENTITY not null primary key,
    nome VARCHAR(255) NOT NULL,
    filial INTEGER NOT NULL ,
    perfil VARCHAR(255) NOT NULL,
    login VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    email VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    status VARCHAR(255) NOT NULL
);
INSERT INTO USUARIO (NOME, FILIAL, PERFIL, LOGIN, SENHA, TELEFONE, EMAIL, CPF, STATUS) 
    VALUES ('bruna', 1, 'Vendedor(a)', 'bruna.oliveira', '123', '123123123', 'bruna@123.com', '12345678912', 'Ativo')


CREATE TABLE produto (
    cod INT GENERATED ALWAYS AS IDENTITY not null primary key,
    filial INTEGER NOT NULL ,
    nome VARCHAR(255) NOT NULL,
    marca VARCHAR(255) NOT NULL,
    cod_fornecedor INT NOT NULL,
    custo DOUBLE NOT NULL,
    preco DOUBLE NOT NULL,
    quantidade INTEGER NOT NULL,
    comissao DOUBLE NOT NULL
);

ALTER TABLE produto ADD FOREIGN KEY (cod_fornecedor) REFERENCES fornecedor(COD);

INSERT INTO PRODUTO (NOME, MARCA, COD_FORNECEDOR, CUSTO, PRECO, QUANTIDADE, COMISSAO) 
    VALUES ('TesteNOme', 'TesteMarca', 3, 3, 12.5, 34.6, 12, 1.5)




