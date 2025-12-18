USE analise_vendas;

-- =========================================
-- Receita Total
-- =========================================
SELECT 
  SUM(iv.quantidade * iv.preco_unitario) AS receita_total
FROM itens_venda AS iv;

-- =========================================
-- Receita Mensal (2024)
-- =========================================
SELECT 
  DATE_FORMAT(v.data_venda, '%Y-%m') AS mes, -- Formato da data
  SUM(iv.quantidade * iv.preco_unitario) AS receita_mensal
FROM vendas AS v
JOIN itens_venda AS iv ON v.id_venda = iv.id_venda
GROUP BY mes
ORDER BY mes;

-- =========================================
-- Receita por Produto
-- =========================================
SELECT 
  p.nome_produto,
  SUM(iv.quantidade * iv.preco_unitario) AS receita_produto
FROM itens_venda AS iv
JOIN produtos AS p ON iv.id_produto = p.id_produto
GROUP BY p.nome_produto
ORDER BY receita_produto DESC;

-- =========================================
-- Receita por Categoria
-- =========================================
SELECT 
  p.categoria,
  SUM(iv.quantidade * iv.preco_unitario) AS receita_categoria
FROM itens_venda AS iv
JOIN produtos AS p ON iv.id_produto = p.id_produto
GROUP BY p.categoria
ORDER BY receita_categoria DESC;

-- =========================================
-- Receita por Vendedor
-- =========================================
SELECT 
  vdr.nome_vendedor,
  SUM(iv.quantidade * iv.preco_unitario) AS receita_vendedor
FROM vendas AS v
JOIN vendedores AS vdr ON v.id_vendedor = vdr.id_vendedor
JOIN itens_venda AS iv ON v.id_venda = iv.id_venda
GROUP BY vdr.nome_vendedor
ORDER BY receita_vendedor DESC;

-- =========================================
-- Receita por Região
-- =========================================
SELECT 
  vdr.regiao,
  SUM(iv.quantidade * iv.preco_unitario) AS receita_regiao
FROM vendas AS v
JOIN vendedores AS vdr ON v.id_vendedor = vdr.id_vendedor
JOIN itens_venda AS iv ON v.id_venda = iv.id_venda
GROUP BY vdr.regiao
ORDER BY receita_regiao DESC;

-- =========================================
-- Ticket Médio por Venda
-- =========================================
select * from vendas;
select * from itens_venda;

SELECT 
  ROUND(AVG(valor_venda), 2) AS ticket_medio
FROM (
  SELECT
    v.id_venda,
    SUM(iv.quantidade * iv.preco_unitario) AS valor_venda
FROM vendas AS v
JOIN itens_venda AS iv ON v.id_venda = iv.id_venda
GROUP BY v.id_venda
) t;

-- =========================================
-- Top 10 Clientes por Faturamento
-- =========================================
SELECT 
  c.nome_cliente,
  SUM(iv.quantidade * iv.preco_unitario) AS faturamento_cliente
FROM vendas AS v
JOIN clientes AS c ON v.id_cliente = c.id_cliente
JOIN itens_venda AS iv ON v.id_venda = iv.id_venda
GROUP BY c.nome_cliente
ORDER BY faturamento_cliente DESC
LIMIT 10;

-- =========================================
-- Faturamento por Tipo de Cliente
-- =========================================
SELECT 
  c.tipo_cliente,
  SUM(iv.quantidade * iv.preco_unitario) AS faturamento
FROM vendas AS v
JOIN clientes AS c ON v.id_cliente = c.id_cliente
JOIN itens_venda AS iv ON v.id_venda = iv.id_venda
GROUP BY c.tipo_cliente
ORDER BY faturamento DESC;

-- =========================================
-- Quantidade de Vendas por Mês
-- =========================================
SELECT 
  DATE_FORMAT(data_venda, '%Y-%m') AS mes,
  COUNT(*) AS total_vendas
FROM vendas
GROUP BY mes
ORDER BY mes;

-- =========================================
-- Produtos mais Vendidos (quantidade)
-- =========================================
SELECT 
  p.nome_produto,
  SUM(i.quantidade) AS total_unidades
FROM itens_venda i
JOIN produtos p ON i.id_produto = p.id_produto
GROUP BY p.nome_produto
ORDER BY total_unidades DESC;

-- =========================================
-- Receita Acumulada ao Longo do Tempo 
-- =========================================
SELECT
  mes,
  receita_mensal,
  SUM(receita_mensal) OVER (ORDER BY mes) AS receita_acumulada
FROM (
  SELECT 
    DATE_FORMAT(v.data_venda, '%Y-%m') AS mes,
    SUM(iv.quantidade * iv.preco_unitario) AS receita_mensal
  FROM vendas AS v
  JOIN itens_venda AS iv ON v.id_venda = iv.id_venda
  GROUP BY mes
) t;