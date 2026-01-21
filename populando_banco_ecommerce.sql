-- Usado IA para popular o banco de dados de e-commerce com dados realistas.

-- Categorias
INSERT INTO categoria (nome) VALUES 
('Alimentos e Bebidas'),('Automotivo'),('Bebês'),
('Beleza e Cuidados Pessoais'),('Bolsas Malas e Mochilas'),
('Brinquedos e Jogos'),('Casa Jardim e Limpeza'),
('Celulares e Comunicação'),('Computadores e Informática'),
('Cozinha'),('Eletrônicos, TV e Áudio'),
('Esportes, Aventura e Lazer'),('Ferramentas e Construção'),
('Filmes, Séries e Música'),('Games e Consoles'),
('Livros'),('Papelaria e Escritório'),('PetShop'),
('Roupas, Calçados e Acessórios');

-- Clientes Pessoa Física
INSERT INTO cliente (email, telefone, tipo_pessoa, cpf_cnpj, nome_completo, data_nascimento, endereco, complemento, bairro, cidade, estado, cep) VALUES
('joao.silva@email.com', '44999881234', 'PF', '12345678901', 'João da Silva Santos', '1985-03-15', 'Rua das Flores, 123', 'Apt 201', 'Centro', 'Maringá', 'PR', '87015000'),
('maria.souza@email.com', '44998772345', 'PF', '23456789012', 'Maria Souza Oliveira', '1990-07-22', 'Av. Brasil, 456', NULL, 'Zona 7', 'Maringá', 'PR', '87020100'),
('pedro.costa@email.com', '44997663456', 'PF', '34567890123', 'Pedro Costa Lima', '1988-11-30', 'Rua Paraná, 789', 'Casa', 'Jardim Alvorada', 'Maringá', 'PR', '87025300'),
('ana.santos@email.com', '44996554567', 'PF', '45678901234', 'Ana Paula Santos', '1995-02-14', 'Rua XV de Novembro, 321', 'Apt 102', 'Centro', 'Maringá', 'PR', '87013000'),
('carlos.lima@email.com', '44995445678', 'PF', '56789012345', 'Carlos Eduardo Lima', '1982-09-05', 'Av. Cerro Azul, 654', NULL, 'Zona 3', 'Maringá', 'PR', '87030500');

-- Clientes Pessoa Jurídica
INSERT INTO cliente (email, telefone, tipo_pessoa, cpf_cnpj, nome_completo, nome_fantasia, inscricao_estadual, endereco, bairro, cidade, estado, cep) VALUES
('contato@techsolutions.com', '44333221100', 'PJ', '12345678000199', 'Tech Solutions Informática LTDA', 'Tech Solutions', '9012345678', 'Av. Duque de Caxias, 100', 'Centro', 'Maringá', 'PR', '87015000'),
('vendas@supermax.com', '44333229988', 'PJ', '23456789000188', 'Super Max Comércio e Distribuição SA', 'Super Max', '9012345679', 'Rua Pioneiro José Alves, 200', 'Industrial', 'Maringá', 'PR', '87065000'),
('financeiro@construtora.com', '44333228877', 'PJ', '34567890000177', 'Construtora Paraná LTDA', 'Construtora Paraná', '9012345680', 'Av. Colombo, 300', 'Zona 5', 'Maringá', 'PR', '87020000'),
('sac@modafashion.com', '44333227766', 'PJ', '45678901000166', 'Moda Fashion Confecções ME', 'Moda Fashion', '9012345681', 'Rua Santos Dumont, 400', 'Centro', 'Maringá', 'PR', '87014000'),
('info@alimentosbrasil.com', '44333226655', 'PJ', '56789012000155', 'Alimentos Brasil Distribuidora LTDA', 'Alimentos Brasil', '9012345682', 'Rua Pioneiro João Alves, 500', 'Distrito Industrial', 'Maringá', 'PR', '87070000');

