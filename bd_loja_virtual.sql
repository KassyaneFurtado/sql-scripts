-- RELACIONAMENTO UM PARA UM
CREATE TABLE tb_produtos(
id_produto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
produto VARCHAR(200) NOT NULL,
valor FLOAT (8,2) NOT NULL
);

CREATE TABLE tb_descricoes_tecnicas(
id_descricao_tecnica INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_produto INT NOT NULL,
descricao_tecnica TEXT NOT NULL,
FOREIGN KEY (id_produto) REFERENCES tb_produtos(id_produto)
);

INSERT INTO tb_produtos(produto, valor) VALUES ('Notebook Dell Inspiron Ultrafino Intel Core i7, 16GB RAM e 240GB SSD', 3500.00);

INSERT INTO tb_produtos(produto, valor) VALUES ('Smart TV LED 40" Samsung Full HD 2 HDMI 1 USB Wi-Fi Integrado', 1475.54);

INSERT INTO tb_produtos(produto, valor) VALUES ('Smartphone LG K10 Dual Chip Android 7.0 4G Wi-Fi Câmera de 13MP', 629.99);


INSERT INTO tb_descricoes_tecnicas(id_produto, descricao_tecnica) VALUES (1, 'O novo Inspiron Dell oferece um design elegante e tela infinita que amplia seus sentidos, mantendo a sofisticação e medidas compactas...');

INSERT INTO tb_descricoes_tecnicas(id_produto, descricao_tecnica) VALUES (2, 'A smart TV da Samsung possui tela de 40" e oferece resolução Full HD, imagens duas vezes melhores que TVs HDs padrão...');

INSERT INTO tb_descricoes_tecnicas(id_produto, descricao_tecnica) VALUES (3, 'Saia da mesmice. O smartphone LG está mais divertido, rápido, fácil, cheio de selfies e com tela HD de incríveis 5,3"...');

-- RELACIONAMENTO DE UM PARA MUITOS
CREATE TABLE tb_imagens(
id_imagem INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_produto INT NOT NULL,
url_imagem VARCHAR(200) NOT NULL,
FOREIGN KEY (id_produto) REFERENCES tb_produtos(id_produto)
);

INSERT INTO
    tb_imagens (id_produto, url_imagem)
VALUES
    (1, 'notebook_1.jpg'),
    (1, 'notebook_2.jpg'),
    (1, 'notebook_3.jpg'),
    (2, 'smarttv_1.jpg'),
    (2, 'smarttv_2.jpg'),
    (3, 'smartphone_1.jpg');

-- RELACIONAMENTO DE MUITOS PARA MUITOS

CREATE TABLE tb_clientes (
id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (100) NOT NULL,
idade INTEGER(3) NOT NULL);

CREATE TABLE tb_pedidos(
id_pedido INT NOT NULl PRIMARY KEY AUTO_INCREMENT,
id_cliente INT NOT NULl,
FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente),
data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tb_pedidos_produtos (
id_pedido INT NOT NULL,
FOREIGN KEY (id_pedido) REFERENCES tb_pedidos (id_pedido),
id_produto INT NOT NULL,
FOREIGN KEY (id_produto) REFERENCES tb_produtos (id_produto)
);


INSERT INTO tb_clientes(nome, idade) VALUES('Jorge', 29);	
INSERT INTO tb_pedidos(id_cliente) VALUES(1);	
INSERT INTO tb_pedidos_produtos(id_pedido, id_produto) VALUES(1, 2);
INSERT INTO tb_pedidos_produtos(id_pedido, id_produto) VALUES(1, 3);
INSERT INTO tb_pedidos(id_cliente) VALUES(1);
INSERT INTO tb_pedidos_produtos(id_pedido, id_produto) VALUES(2,3);
INSERT INTO tb_clientes(nome, idade) VALUES('Jamilton', 30);
INSERT INTO tb_pedidos(id_cliente) VALUES(2);
INSERT INTO tb_pedidos_produtos(id_pedido, id_produto) VALUES(3,1);

