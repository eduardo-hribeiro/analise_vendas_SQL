CREATE DATABASE IF NOT EXISTS analise_vendas;

USE analise_vendas;

-- =========================================
-- TABELA: produtos
-- =========================================
DROP TABLE IF EXISTS produtos;

CREATE TABLE produtos (
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(150) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);
DESC produtos;

-- =========================================
-- TABELA: clientes
-- =========================================
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(150) NOT NULL,
    email VARCHAR(150),
    cidade VARCHAR(100),
    estado CHAR(2),
    data_cadastro DATE,
    tipo_cliente VARCHAR(50)
);
DESC clientes;

-- =========================================
-- TABELA: vendedores
-- =========================================
DROP TABLE IF EXISTS vendedores;

CREATE TABLE vendedores (
	id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_vendedor VARCHAR(150) NOT NULL,
    regiao VARCHAR(50)
);
DESC vendedores;

-- =========================================
-- TABELA: vendas
-- =========================================
DROP TABLE IF EXISTS vendas;

CREATE TABLE vendas (
	id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);
DESC vendas;

-- =========================================
-- TABELA: itens_venda
-- =========================================
DROP TABLE IF EXISTS itens_venda;

CREATE TABLE itens_venda (
	id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
DESC itens_venda;