-- Vendedores
INSERT INTO vendedor (cpf, nome, email, telefone, comissao_percentual, data_contratacao) VALUES
('11111111111', 'Roberto Vendas', 'roberto@ecommerce.com', '44988881111', 5.00, '2024-01-15'),
('22222222222', 'Fernanda Sales', 'fernanda@ecommerce.com', '44988882222', 6.00, '2024-02-20'),
('33333333333', 'Marcelo Negócios', 'marcelo@ecommerce.com', '44988883333', 5.50, '2024-03-10'),
('44444444444', 'Juliana Comercial', 'juliana@ecommerce.com', '44988884444', 7.00, '2024-04-05'),
('55555555555', 'Ricardo Vendedor', 'ricardo@ecommerce.com', '44988885555', 5.00, '2024-05-12');

-- Fornecedores
INSERT INTO fornecedor (cnpj, razao_social, nome_fantasia, email, telefone, endereco, cidade, estado, cep) VALUES
('11111111000111', 'Eletrônicos Brasil LTDA', 'Eletrônicos BR', 'contato@eletronicosdr.com', '1133334444', 'Av. Paulista, 1000', 'São Paulo', 'SP', '01310100'),
('22222222000122', 'Casa & Lar Distribuidora SA', 'Casa & Lar', 'vendas@casaelar.com', '1144445555', 'Rua Augusta, 2000', 'São Paulo', 'SP', '01304000'),
('33333333000133', 'Brinquedos Felizes LTDA', 'Brinquedos Felizes', 'comercial@brinquedosfelizes.com', '1155556666', 'Av. Rebouças, 3000', 'São Paulo', 'SP', '05402000'),
('44444444000144', 'Moda Total Confecções LTDA', 'Moda Total', 'pedidos@modatotal.com', '1166667777', 'Rua Oscar Freire, 400', 'São Paulo', 'SP', '01426001'),
('55555555000155', 'Editora Saber LTDA', 'Editora Saber', 'distribuidora@editorasaber.com', '1177778888', 'Av. Faria Lima, 1500', 'São Paulo', 'SP', '01452000'),
('66666666000166', 'Tech Supply Importadora LTDA', 'Tech Supply', 'importacao@techsupply.com', '1188889999', 'Rua Vergueiro, 5000', 'São Paulo', 'SP', '04101000');

-- Produtos
INSERT INTO produto (sku, nome, descricao, preco_unitario, flag_infantil, categoria_id, avaliacao_media, dimensoes, peso) VALUES
-- Eletrônicos
('ELET-001', 'Smart TV 50"', 'Smart TV LED 50 polegadas 4K UHD', 2299.90, FALSE, 11, 4.5, '112x65x7cm', 12.5),
('ELET-002', 'Notebook i5', 'Notebook Intel Core i5, 8GB RAM, SSD 256GB', 3499.00, FALSE, 9, 4.7, '35x24x2cm', 1.8),
('ELET-003', 'Smartphone 128GB', 'Smartphone 6.5pol, 128GB, Câmera 48MP', 1899.00, FALSE, 8, 4.3, '15x7x0.8cm', 0.18),
('ELET-004', 'Fone Bluetooth', 'Fone de ouvido Bluetooth com cancelamento de ruído', 249.90, FALSE, 11, 4.6, '20x18x8cm', 0.25),
('ELET-005', 'Mouse Gamer', 'Mouse Gamer RGB 16000 DPI', 189.90, FALSE, 9, 4.4, '13x7x4cm', 0.12),

-- Casa e Cozinha
('CASA-001', 'Jogo de Panelas', 'Jogo de panelas antiaderente 5 peças', 299.90, FALSE, 10, 4.2, '40x30x25cm', 3.5),
('CASA-002', 'Liquidificador', 'Liquidificador 12 velocidades 1000W', 189.00, FALSE, 10, 4.5, '25x20x40cm', 2.8),
('CASA-003', 'Aspirador Robô', 'Aspirador de pó robô inteligente', 1299.00, FALSE, 7, 4.8, '35x35x8cm', 3.2),
('CASA-004', 'Ferro de Passar', 'Ferro a vapor 2400W', 129.90, FALSE, 7, 4.1, '30x15x15cm', 1.5),
('CASA-005', 'Cafeteira Elétrica', 'Cafeteira elétrica 30 xícaras', 159.90, FALSE, 10, 4.3, '25x20x35cm', 2.1),