-- JOINS

SELECT
    *
FROM
    tb_clientes LEFT JOIN tb_pedidos ON (tb_clientes.id_cliente = tb_pedidos.id_cliente);
    
SELECT
    *
FROM
    tb_produtos LEFT JOIN tb_imagens ON (tb_produtos.id_produto = tb_imagens.id_produto);

SELECT
    *
FROM
    tb_clientes LEFT JOIN tb_pedidos ON (tb_clientes.id_cliente = tb_pedidos.id_cliente);
    
SELECT
    *
FROM
    tb_clientes RIGHT JOIN tb_pedidos ON (tb_clientes.id_cliente = tb_pedidos.id_cliente);

INSERT INTO 
    tb_produtos (produto, valor) 
VALUES
    ('HD Externo Portátil Seagate Expansion 1TB USB 3.0', 274.90);
    
SELECT
    *
FROM
    tb_pedidos LEFT JOIN tb_pedidos_produtos ON (tb_pedidos.id_pedido = tb_pedidos_produtos.id_produto);

SELECT
    *
FROM
    tb_pedidos LEFT JOIN tb_pedidos_produtos ON (tb_pedidos.id_pedido = tb_pedidos_produtos.id_produto)
    LEFT JOIN tb_produtos ON (tb_pedidos_produtos.id_produto = tb_produtos.id_produto);

SELECT
    *
FROM
    tb_pedidos RIGHT JOIN tb_pedidos_produtos ON (tb_pedidos.id_pedido = tb_pedidos_produtos.id_produto)
    LEFT JOIN tb_produtos ON (tb_pedidos_produtos.id_produto = tb_produtos.id_produto);

SELECT
    *
FROM
    tb_pedidos RIGHT JOIN tb_pedidos_produtos ON (tb_pedidos.id_pedido = tb_pedidos_produtos.id_produto)
    RIGHT JOIN tb_produtos ON (tb_pedidos_produtos.id_produto = tb_produtos.id_produto);

SELECT
    *
FROM
    tb_pedidos INNER JOIN tb_pedidos_produtos ON (tb_pedidos.id_pedido = tb_pedidos_produtos. id_pedido);
    
SELECT
    *
FROM
    tb_pedidos INNER JOIN tb_pedidos_produtos ON (tb_pedidos.id_pedido = tb_pedidos_produtos. id_pedido)
    INNER JOIN tb_produtos ON (tb_pedidos_produtos.id_produto = tb_produtos.id_produto);   
    
-- ALIAS

SELECT
    *
FROM
    tb_produtos LEFT JOIN tb_descricoes_tecnicas ON (tb_produtos.id_produto = tb_descricoes_tecnicas.id_produto);
    
   
SELECT
    *
FROM
    tb_produtos AS p LEFT JOIN tb_descricoes_tecnicas AS dt ON (p.id_produto = dt.id_produto);
    
SELECT
    p.id_produto,
    p.produto,
    p.valor,
    dt.descricao_tecnica
FROM
    tb_produtos AS p LEFT JOIN tb_descricoes_tecnicas AS dt ON (p.id_produto = dt.id_produto);
    
SELECT
    p.id_produto,
    p.produto,
    p.valor,
    dt.descricao_tecnica
FROM
    tb_produtos AS p LEFT JOIN tb_descricoes_tecnicas AS dt ON (p.id_produto = dt.id_produto)
WHERE 
    p.valor >= 500;
    
    
SELECT
    p.id_produto,
    p.produto,
    p.valor,
    dt.descricao_tecnica
FROM
    tb_produtos AS p LEFT JOIN tb_descricoes_tecnicas AS dt ON (p.id_produto = dt.id_produto)
WHERE 
    p.valor >= 500
ORDER BY
    p.valor ASC;
    