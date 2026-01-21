# 🛒 E-commerce Database - Projeto Lógico

> Sistema de banco de dados completo para gerenciamento de e-commerce com suporte a múltiplos papéis (cliente, vendedor, fornecedor).

## 📋 Sobre o Projeto

Este é um banco de dados MySQL projetado para um e-commerce que permite:
- Gerenciar clientes (Pessoa Física e Jurídica)
- Controlar vendedores e seus pedidos
- Administrar fornecedores e produtos
- Acompanhar estoque e entregas
- Processar pagamentos diversos

**Diferencial:** O sistema detecta automaticamente quando uma mesma pessoa/empresa atua em múltiplos papéis (ex: vendedor que também é fornecedor MEI).

## 🏗️ Estrutura do Banco

### Entidades Principais

| Tabela | Descrição | Registros |
|--------|-----------|-----------|
| 👥 **cliente** | Clientes PF e PJ (CPF ou CNPJ em um único campo) | 11 |
| 💼 **vendedor** | Funcionários que vendem | 5 |
| 🏭 **fornecedor** | Empresas que fornecem produtos | 8 |
| 📦 **produto** | Catálogo de produtos | 25 |
| 🏷️ **categoria** | Categorias dos produtos | 19 |
| 📊 **estoque** | Controle de inventário | 25 |

### Transações

| Tabela | Descrição | Registros |
|--------|-----------|-----------|
| 🛍️ **pedido** | Pedidos realizados | 24 |
| 📝 **item_pedido** | Produtos por pedido | 50+ |
| 💳 **pagamento** | Pagamentos processados | 24 |
| 🚚 **entrega** | Rastreamento de entregas | 24 |

### Relacionamentos

| Tabela | Descrição |
|--------|-----------|
| 🔗 **produto_fornecedor** | Vincula produtos aos fornecedores (com preço e prazo) |
| 💰 **forma_pagamento** | Formas de pagamento cadastradas por cliente |

## ✨ Características Especiais

### 🔄 Detecção de Múltiplos Papéis
O sistema identifica quando:
- Um **vendedor** também é **fornecedor** (MEI/Empresário Individual)
- Uma empresa é **cliente** e **fornecedor** (compra e revende)

### 📊 Classificações Inteligentes
Queries com análises automáticas:
- 🏆 Classificação de clientes (Novo, Regular, VIP, Premium)
- 📈 Performance de vendedores e fornecedores
- ⚠️ Alertas de estoque crítico
- 💹 Análise de margem de lucro

## 🚀 Como Usar

### 1️⃣ Criar o Banco
```sql
USE seu_database;
-- Execute o script de criação das tabelas
```

### 2️⃣ Popular com Dados
```sql
-- Execute o script de população
-- Já inclui dados realistas com interseções
```

### 3️⃣ Consultas Prontas
O projeto inclui queries para responder:
- ❓ Quantos pedidos cada cliente fez?
- 🤔 Algum vendedor também é fornecedor?
- 📦 Relação produtos × fornecedores × estoque
- 🏭 Quais produtos cada fornecedor oferece?

## 📁 Arquivos do Projeto

```
📂 projeto-ecommerce/
├── 📄 criar_tabelas.sql      # Estrutura do banco
├── 📄 popular_dados.sql      # Dados de exemplo
├── 📄 queries_analise.sql    # Consultas prontas
└── 📄 README.md              # Este arquivo
```

## 🎯 Casos de Uso

### Exemplo Real no Sistema
**Roberto Silva Santos:**
- É **vendedor** (CPF: 123.456.789-01)
- Abriu MEI: **Roberto Silva Santos ME** (CNPJ: 12.345.678/0001-91)
- Fornece produtos eletrônicos
- Vende seus próprios produtos na plataforma

Este tipo de interseção é detectado automaticamente pelas queries!

## 💡 Conceitos Aplicados

✅ Normalização de dados (3FN)  
✅ Chaves primárias e estrangeiras  
✅ Relacionamentos N:N (produto ↔ fornecedor)  
✅ Constraints e validações (CHECK, UNIQUE)  
✅ Agregações avançadas (GROUP BY, HAVING)  
✅ JOINs múltiplos (INNER, LEFT)  
✅ CASE WHEN para classificações  
✅ Subconsultas (EXISTS, subquery)

## 🛠️ Tecnologias

- **MySQL 8.0+**
- SQL puro (sem ORMs)
- Suporte a transações ACID

## 📌 Notas Importantes

⚠️ O campo `cpf_cnpj` aceita 11 (PF) ou 14 (PJ) dígitos  
⚠️ Validação via CHECK constraint garante tipo correto  
⚠️ Vírgulas sempre no início da linha (padrão do projeto)  
⚠️ Comentários explicativos em português

## 👨‍💻 Autor

Projeto desenvolvido como parte de estudos em Modelagem de Dados e SQL.

---

**Dica:** Explore as queries de interseção para descobrir relacionamentos interessantes entre as entidades! 🔍