-- Brinquedos
('BRIN-001', 'Boneca Fashion', 'Boneca com acessórios e roupas', 89.90, TRUE, 6, 4.7, '30x10x8cm', 0.5),
('BRIN-002', 'Carrinho Controle', 'Carrinho de controle remoto escala 1:16', 149.90, TRUE, 6, 4.6, '35x20x15cm', 0.8),
('BRIN-003', 'Lego 500 peças', 'Conjunto Lego criativo 500 peças', 199.90, TRUE, 6, 4.9, '30x25x8cm', 1.2),
('BRIN-004', 'Pelúcia Urso', 'Urso de pelúcia 60cm', 79.90, TRUE, 6, 4.5, '60x40x30cm', 0.6),
('BRIN-005', 'Quebra-cabeça', 'Quebra-cabeça 1000 peças paisagem', 49.90, FALSE, 6, 4.3, '25x20x5cm', 0.4),

-- Roupas
('ROUPA-001', 'Camiseta Básica', 'Camiseta 100% algodão masculina', 39.90, FALSE, 19, 4.2, '30x40x2cm', 0.2),
('ROUPA-002', 'Calça Jeans', 'Calça jeans feminina skinny', 129.90, FALSE, 19, 4.4, '35x45x5cm', 0.5),
('ROUPA-003', 'Tênis Esportivo', 'Tênis para corrida com amortecimento', 249.90, FALSE, 19, 4.6, '32x20x12cm', 0.7),
('ROUPA-004', 'Jaqueta Couro', 'Jaqueta de couro sintético', 299.90, FALSE, 19, 4.5, '40x35x8cm', 0.9),
('ROUPA-005', 'Vestido Social', 'Vestido social feminino midi', 189.90, FALSE, 19, 4.7, '35x50x3cm', 0.4),

-- Livros
('LIVR-001', 'Livro Ficção Sci-Fi', 'Best-seller de ficção científica', 49.90, FALSE, 16, 4.8, '23x16x3cm', 0.5),
('LIVR-002', 'Livro Autoajuda', 'Como desenvolver inteligência emocional', 39.90, FALSE, 16, 4.5, '21x14x2cm', 0.3),
('LIVR-003', 'Livro Infantil', 'Contos ilustrados para crianças', 29.90, TRUE, 16, 4.9, '25x25x1cm', 0.4),
('LIVR-004', 'Livro Culinária', '500 receitas práticas e deliciosas', 59.90, FALSE, 16, 4.6, '25x20x4cm', 0.8),
('LIVR-005', 'Livro História', 'História do Brasil contemporâneo', 69.90, FALSE, 16, 4.4, '23x16x3cm', 0.6);

-- Relacionamento Produto-Fornecedor
INSERT INTO produto_fornecedor (produto_id, fornecedor_id, preco_fornecimento, prazo_entrega_dias, fornecedor_principal, data_inicio) VALUES
-- Eletrônicos fornecidos por Eletrônicos BR e Tech Supply
(1, 1, 1800.00, 5, TRUE, '2024-01-01'),
(1, 6, 1850.00, 7, FALSE, '2024-01-01'),
(2, 1, 2800.00, 5, TRUE, '2024-01-01'),
(2, 6, 2750.00, 7, FALSE, '2024-01-01'),
(3, 1, 1500.00, 3, TRUE, '2024-01-01'),
(3, 6, 1480.00, 5, FALSE, '2024-01-01'),
(4, 1, 180.00, 3, TRUE, '2024-01-01'),
(4, 6, 175.00, 5, FALSE, '2024-01-01'),
(5, 1, 140.00, 3, TRUE, '2024-01-01'),
(5, 6, 135.00, 5, FALSE, '2024-01-01'),

-- Casa e Cozinha fornecidos por Casa & Lar
(6, 2, 220.00, 10, TRUE, '2024-01-01'),
(7, 2, 140.00, 10, TRUE, '2024-01-01'),
(8, 2, 980.00, 15, TRUE, '2024-01-01'),
(9, 2, 95.00, 10, TRUE, '2024-01-01'),
(10, 2, 120.00, 10, TRUE, '2024-01-01'),

