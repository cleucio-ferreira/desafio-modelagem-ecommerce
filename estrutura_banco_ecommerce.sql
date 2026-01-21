    USE noctuaco7c90b2cd_ecommerce;

-- Cliente: pode ser PF ou PJ, nunca os dois
CREATE TABLE cliente(
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Dados básicos de contato
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    
    -- Define se é pessoa física ou jurídica
    tipo_pessoa ENUM('PF','PJ') NOT NULL,
    
    -- CPF ou CNPJ (11 dígitos para CPF, 14 para CNPJ)
    cpf_cnpj VARCHAR(14) NOT NULL,
    
    -- Dados específicos de cada tipo
    -- Para PF: nome completo da pessoa
    -- Para PJ: razão social da empresa
    nome_completo VARCHAR(150) NOT NULL,
    
    -- Apenas para PJ
    nome_fantasia VARCHAR(100),
    inscricao_estadual VARCHAR(20),
    
    -- Apenas para PF
    data_nascimento DATE,
    
    -- Endereço (comum para ambos)
    endereco VARCHAR(100),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado CHAR(2),
    cep CHAR(8),
    
    -- Controle do cadastro
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ativo BOOL DEFAULT TRUE,
    
    -- Garantindo que não existe CPF ou CNPJ duplicado
    CONSTRAINT unique_cpf_cnpj UNIQUE (cpf_cnpj),
    CONSTRAINT unique_email UNIQUE (email),
    
    -- Validação: se for PF, cpf_cnpj deve ter 11 caracteres; se PJ, deve ter 14
    CONSTRAINT check_cpf_cnpj_length CHECK (
        (tipo_pessoa = 'PF' AND LENGTH(cpf_cnpj) = 11) OR
        (tipo_pessoa = 'PJ' AND LENGTH(cpf_cnpj) = 14)
    )
);

-- Vendedores (colaboradores internos)
CREATE TABLE vendedor(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf CHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    comissao_percentual DECIMAL(5,2) DEFAULT 5.00,
    data_contratacao DATE NOT NULL,
    ativo BOOL DEFAULT TRUE,
    CONSTRAINT unique_cpf_vendedor UNIQUE (cpf),
    CONSTRAINT unique_email_vendedor UNIQUE (email)
);

-- Fornecedores (empresas que fornecem produtos)
CREATE TABLE fornecedor(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cnpj CHAR(14) NOT NULL,
    razao_social VARCHAR(150) NOT NULL,
    nome_fantasia VARCHAR(100),
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(100),
    cidade VARCHAR(50),
    estado CHAR(2),
    cep CHAR(8),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ativo BOOL DEFAULT TRUE,
    CONSTRAINT unique_cnpj_fornecedor UNIQUE (cnpj),
    CONSTRAINT unique_email_fornecedor UNIQUE (email)
);

-- Categorias dos produtos
CREATE TABLE categoria(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

-- Catálogo de produtos
CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Código único do produto (ex: PROD-001)
    sku VARCHAR(20) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    
    -- Preço sempre em decimal para evitar erros de arredondamento
    preco_unitario DECIMAL(10,2) NOT NULL,
    
    -- Indica se o produto é apropriado para crianças
    flag_infantil BOOL DEFAULT FALSE,
    
    categoria_id INT NOT NULL,
    
    -- Avaliação média dos clientes (0 a 5 estrelas)
    avaliacao_media DECIMAL(3,2),
    
    -- Dimensões e peso para cálculo de frete
    dimensoes VARCHAR(20),
    peso DECIMAL(8,2),
    
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ativo BOOL DEFAULT TRUE,
    
    CONSTRAINT fk_produto_categoria FOREIGN KEY (categoria_id) REFERENCES categoria(id),
    CONSTRAINT unique_sku UNIQUE (sku)
);

-- Relacionamento muitos-para-muitos entre produto e fornecedor
CREATE TABLE produto_fornecedor(
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    fornecedor_id INT NOT NULL,
    preco_fornecimento DECIMAL(10,2) NOT NULL,
    prazo_entrega_dias INT DEFAULT 7,
    fornecedor_principal BOOL DEFAULT FALSE,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    CONSTRAINT fk_pf_produto FOREIGN KEY (produto_id) REFERENCES produto(id),
    CONSTRAINT fk_pf_fornecedor FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id),
    CONSTRAINT unique_produto_fornecedor UNIQUE (produto_id, fornecedor_id)
);

-- Controle de estoque por produto
CREATE TABLE estoque(
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    
    -- Quantidade disponível para venda
    quantidade_disponivel INT NOT NULL DEFAULT 0,
    
    -- Quantidade já vendida mas ainda não despachada
    quantidade_reservada INT NOT NULL DEFAULT 0,
    
    -- Localização física no depósito (ex: Corredor A, Prateleira 5)
    localizacao VARCHAR(50),
    
    -- Atualiza automaticamente quando houver mudança
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_estoque_produto FOREIGN KEY (produto_id) REFERENCES produto(id),
    
    -- Cada produto só pode ter um registro de estoque
    CONSTRAINT unique_produto_estoque UNIQUE (produto_id)
);

