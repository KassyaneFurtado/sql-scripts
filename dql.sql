-- UTILIZANDO O COMANDO SELECT
SELECT * FROM marcas;
    
SELECT id, nome FROM marcas;

SELECT id, nome FROM marcas WHERE id=1;

SELECT id, nome FROM marcas WHERE id > 2;

CREATE TABLE produtos_apple (
nome VARCHAR(150) NOT NULL,
estoque INTEGER DEFAULT 0
);

INSERT INTO produtos_apple
SELECT nome, estoque FROM produtos WHERE id_marca=1;

TRUNCATE TABLE produtos_apple;

SELECT * FROM produtos_apple;

-- EVOLUINDO NO SELECT
SELECT *
FROM produtos
WHERE estoque < 100;

SELECT *
FROM produtos
WHERE estoque <> 100;

SELECT *
FROM produtos
WHERE 
    estoque < 80 
    AND preco > 3000;
    
SELECT * 
FROM produtos
WHERE 
    nome LIKE 'Iphone%';
    
SELECT * 
FROM produtos
WHERE 
    nome LIKE '%Apple%';
    
-- ORDENAR A QUERY
SELECT * 
FROM produtos
ORDER BY estoque ASC;

SELECT * 
FROM produtos
ORDER BY estoque DESC;

-- LIMITAR A QUANTIDADE DE RESULTADOS
SELECT * 
FROM produtos
ORDER BY estoque ASC
LIMIT 5;

-- JUNÇÃO DE TABELAS (JOIN)
SELECT
    clientes.nome,
    pedidos.valor_total
FROM
    clientes
    INNER JOIN pedidos ON clientes.id = pedidos.id_cliente;
    
-- SUBQUERY
SELECT
    nome, preco
FROM 
    produtos
WHERE id_marca IN (SELECT id FROM marcas WHERE nome = 'Apple' OR nome = 'Dell');

-- LEFT JOIN
SELECT
    clientes.nome,
    pedidos.valor_total
FROM
    clientes
    LEFT JOIN pedidos ON
    clientes.id = pedidos.id_cliente;
    
-- RIGHT JOIN
SELECT
    clientes.nome,
    pedidos.valor_total
FROM
    clientes
    RIGHT JOIN pedidos ON
    clientes.id = pedidos.id_cliente;
    
-- FULL JOIN NO MYSQL

SELECT
    clientes.nome,
    pedidos.valor_total
FROM
    clientes
    LEFT JOIN pedidos ON
    clientes.id = pedidos.id_cliente
UNION 

SELECT
    clientes.nome,
    pedidos.valor_total
FROM
    clientes
    RIGHT JOIN pedidos ON
    clientes.id = pedidos.id_cliente;
    
-- FUNÇÕES AGREGADAS E AGRUPAMENTOS

SELECT
    cidade
FROM
    clientes
GROUP BY cidade;

SELECT
    cidade,
    COUNT(*) as numero_clientes
FROM
    clientes
GROUP BY cidade;

SELECT  
    DATE_FORMAT(data_pedido, '%Y-%m') as mes,
    AVG(valor_total) as media_vendas
FROM
    pedidos
GROUP BY mes;

SELECT SUM(valor_total)/COUNT(valor_total) FROM pedidos;

SELECT MAX(valor_total) AS maior_pedido FROM pedidos;

SELECT MIN(valor_total) AS menor_pedido FROM pedidos;

SELECT
    nome,
    estoque
FROM
    produtos
WHERE
    estoque < (SELECT AVG(estoque) FROM produtos);

SELECT
    c.cidade,
    SUM(p.valor_total) AS total_vendas
FROM
    clientes AS c
    INNER JOIN pedidos AS p ON c.id = p.id_cliente
WHERE
    c.cidade IN ('São José dos Campos', 'Rio de Janeiro')
GROUP BY c.cidade;


SELECT
    c.cidade,
    SUM(p.valor_total) AS total_vendas
FROM
    clientes AS c
    INNER JOIN pedidos AS p ON c.id = p.id_cliente
WHERE
    c.cidade IN ('São José dos Campos', 'Rio de Janeiro')
GROUP BY c.cidade
HAVING total_vendas < 7000;