-- Brinquedos fornecidos por Brinquedos Felizes
(11, 3, 65.00, 7, TRUE, '2024-01-01'),
(12, 3, 110.00, 7, TRUE, '2024-01-01'),
(13, 3, 150.00, 7, TRUE, '2024-01-01'),
(14, 3, 58.00, 7, TRUE, '2024-01-01'),
(15, 3, 35.00, 7, TRUE, '2024-01-01'),

-- Roupas fornecidas por Moda Total
(16, 4, 25.00, 5, TRUE, '2024-01-01'),
(17, 4, 90.00, 5, TRUE, '2024-01-01'),
(18, 4, 180.00, 5, TRUE, '2024-01-01'),
(19, 4, 220.00, 5, TRUE, '2024-01-01'),
(20, 4, 140.00, 5, TRUE, '2024-01-01'),

-- Livros fornecidos por Editora Saber
(21, 5, 35.00, 3, TRUE, '2024-01-01'),
(22, 5, 28.00, 3, TRUE, '2024-01-01'),
(23, 5, 20.00, 3, TRUE, '2024-01-01'),
(24, 5, 42.00, 3, TRUE, '2024-01-01'),
(25, 5, 50.00, 3, TRUE, '2024-01-01');

-- Estoque
INSERT INTO estoque (produto_id, quantidade_disponivel, quantidade_reservada, localizacao) VALUES
(1, 15, 3, 'A1-P2'), (2, 8, 2, 'A1-P3'), (3, 25, 5, 'A2-P1'), (4, 40, 8, 'A2-P2'), (5, 30, 4, 'A2-P3'),
(6, 20, 2, 'B1-P1'), (7, 12, 1, 'B1-P2'), (8, 6, 1, 'B2-P1'), (9, 18, 2, 'B2-P2'), (10, 22, 3, 'B2-P3'),
(11, 35, 7, 'C1-P1'), (12, 28, 5, 'C1-P2'), (13, 15, 3, 'C1-P3'), (14, 42, 8, 'C2-P1'), (15, 25, 4, 'C2-P2'),
(16, 50, 10, 'D1-P1'), (17, 35, 6, 'D1-P2'), (18, 20, 4, 'D1-P3'), (19, 15, 2, 'D2-P1'), (20, 30, 5, 'D2-P2'),
(21, 45, 8, 'E1-P1'), (22, 38, 6, 'E1-P2'), (23, 60, 12, 'E1-P3'), (24, 28, 5, 'E2-P1'), (25, 33, 7, 'E2-P2');

-- Formas de pagamento para clientes PF
INSERT INTO forma_pagamento (cliente_id, tipo_pagamento, descricao, apelido) VALUES
(1, 'Crédito', 'Visa final 1234', 'Cartão Principal'), (1, 'Pix', 'Chave CPF', 'Pix Pessoal'),
(2, 'Crédito', 'Mastercard final 5678', 'Cartão Trabalho'), (2, 'Débito', 'Conta Corrente Banco do Brasil', 'Débito BB'),
(3, 'Pix', 'Chave Email', 'Pix'), (3, 'Crédito', 'Nubank final 9012', 'Roxinho'),
(4, 'Crédito', 'Elo final 3456', 'Cartão Casa'),
(5, 'Pix', 'Chave Celular', 'Pix Rápido'), (5, 'Boleto bancário', 'Boleto', 'Boleto');

-- Formas de pagamento para clientes PJ
INSERT INTO forma_pagamento (cliente_id, tipo_pagamento, descricao, apelido) VALUES
(6, 'Transferência Bancária', 'Conta PJ Itaú', 'Transferência'), (6, 'Boleto bancário', 'Boleto Empresa', 'Boleto 30 dias'),
(7, 'Pix', 'Chave CNPJ', 'Pix Empresa'), (7, 'Crédito', 'Cartão Corporativo final 7890', 'Corporativo'),
(8, 'Boleto bancário', 'Boleto PJ', 'Boleto'),
(9, 'Crédito', 'Amex Empresarial', 'Amex'),
(10, 'Transferência Bancária', 'Bradesco PJ', 'Transferência');