-- Pedidos realizados pelos clientes
CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    vendedor_id INT,
    
    -- Status do pedido no fluxo de venda
    status ENUM(
        'Pendente',           -- Aguardando pagamento
        'Confirmado',         -- Pagamento confirmado
        'Em processamento',   -- Separando produtos
        'Enviado',           -- Já despachado
        'Entregue',          -- Cliente recebeu
        'Cancelado'          -- Pedido cancelado
    ) DEFAULT 'Pendente',
    
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Valores do pedido
    valor_subtotal DECIMAL(10,2) NOT NULL,  -- Soma dos produtos
    valor_frete DECIMAL(10,2) DEFAULT 10.00,
    valor_desconto DECIMAL(10,2) DEFAULT 0.00,
    valor_total DECIMAL(10,2) NOT NULL,     -- Subtotal + frete - desconto
    
    observacoes TEXT,
    
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    CONSTRAINT fk_pedido_vendedor FOREIGN KEY (vendedor_id) REFERENCES vendedor(id)
);

-- Itens de cada pedido (quais produtos e quantidades)
CREATE TABLE item_pedido(
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    
    quantidade INT NOT NULL,
    
    -- Guardamos o preço no momento da compra (pode ter mudado depois)
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    
    CONSTRAINT fk_item_pedido FOREIGN KEY (pedido_id) REFERENCES pedido(id) ON DELETE CASCADE,
    CONSTRAINT fk_item_produto FOREIGN KEY (produto_id) REFERENCES produto(id)
);

-- Formas de pagamento cadastradas pelo cliente
-- Cliente pode ter vários cartões, contas, etc.
CREATE TABLE forma_pagamento(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    
    tipo_pagamento ENUM(
        'Pix',
        'Débito',
        'Transferência Bancária',
        'Crédito',
        'Boleto bancário'
    ) NOT NULL,
    
    -- Detalhes da forma de pagamento
    descricao VARCHAR(100),
    
    -- Apelido dado pelo cliente (ex: "Cartão do trabalho")
    apelido VARCHAR(50),
    
    ativo BOOL DEFAULT TRUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_forma_pagamento_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON DELETE CASCADE
);

-- Pagamentos efetivos dos pedidos
-- Um pedido pode ter múltiplos pagamentos (ex: parte no crédito, parte no pix)
CREATE TABLE pagamento(
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    forma_pagamento_id INT NOT NULL,
    
    status_pagamento ENUM(
        'Pendente',      -- Aguardando processamento
        'Processando',   -- Em análise
        'Aprovado',      -- Pagamento confirmado
        'Recusado',      -- Não autorizado
        'Estornado'      -- Devolvido ao cliente
    ) DEFAULT 'Pendente',
    
    valor_pago DECIMAL(10,2) NOT NULL,
    data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Número de parcelas (1 = à vista)
    numero_parcelas INT DEFAULT 1,
    
    -- Código retornado pela operadora/banco
    codigo_transacao VARCHAR(100),
    
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    CONSTRAINT fk_pagamento_forma FOREIGN KEY (forma_pagamento_id) REFERENCES forma_pagamento(id)
);

-- Entrega dos pedidos com rastreamento
CREATE TABLE entrega(
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    
    -- Status detalhado da entrega
    status_entrega ENUM(
        'Aguardando envio',    -- Pedido confirmado, mas ainda não despachado
        'Em separação',        -- Pegando produtos no estoque
        'Despachado',          -- Saiu do centro de distribuição
        'Em trânsito',         -- A caminho do destino
        'Saiu para entrega',   -- Chegou na cidade, com o entregador
        'Entregue',           -- Cliente recebeu
        'Tentativa de entrega', -- Ninguém em casa
        'Devolvido'           -- Retornou ao remetente
    ) DEFAULT 'Aguardando envio',
    
    -- Código para rastreio nos Correios ou transportadora
    codigo_rastreio VARCHAR(50),
    transportadora VARCHAR(100),
    
    -- Datas importantes
    data_envio TIMESTAMP NULL,
    data_entrega_prevista DATE,
    data_entrega_realizada TIMESTAMP NULL,
    
    -- Endereço de entrega (pode ser diferente do cadastro do cliente)
    endereco_entrega VARCHAR(100) NOT NULL,
    complemento_entrega VARCHAR(50),
    bairro_entrega VARCHAR(50),
    cidade_entrega VARCHAR(50) NOT NULL,
    estado_entrega CHAR(2) NOT NULL,
    cep_entrega CHAR(8) NOT NULL,
    
    -- Instruções especiais (ex: "Deixar com portaria")
    observacoes TEXT,
    
    CONSTRAINT fk_entrega_pedido FOREIGN KEY (pedido_id) REFERENCES pedido(id) ON DELETE CASCADE,
    CONSTRAINT unique_codigo_rastreio UNIQUE (codigo_rastreio)
);