-- Limpa todos os dados das tabelas (mantém a estrutura)
-- Ordem correta respeitando foreign keys

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE entrega;
TRUNCATE TABLE pagamento;
TRUNCATE TABLE forma_pagamento;
TRUNCATE TABLE item_pedido;
TRUNCATE TABLE pedido;
TRUNCATE TABLE estoque;
TRUNCATE TABLE produto;
TRUNCATE TABLE categoria;
TRUNCATE TABLE cliente;

SET FOREIGN_KEY_CHECKS = 1;