-- Pedidos
INSERT INTO pedido (cliente_id, vendedor_id, status, data_pedido, valor_subtotal, valor_frete, valor_desconto, valor_total) VALUES
(1, 1, 'Entregue', '2026-01-05 10:30:00', 2299.90, 0.00, 100.00, 2199.90),
(2, 1, 'Entregue', '2026-01-06 14:20:00', 329.80, 15.00, 0.00, 344.80),
(3, 2, 'Entregue', '2026-01-07 09:15:00', 1899.00, 0.00, 0.00, 1899.00),
(4, 2, 'Enviado', '2026-01-08 16:45:00', 439.80, 20.00, 50.00, 409.80),
(5, 3, 'Em processamento', '2026-01-09 11:30:00', 189.90, 10.00, 0.00, 199.90),
(6, 4, 'Confirmado', '2026-01-10 13:25:00', 10499.50, 0.00, 500.00, 9999.50),
(7, 1, 'Entregue', '2026-01-11 08:40:00', 249.90, 12.00, 0.00, 261.90),
(8, 3, 'Entregue', '2026-01-12 15:10:00', 1299.00, 0.00, 0.00, 1299.00),
(9, 2, 'Cancelado', '2026-01-13 10:50:00', 89.90, 15.00, 0.00, 104.90),
(10, 4, 'Entregue', '2026-01-14 12:30:00', 599.70, 25.00, 100.00, 524.70),
(1, 1, 'Enviado', '2026-01-15 09:20:00', 3499.00, 0.00, 0.00, 3499.00),
(2, 2, 'Em processamento', '2026-01-16 14:55:00', 488.80, 18.00, 0.00, 506.80),
(3, 3, 'Confirmado', '2026-01-17 11:15:00', 299.90, 10.00, 0.00, 309.90),
(4, 1, 'Entregue', '2026-01-18 16:20:00', 159.80, 12.00, 0.00, 171.80),
(5, 4, 'Entregue', '2026-01-19 10:40:00', 249.90, 10.00, 25.00, 234.90),
(6, 3, 'Pendente', '2026-01-20 08:30:00', 15998.00, 0.00, 1000.00, 14998.00),
(7, 2, 'Entregue', '2026-01-18 13:45:00', 379.80, 15.00, 0.00, 394.80),
(8, 1, 'Confirmado', '2026-01-19 09:25:00', 1798.00, 0.00, 200.00, 1598.00),
(9, 4, 'Em processamento', '2026-01-20 11:10:00', 949.70, 20.00, 0.00, 969.70),
(10, 2, 'Enviado', '2026-01-20 14:35:00', 699.80, 25.00, 100.00, 624.80),
(1, 3, 'Confirmado', '2026-01-20 15:50:00', 189.00, 10.00, 0.00, 199.00),
(2, 1, 'Pendente', '2026-01-20 16:30:00', 129.90, 12.00, 0.00, 141.90);

-- Itens dos Pedidos
INSERT INTO item_pedido (pedido_id, produto_id, quantidade, preco_unitario, subtotal) VALUES
(1, 1, 1, 2299.90, 2299.90),
(2, 6, 1, 299.90, 299.90), (2, 9, 1, 129.90, 29.90),
(3, 3, 1, 1899.00, 1899.00),
(4, 11, 2, 89.90, 179.80), (4, 12, 1, 149.90, 149.90), (4, 15, 2, 49.90, 99.80),
(5, 5, 1, 189.90, 189.90),
(6, 2, 3, 3499.00, 10497.00), (6, 5, 1, 189.90, 189.90),
(7, 4, 1, 249.90, 249.90),
(8, 8, 1, 1299.00, 1299.00),
(9, 11, 1, 89.90, 89.90),
(10, 16, 5, 39.90, 199.50), (10, 17, 2, 129.90, 259.80), (10, 18, 1, 249.90, 249.90),
(11, 2, 1, 3499.00, 3499.00),
(12, 21, 3, 49.90, 149.70), (12, 22, 2, 39.90, 79.80), (12, 23, 4, 29.90, 119.60), (12, 24, 2, 59.90, 119.90), (12, 25, 1, 69.90, 69.90),
(13, 6, 1, 299.90, 299.90),
(14, 10, 1, 159.90, 159.90), (14, 16, 2, 39.90, 79.80),
(15, 18, 1, 249.90, 249.90),
(16, 1, 5, 2299.90, 11499.50), (16, 4, 8, 249.90, 1999.20), (16, 5, 15, 189.90, 2848.50),
(17, 13, 1, 199.90, 199.90), (17, 14, 2, 79.90, 159.80),
(18, 19, 1, 299.90, 299.90), (18, 20, 3, 189.90, 569.70), (18, 17, 4, 129.90, 519.60),
(19, 3, 1, 1899.00, 1899.00), (19, 4, 2, 249.90, 499.80),
(20, 7, 2, 189.00, 378.00), (20, 9, 1, 129.90, 129.90), (20, 10, 1, 159.90, 159.90),
(21, 7, 1, 189.00, 189.00),
(22, 17, 1, 129.90, 129.90);

