# 📊 Projeto – Análise de Vendas com SQL (MySQL)

## 🚀 Descrição 
Este projeto tem como objetivo demonstrar habilidades práticas em modelagem de banco de dados, SQL analítico e análise de dados, simulando um sistema de vendas com clientes, produtos, vendedores e itens de venda.

O foco está na criação de um banco de dados relacional no MySQL, no carregamento de dados fictícios em volume realista e na elaboração de queries analíticas para extração de insights de negócio.

---

## 🗂️ Estrutura do Projeto

```
├── schema.sql        # Criação do banco de dados e tabelas (DDL)
├── inserts.sql       # Inserção de dados fictícios (DML)
├── queries.sql       # Consultas analíticas e de negócio
└── README.md         # Documentação do projeto
```

---

## 🎯 Objetivos do Projeto

- Praticar modelagem relacional
- Trabalhar com dados em escala realista
- Desenvolver queries analíticas
- Demonstrar capacidade de gerar insights de negócio com SQL
- Criar um projeto sólido para portfólio profissional

---

## 🧱 Modelagem do Banco de Dados

O banco de dados foi modelado seguindo boas práticas de normalização e integridade referencial, com as seguintes entidades principais:

- clientes – dados cadastrais dos clientes
- produtos – catálogo de produtos disponíveis para venda
- vendedores – responsáveis pelas vendas
- vendas – registros das transações realizadas
- itens_venda – detalhamento dos produtos vendidos em cada venda
  
Relacionamentos principais:

- Um cliente pode ter várias vendas
- Uma venda pode conter vários itens
- Cada item de venda está associado a um produto
- Cada venda é atribuída a um vendedor

---

## 📥 Carga de Dados

O projeto utiliza dados fictícios distribuídos de forma realista, incluindo:

- ~80 clientes
- 20 produtos
- 244 vendas
- 400+ registros em itens_venda

---

## ⚠️ Observação importante:

Nem todas as vendas possuem itens associados. Isso foi feito propositalmente para simular cenários reais, como:

- vendas canceladas
- vendas incompletas
- registros criados antes da finalização

---

## 📈 Consultas Analíticas (queries.sql)
O arquivo queries.sql contém consultas que respondem a perguntas reais de negócio, incluindo:

- Receita total por produto
- Quantidade vendida por produto
- Receita mensal
- Receita acumulada ao longo do tempo (Window Function)
- Clientes com maior volume de compras
- Vendedores com maior faturamento
- Identificação de vendas sem itens associados

Destaque técnico:
- Uso de JOINs complexos
- Agregações com SUM, COUNT
- Window Functions (SUM() OVER)
- Subqueries e aliases
- Ordenação e agrupamento para análise temporal

---

## 🔍 Exemplo de Consulta Avançada
``` sql
SELECT
  mes,
  receita_mensal,
  SUM(receita_mensal) OVER (ORDER BY mes) AS receita_acumulada
FROM (
  SELECT
    DATE_FORMAT(v.data_venda, '%Y-%m') AS mes,
    SUM(iv.quantidade * iv.preco_unitario) AS receita_mensal
  FROM vendas v
  JOIN itens_venda iv ON v.id_venda = iv.id_venda
  GROUP BY mes
) t;
```
Essa consulta calcula a receita mensal e a receita acumulada ao longo do tempo, demonstrando domínio de SQL analítico moderno.

---

## ▶️ Como Executar o Projeto

- Clone o repositório:
  ```bash
  git clone https://github.com/seu-usuario/nome-do-repositorio.git

- Abra o MySQL Workbench
  
- Execute os scripts na ordem:
schema.sql, inserts.sql, queries.sql

Analise os resultados das consultas no MySQL Workbench

---

## 🛠️ Tecnologias Utilizadas

- MySQL 8.0+
- MySQL Workbench
- SQL (DDL, DML, JOINs, agregações e Window Functions)
- Git & GitHub

---

## 🚀 Próximos Passos (Evoluções Futuras)

- Integração com Excel / Google Sheets
- Criação de dashboards com base nas queries
- Inclusão de índices para performance
- Criação de views analíticas
- Simulação de regras de negócio (ex: vendas obrigatoriamente com itens)

---

## 🧑‍💻 Autor

**Eduardo Ribeiro**
- 📍 Brasil
- 🎯 Estudante de TI | Foco em Análise de Dados
- 🔗 GitHub: https://github.com/eduardo-hribeiro

---

🗓️ Última atualização

Última atualização: Dezembro de 2025
