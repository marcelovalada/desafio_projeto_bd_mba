-- Criação do banco de dados
CREATE DATABASE helpdesk;

-- Seleciona o banco de dados
\c helpdesk

-- Criação das tabelas
CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    prioridade VARCHAR(20) NOT NULL CHECK (prioridade IN ('baixa', 'media', 'alta'))
);

CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    setor VARCHAR(50) NOT NULL
);

CREATE TABLE tecnico (
    id_tecnico SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    especialidade VARCHAR(100) NOT NULL
);

CREATE TABLE chamado (
    id_chamado SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES usuario(id_usuario),
    id_tecnico INTEGER REFERENCES tecnico(id_tecnico),
    id_categoria INTEGER REFERENCES categoria(id_categoria),
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('aberto', 'em atendimento', 'fechado')),
    data_abertura TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_fechamento TIMESTAMP
);

CREATE TABLE interacao (
    id_interacao SERIAL PRIMARY KEY,
    id_chamado INTEGER REFERENCES chamado(id_chamado),
    role VARCHAR(20) NOT NULL CHECK (role IN ('usuario', 'tecnico')),
    mensagem TEXT NOT NULL,
    data_interacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