-- Pagamentos
INSERT INTO pagamento (pedido_id, forma_pagamento_id, status_pagamento, valor_pago, codigo_transacao, numero_parcelas) VALUES
(1, 1, 'Aprovado', 2199.90, 'TXN-2026010501', 5),
(2, 3, 'Aprovado', 344.80, 'TXN-2026010601', 1),
(3, 5, 'Aprovado', 1899.00, 'PIX-2026010701', 1),
(4, 7, 'Aprovado', 409.80, 'TXN-2026010801', 3),
(5, 8, 'Aprovado', 199.90, 'PIX-2026010901', 1),
(6, 10, 'Aprovado', 9999.50, 'BOLT-2026011001', 1),
(7, 11, 'Aprovado', 261.90, 'TXN-2026011101', 1),
(8, 13, 'Aprovado', 1299.00, 'BOLT-2026011201', 1),
(9, 14, 'Estornado', 104.90, 'TXN-2026011301', 1),
(10, 15, 'Aprovado', 524.70, 'TRF-2026011401', 1),
(11, 1, 'Aprovado', 3499.00, 'TXN-2026011501', 10),
(12, 4, 'Aprovado', 506.80, 'DEB-2026011601', 1),
(13, 6, 'Aprovado', 309.90, 'TXN-2026011701', 2),
(14, 7, 'Aprovado', 171.80, 'TXN-2026011801', 1),
(15, 8, 'Aprovado', 234.90, 'PIX-2026011901', 1),
(16, 10, 'Pendente', 14998.00, 'BOLT-2026012001', 1),
(17, 12, 'Aprovado', 394.80, 'TXN-2026011802', 1),
(18, 13, 'Aprovado', 1598.00, 'BOLT-2026011901', 1),
(19, 14, 'Processando', 969.70, 'TXN-2026012002', 3),
(20, 15, 'Aprovado', 624.80, 'TRF-2026012003', 1),
(21, 2, 'Aprovado', 199.00, 'PIX-2026012004', 1),
(22, 3, 'Pendente', 141.90, 'TXN-2026012005', 1);

