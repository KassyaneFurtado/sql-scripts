-- CRIANDO TABELA
CREATE TABLE marcas (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL UNIQUE,
site VARCHAR (100),
telefone VARCHAR(15)
);

CREATE TABLE produtos (
id INTEGER PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(100) NOT NULL, 
preco REAL, 
estoque INTEGER DEFAULT 0
);

-- ALTERANDO TABELA

ALTER TABLE produtos ADD COLUMN id_marca INTEGER NOT NULL;

ALTER TABLE produtos MODIFY COLUMN nome VARCHAR(150);

-- ALTERANDO A TABELA ESPECIFICANDO QUAL A CHAVE ESTRANGEIRA

ALTER TABLE produtos MODIFY ADD FOREIGN KEY id_marca REFERENCES marcas(id);

CREATE TABLE controle (
id INTEGER PRIMARY KEY,
data_entrada DATE
);

-- O DROP É UTLIZADO PARA APAGAR TABELAS
DROP TABLE controle;

-- DROP CONDICIONAL
DROP TABLE IF EXISTS controle;

-- CRIANDO UM INDICE PARA FACILITAR CONSULTAS
CREATE INDEX idx_produtos_nome
ON produtos (nome);

-- INSERIR DADOS NA TABELA
INSERT INTO marcas 
    (nome, SITE, TELEFONE)
VALUES
    ('Apple', 'apple.com','0800-761-0867'),
    ('Del', 'dell.com.br', '0800-970-33550'),
    ('Herman Miller', 'hermanmiller.com.br', '(11) 3474-8043'),
    ('Shure', 'shuere.com.br', '0800-970-3355');
    
INSERT INTO produtos
VALUES
    ('Iphone 16 Pro Apple (256GB) - Titãnio Preto', 9299.99, 100, 1);
    
    
    
INSERT INTO produtos
    (nome, preco, estoque, id_marca)
VALUES
    ('MacBook Air 15 M2 (8GB RAM, 512GB SSD) - Prateado', 8899.99, 23, 1),
    ('Notebook Inspiron 16 Plus', 10398.00, 300, 2),
    ('Cadeira Aeron - Grafite', 15540.00, 8, 3),
    ('Microfone MV7 USB', 2999.99, 70, 4),
    ('Microfone SM7B', 5579.99, 30, 4),
    ('Iphone 15 Apple (128GB) - Preto', 4599.00, 50, 1);

DROP TABLE produtos_apple;

-- UPDATE *É IMPORTANTE TER ATENÇÃO AO UTILIZAR ESSE COMANDO, POIS DEVE-SE ESPECIFICAR ONDE DEVE SER FEITA A ATUALIZAÇÃO CASO O CONTRÁRIO TODO O BANCO DE DADOS SERÁ ALTERADO*

UPDATE produtos
SET nome = 'Microfone SM7B Preto'
WHERE id=6; 
    
UPDATE produtos
SET nome ='Iphone 16 Pro Apple (256GB) - Titânio Preto'
WHERE nome='Iphone 16 Pro Apple (256GB) - Titãnio Preto';

UPDATE produtos
SET estoque = estoque + 10;

UPDATE produtos
SET estoque = estoque + 1
WHERE id_marca = 1;

-- REMOVER REGISTROS

DELETE FROM produtos
WHERE id =1;

CREATE table clientes (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
email VARCHAR(150) UNIQUE NOT NULL,
cidade VARCHAR (200),
data_nascimento DATE
);

CREATE TABLE pedidos (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
data_pedido DATE DEFAULT (NOW()),
id_cliente INTEGER,
valor_total REAL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);
    
CREATE TABLE itens_pedido (
id_pedido INTEGER,
id_produto INTEGER,
quantidade INTEGER,
preco_unitario REAL,
FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
FOREIGN KEY (id_produto) REFERENCES produtos(id),
PRIMARY KEY (id_pedido, id_produto)
);   

INSERT INTO produtos
VALUES
    (1,'Iphone 16 Pro Apple (256GB) - Titãnio Preto', 9299.99, 100, 1);

INSERT INTO clientes (nome, email, cidade) VALUES
('João Pereira', 'joao@exemplo.com.br', 'Rio de Janeiro'),
('Ana Costa', 'ana@costa.com', 'São Paulo'),
('Carlos Souza', 'carlos@gmail.com', 'Belo Horizonte'),
('Vanessa Weber', 'vanessa@codigofonte.tv', 'São José dos Campos'),
('Gabriel Fróes', 'gabriel@codigofonte.tv', 'São José dos Campos');

INSERT INTO pedidos (id_cliente, valor_total) VALUES
(1,5500.00),
(2,2000.00);

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00),
(1, 2, 1, 2000.00),
(2, 2, 1, 2000.00);   