-- Entregas
INSERT INTO entrega (pedido_id, status_entrega, codigo_rastreio, transportadora, data_envio, data_entrega_prevista, data_entrega_realizada, endereco_entrega, bairro_entrega, cidade_entrega, estado_entrega, cep_entrega) VALUES
(1, 'Entregue', 'BR123456789BR', 'Correios', '2026-01-06 08:00:00', '2026-01-10', '2026-01-09 14:30:00', 'Rua das Flores, 123', 'Centro', 'Maringá', 'PR', '87015000'),
(2, 'Entregue', 'BR234567890BR', 'Total Express', '2026-01-07 09:00:00', '2026-01-12', '2026-01-11 10:15:00', 'Av. Brasil, 456', 'Zona 7', 'Maringá', 'PR', '87020100'),
(3, 'Entregue', 'BR345678901BR', 'Jadlog', '2026-01-08 10:00:00', '2026-01-13', '2026-01-12 16:20:00', 'Rua Paraná, 789', 'Jardim Alvorada', 'Maringá', 'PR', '87025300'),
(4, 'Em trânsito', 'BR456789012BR', 'Correios', '2026-01-09 08:30:00', '2026-01-22', NULL, 'Rua XV de Novembro, 321', 'Centro', 'Maringá', 'PR', '87013000'),
(5, 'Em separação', NULL, NULL, NULL, '2026-01-25', NULL, 'Av. Cerro Azul, 654', 'Zona 3', 'Maringá', 'PR', '87030500'),
(6, 'Aguardando envio', NULL, NULL, NULL, '2026-01-28', NULL, 'Av. Duque de Caxias, 100', 'Centro', 'Maringá', 'PR', '87015000'),
(7, 'Entregue', 'BR567890123BR', 'Total Express', '2026-01-12 11:00:00', '2026-01-17', '2026-01-16 13:45:00', 'Rua Pioneiro José Alves, 200', 'Industrial', 'Maringá', 'PR', '87065000'),
(8, 'Entregue', 'BR678901234BR', 'Correios', '2026-01-13 08:00:00', '2026-01-18', '2026-01-17 15:30:00', 'Av. Colombo, 300', 'Zona 5', 'Maringá', 'PR', '87020000'),
(9, 'Devolvido', 'BR789012345BR', 'Jadlog', '2026-01-14 09:00:00', '2026-01-19', '2026-01-18 10:00:00', 'Rua Santos Dumont, 400', 'Centro', 'Maringá', 'PR', '87014000'),
(10, 'Entregue', 'BR890123456BR', 'Correios', '2026-01-15 10:00:00', '2026-01-20', '2026-01-19 14:20:00', 'Rua Pioneiro João Alves, 500', 'Distrito Industrial', 'Maringá', 'PR', '87070000'),
(11, 'Saiu para entrega', 'BR901234567BR', 'Total Express', '2026-01-16 08:00:00', '2026-01-21', NULL, 'Rua das Flores, 123', 'Centro', 'Maringá', 'PR', '87015000'),
(12, 'Despachado', 'BR012345678BR', 'Correios', '2026-01-17 09:00:00', '2026-01-23', NULL, 'Av. Brasil, 456', 'Zona 7', 'Maringá', 'PR', '87020100'),
(13, 'Aguardando envio', NULL, NULL, NULL, '2026-01-25', NULL, 'Rua Paraná, 789', 'Jardim Alvorada', 'Maringá', 'PR', '87025300'),
(14, 'Entregue', 'BR112233445BR', 'Jadlog', '2026-01-19 10:00:00', '2026-01-24', '2026-01-23 11:30:00', 'Rua XV de Novembro, 321', 'Centro', 'Maringá', 'PR', '87013000'),
(15, 'Entregue', 'BR223344556BR', 'Total Express', '2026-01-20 08:30:00', '2026-01-25', '2026-01-24 16:45:00', 'Av. Cerro Azul, 654', 'Zona 3', 'Maringá', 'PR', '87030500'),
(16, 'Aguardando envio', NULL, NULL, NULL, '2026-01-30', NULL, 'Av. Duque de Caxias, 100', 'Centro', 'Maringá', 'PR', '87015000'),
(17, 'Entregue', 'BR334455667BR', 'Correios', '2026-01-19 09:00:00', '2026-01-24', '2026-01-23 14:20:00', 'Rua Pioneiro José Alves, 200', 'Industrial', 'Maringá', 'PR', '87065000'),
(18, 'Em separação', NULL, NULL, NULL, '2026-01-27', NULL, 'Av. Colombo, 300', 'Zona 5', 'Maringá', 'PR', '87020000'),
(19, 'Despachado', 'BR445566778BR', 'Jadlog', '2026-01-21 10:00:00', '2026-01-26', NULL, 'Rua Santos Dumont, 400', 'Centro', 'Maringá', 'PR', '87014000'),
(20, 'Em trânsito', 'BR556677889BR', 'Total Express', '2026-01-21 11:00:00', '2026-01-27', NULL, 'Rua Pioneiro João Alves, 500', 'Distrito Industrial', 'Maringá', 'PR', '87070000'),
(21, 'Aguardando envio', NULL, NULL, NULL, '2026-01-28', NULL, 'Rua das Flores, 123', 'Centro', 'Maringá', 'PR', '87015000'),
(22, 'Aguardando envio', NULL, NULL, NULL, '2026-01-29', NULL, 'Av. Brasil, 456', 'Zona 7', 'Maringá', 'PR', '87020100');