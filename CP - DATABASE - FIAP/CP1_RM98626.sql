CREATE TABLE tbl_estados_RM98626(
    sigla CHAR(2) PRIMARY KEY NOT NULL,
    nome_estado VARCHAR2(40) NOT NULL
);

--DROP TABLE tbl_estados_RM98626;
--TRUNCATE TABLE tbl_estados_RM98626;

CREATE TABLE tbl_cidades_RM98626(
    id_cidade INTEGER PRIMARY KEY    NOT NULL,
    nome_cidade VARCHAR2(30)         NOT NULL,
    sigla CHAR(2)                    NOT NULL,
    FOREIGN KEY (sigla) REFERENCES tbl_estados_RM98626(sigla)
);

--DROP TABLE tbl_cidades_RM98626;
--TRUNCATE TABLE tbl_cidades_RM98626;

CREATE TABLE tbl_fornecedores_RM98626(
    id_fornecedor  INTEGER PRIMARY KEY       NOT NULL,
    nome           VARCHAR2(60)              NOT NULL,
    endereco       VARCHAR2(100)             NOT NULL,
    numero         VARCHAR2(10)              NOT NULL,
    bairro         VARCHAR2(40)              NOT NULL,
    complemento    VARCHAR2 (10)             NOT NULL,
    cep            VARCHAR2(8)               NOT NULL,
    id_cidade      INTEGER                   NOT NULL,
    dt_cadastro    DATE                      NOT NULL,
    email          VARCHAR2(80),
    status         VARCHAR2(7),
    FOREIGN KEY (id_cidade) REFERENCES tbl_cidades_RM98626(id_cidade)
);

--DROP TABLE tbl_fornecedores_RM98626;
--TRUNCATE TABLE tbl_fornecedores_RM98626;

CREATE TABLE tbl_categorias_RM98626(
    id_categoria INTEGER PRIMARY KEY NOT NULL,
    descricao VARCHAR2(30) NOT NULL
);

--DROP TABLE tbl_categorias_RM98626;
--TRUNCATE TABLE tbl_categorias_RM98626;

CREATE TABLE tbl_despesas_RM98626(
    id_despesas INTEGER PRIMARY KEY NOT NULL,
    dt_cadastro DATE NOT NULL,
    id_fornecedor INTEGER NOT NULL,
    numero_docto INTEGER NOT NULL,
    parcela_atual INTEGER NOT NULL,
    parcela_maxima INTEGER NOT NULL,
    dt_vencimento DATE NOT NULL,
    valor NUMBER(10,2) NOT NULL,
    valor_pago NUMBER(10,2),
    id_categoria INTEGER NOT NULL,
    dt_pagamento DATE,
    FOREIGN KEY(id_fornecedor) REFERENCES tbl_fornecedores_RM98626(id_fornecedor),
    FOREIGN KEY (id_categoria) REFERENCES tbl_categorias_RM98626(id_categoria)
);


--DROP TABLE tbl_despesas_RM98626;
--TRUNCATE TABLE tbl_despesas_RM98626;

CREATE TABLE tbl_tipo_telefones_RM98626(
    id_tipo_tel INTEGER,
    descricao VARCHAR2(30),
    tbl_tipo_telefones_RM98626_ID NUMBER PRIMARY KEY NOT NULL
);

--DROP TABLE tbl_tipo_telefones_RM98626;
--TRUNCATE TABLE tbl_tipo_telefones_RM98626;

CREATE TABLE tbl_telefones_RM98626(
    id_telefones INTEGER PRIMARY KEY NOT NULL,
    id_fornecedor INTEGER NOT NULL,
    numero VARCHAR2(20) NOT NULL,
    tbl_tipo_telefones_RM98626_tbl_tipo_telefones_RM98626_ID NUMBER,
    FOREIGN KEY (id_fornecedor) REFERENCES tbl_fornecedores_RM98626(id_fornecedor),
    FOREIGN KEY (tbl_tipo_telefones_RM98626_tbl_tipo_telefones_RM98626_ID) REFERENCES tbl_tipo_telefones_RM98626(tbl_tipo_telefones_RM98626_ID)
);

--DROP TABLE tbl_telefones_RM98626;
--TRUNCATE TABLE tbl_telefones_RM98626;

-- Exercício 1
-- Fornecedores:
INSERT INTO tbl_estados_RM98626 (sigla, nome_estado) VALUES ('SP', 'São Paulo');

INSERT INTO tbl_cidades_RM98626 (id_cidade, nome_cidade, sigla) VALUES (1, 'São Paulo', 'SP');
INSERT INTO tbl_cidades_RM98626 (id_cidade, nome_cidade, sigla) VALUES (2, 'Campinas', 'SP');
INSERT INTO tbl_cidades_RM98626 (id_cidade, nome_cidade, sigla) VALUES (3, 'Mairiporã', 'SP');

-- josue
INSERT INTO tbl_tipo_telefones_RM98626 (id_tipo_tel, descricao, tbl_tipo_telefones_RM98626_ID) VALUES (1, 'Telefone', 1);
INSERT INTO tbl_fornecedores_RM98626 (id_fornecedor, dt_cadastro, nome, endereco, numero, bairro, cep, id_cidade, email, status, complemento)
    VALUES (1, TO_DATE('01/08/2023', 'DD/MM/YYYY'), 'Ferramentaria do Josué Ltda', 'Avenida Paulista', '1515', 'Paulista', '01101010', 1, 'fejosue@gmail.com', 'ATIVO', '.');
INSERT INTO tbl_telefones_RM98626 (id_telefones, id_fornecedor, numero, tbl_tipo_telefones_RM98626_tbl_tipo_telefones_RM98626_ID) VALUES (1, 1, '(11)99652532', 1);

--Tecnologia e serviços
INSERT INTO tbl_tipo_telefones_RM98626 (id_tipo_tel, descricao, tbl_tipo_telefones_RM98626_ID) VALUES (2, 'Telefone', 2);
INSERT INTO tbl_fornecedores_RM98626 (id_fornecedor, dt_cadastro, nome, endereco, numero, bairro, cep, id_cidade, email, status, complemento)
    VALUES (2, TO_DATE('01/08/2023', 'DD/MM/YYYY'), 'Flix Tecnologia e Serviços Ltda', 'Rua Brasília', '23', 'Lapa', '01101012', 1, 'flix@flix.com.br', 'INATIVO', 'Sala 5');
INSERT INTO tbl_telefones_RM98626 (id_telefones, id_fornecedor, numero, tbl_tipo_telefones_RM98626_tbl_tipo_telefones_RM98626_ID) VALUES (2, 2, '(11)99652533', 2);

-- Rei dos Descartáveis
INSERT INTO tbl_tipo_telefones_RM98626 (id_tipo_tel, descricao, tbl_tipo_telefones_RM98626_ID) VALUES (3, 'SAC', 3);
INSERT INTO tbl_fornecedores_RM98626 (id_fornecedor, dt_cadastro, nome, endereco, numero, bairro, cep, id_cidade, email, status, complemento)
    VALUES (3, TO_DATE('05/08/2023', 'DD/MM/YYYY'), 'Rei dos Descartáveis Ltda', 'Rua Voluntários da Pátria', '356', 'Santana', '01106010', 1, '', 'ATIVO', '.');
INSERT INTO tbl_telefones_RM98626 (id_telefones, id_fornecedor, numero, tbl_tipo_telefones_RM98626_tbl_tipo_telefones_RM98626_ID) VALUES (3, 3, '1133556677', 3);

--Serviços Manutenção
INSERT INTO tbl_tipo_telefones_RM98626 (id_tipo_tel, descricao, tbl_tipo_telefones_RM98626_ID) VALUES (4, 'Telefone', 4);
INSERT INTO tbl_fornecedores_RM98626 (id_fornecedor, dt_cadastro, nome, endereco, numero, bairro, cep, id_cidade, email, status, complemento)
    VALUES (4, TO_DATE('06/08/2023', 'DD/MM/YYYY'), 'Manut Serviços de Manutenção Ltda', 'Avenida Aquidaban', '2000', 'Centro', '13250123', 2, '', 'ATIVO', '.');
INSERT INTO tbl_telefones_RM98626 (id_telefones, id_fornecedor, numero, tbl_tipo_telefones_RM98626_tbl_tipo_telefones_RM98626_ID) VALUES (4, 4, '1925526565', 4);

--Serviços de jardinagem
INSERT INTO tbl_tipo_telefones_RM98626 (id_tipo_tel, descricao, tbl_tipo_telefones_RM98626_ID) VALUES (5, 'Telefone', 5);
INSERT INTO tbl_fornecedores_RM98626 (id_fornecedor, dt_cadastro, nome, endereco, numero, bairro, cep, id_cidade, email, status, complemento)
    VALUES (5, TO_DATE('06/08/2023', 'DD/MM/YYYY'), 'Serviços de Jardinagem Ltda', 'Rua Campinas', '15', 'Centro', '01152222', 3, '', 'ATIVO', '.');
INSERT INTO tbl_telefones_RM98626 (id_telefones, id_fornecedor, numero, tbl_tipo_telefones_RM98626_tbl_tipo_telefones_RM98626_ID) VALUES (5, 5, '1156565656', 5);

--ES Serviços Contábeis Ltda.
INSERT INTO tbl_tipo_telefones_RM98626 (id_tipo_tel, descricao, tbl_tipo_telefones_RM98626_ID) VALUES (6, '', 6);
INSERT INTO tbl_fornecedores_RM98626 (id_fornecedor, dt_cadastro, nome, endereco, numero, bairro, cep, id_cidade, email, status, complemento)
    VALUES (6, TO_DATE('06/08/2023', 'DD/MM/YYYY'), 'ES Serviços Contábeis Ltda', 'Avenida Pompéia', '1500', 'Lapa', '01101013', 1, 'esservicocontabeis@gmail.com', 'ATIVO', 'Sala 10');
INSERT INTO tbl_telefones_RM98626 (id_telefones, id_fornecedor, numero, tbl_tipo_telefones_RM98626_tbl_tipo_telefones_RM98626_ID) VALUES (6, 6, '.', 6);


INSERT INTO tbl_categorias_RM98626(id_categoria, descricao) VALUES (1, 'Ferramentas');
INSERT INTO tbl_categorias_RM98626(id_categoria, descricao) VALUES (2, 'Serviços de TI.');
INSERT INTO tbl_categorias_RM98626(id_categoria, descricao) VALUES (3, 'Serviços contábeis');
INSERT INTO tbl_categorias_RM98626(id_categoria, descricao) VALUES (4, 'Diversos');
--Despesas
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (1,TO_DATE('01/08/2023', 'DD/MM/YYYY'),1, 1516, 1, 10, TO_DATE('15/08/2023', 'DD/MM/YYYY'),300.50, 300.50, 1, TO_DATE('15/08/2023', 'DD/MM/YYYY'));

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (2,TO_DATE('15/08/2023', 'DD/MM/YYYY'),2, 16988, 1, 1, TO_DATE('15/08/2023', 'DD/MM/YYYY'),1356.60, 1356.60, 2, TO_DATE('15/08/2023', 'DD/MM/YYYY'));

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (3,TO_DATE('02/08/2023', 'DD/MM/YYYY'),6, 2023, 1, 5, TO_DATE('19/08/2023', 'DD/MM/YYYY'),759.60, 759.60, 3, TO_DATE('19/08/2023', 'DD/MM/YYYY'));
    
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (4,TO_DATE('30/08/2023', 'DD/MM/YYYY'),5, 2023080, 1, 3, TO_DATE('30/08/2023', 'DD/MM/YYYY'),150, 150, 4, TO_DATE('30/08/2023', 'DD/MM/YYYY'));
    
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (5,TO_DATE('30/08/2023', 'DD/MM/YYYY'),5, 2023080, 2, 3, TO_DATE('30/08/2023', 'DD/MM/YYYY'),150, 150, 4, TO_DATE('30/08/2023', 'DD/MM/YYYY'));
    
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (6,TO_DATE('30/08/2023', 'DD/MM/YYYY'),5, 2023080, 3, 3, TO_DATE('30/08/2023', 'DD/MM/YYYY'),150, 150, 4, TO_DATE('30/08/2023', 'DD/MM/YYYY'));
    
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (7,TO_DATE('02/08/2023', 'DD/MM/YYYY'),3, 2023080, 1, 1, TO_DATE('02/08/2023', 'DD/MM/YYYY'),120, 120, 4, TO_DATE('02/08/2023', 'DD/MM/YYYY'));
    
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (8,TO_DATE('01/08/2023', 'DD/MM/YYYY'),1, 1516, 2, 10, TO_DATE('15/08/2023', 'DD/MM/YYYY'),300.50, NULL, 1, NULL);

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (9,TO_DATE('03/08/2023', 'DD/MM/YYYY'),6, 2023, 2, 5, TO_DATE('19/08/2023', 'DD/MM/YYYY'),759.60, NULL, 3, NULL);
    
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (10,TO_DATE('01/08/2023', 'DD/MM/YYYY'),1, 1516, 3, 10, TO_DATE('15/10/2023', 'DD/MM/YYYY'),300.50, NULL, 1, NULL);
    
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (11,TO_DATE('03/08/2023', 'DD/MM/YYYY'),6, 2023, 3, 5, TO_DATE('19/10/2023', 'DD/MM/YYYY'),759.60, NULL, 3, NULL);

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (12,TO_DATE('01/08/2023', 'DD/MM/YYYY'),1, 1516, 4, 10, TO_DATE('15/11/2023', 'DD/MM/YYYY'),300.50, NULL, 1, NULL);

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (13,TO_DATE('03/08/2023', 'DD/MM/YYYY'),6, 2023, 4, 5, TO_DATE('19/11/2023', 'DD/MM/YYYY'),759.60, NULL, 3, NULL);
    
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (14,TO_DATE('01/08/2023', 'DD/MM/YYYY'),1, 1516, 5, 10, TO_DATE('15/12/2023', 'DD/MM/YYYY'),300.50, NULL, 1, NULL);
    
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (15,TO_DATE('03/08/2023', 'DD/MM/YYYY'),6, 2023, 5, 5, TO_DATE('19/12/2023', 'DD/MM/YYYY'),759.60, NULL, 3, NULL);
    
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (16,TO_DATE('01/08/2023', 'DD/MM/YYYY'),1, 1516, 6, 10, TO_DATE('15/01/2024', 'DD/MM/YYYY'),300.50, NULL, 1, NULL);

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (17,TO_DATE('02/08/2023', 'DD/MM/YYYY'),5, 2024, 1, 12, TO_DATE('19/01/2024', 'DD/MM/YYYY'),759.6, NULL, 4, NULL);
    
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (18,TO_DATE('01/08/2023', 'DD/MM/YYYY'),1, 1516, 7, 10, TO_DATE('15/02/2024', 'DD/MM/YYYY'),300.50, NULL, 1, NULL);    
    
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (19,TO_DATE('03/08/2023', 'DD/MM/YYYY'),6, 2024, 2, 12, TO_DATE('19/02/2024', 'DD/MM/YYYY'),759.60, NULL, 3, NULL);
    
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (20,TO_DATE('01/08/2023', 'DD/MM/YYYY'),1, 1516, 8, 10, TO_DATE('15/03/2024', 'DD/MM/YYYY'),300.50, NULL, 1, NULL);   

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (21,TO_DATE('03/08/2023', 'DD/MM/YYYY'),6, 2024, 3, 12, TO_DATE('19/03/2024', 'DD/MM/YYYY'),759.60, NULL, 3, NULL);
    
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (22,TO_DATE('01/08/2023', 'DD/MM/YYYY'),1, 1516, 9, 10, TO_DATE('15/04/2024', 'DD/MM/YYYY'),300.50, NULL, 1, NULL);  
    
INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (23,TO_DATE('03/08/2023', 'DD/MM/YYYY'),6, 2024, 4, 12, TO_DATE('19/04/2024', 'DD/MM/YYYY'),759.60, NULL, 3, NULL);

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (24,TO_DATE('01/08/2023', 'DD/MM/YYYY'),1, 1516, 10, 10, TO_DATE('15/05/2024', 'DD/MM/YYYY'),300.50, NULL, 1, NULL);  

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (25,TO_DATE('03/08/2023', 'DD/MM/YYYY'),6, 2024, 5, 12, TO_DATE('19/05/2024', 'DD/MM/YYYY'),759.60, NULL, 3, NULL);

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (26,TO_DATE('03/08/2023', 'DD/MM/YYYY'),6, 2024, 6, 12, TO_DATE('19/06/2024', 'DD/MM/YYYY'),759.60, NULL, 3, NULL);

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (27,TO_DATE('03/08/2023', 'DD/MM/YYYY'),6, 2024, 7, 12, TO_DATE('19/07/2024', 'DD/MM/YYYY'),759.60, NULL, 3, NULL);

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (28,TO_DATE('03/08/2023', 'DD/MM/YYYY'),6, 2024, 8, 12, TO_DATE('19/08/2024', 'DD/MM/YYYY'),759.60, NULL, 3, NULL);

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (29,TO_DATE('03/08/2023', 'DD/MM/YYYY'),6, 2024, 9, 12, TO_DATE('19/09/2024', 'DD/MM/YYYY'),759.60, NULL, 3, NULL);

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (30,TO_DATE('03/08/2023', 'DD/MM/YYYY'),6, 2024, 10, 12, TO_DATE('19/10/2024', 'DD/MM/YYYY'),759.60, NULL, 3, NULL);

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (31,TO_DATE('03/08/2023', 'DD/MM/YYYY'),6, 2024, 11, 12, TO_DATE('19/11/2024', 'DD/MM/YYYY'),759.60, NULL, 3, NULL);

INSERT INTO tbl_despesas_RM98626 (id_despesas,dt_cadastro,id_fornecedor,numero_docto,parcela_atual,parcela_maxima,dt_vencimento,valor,valor_pago,id_categoria,dt_pagamento)
    VALUES (32,TO_DATE('03/08/2023', 'DD/MM/YYYY'),6, 2024, 12, 12, TO_DATE('19/12/2024', 'DD/MM/YYYY'),759.60, NULL, 3, NULL);

-- Exercício 2
-- A)
ALTER TABLE tbl_fornecedores_RM98626 MODIFY(dt_cadastro DEFAULT SYSDATE);

--B)
ALTER TABLE tbl_fornecedores_RM98626
ADD CONSTRAINT chk_status CHECK (status IN ('ATIVO', 'INATIVO'));

-- C)
ALTER TABLE tbl_despesas_RM98626
MODIFY (dt_cadastro DATE DEFAULT SYSDATE);

--D)

--E)
ALTER TABLE tbl_despesas_RM98626
RENAME COLUMN dt_cadastro TO dt_lancamento;

--F)
ALTER TABLE tbl_despesas_RM98626
ADD situacao VARCHAR2(20) CHECK (situacao IN ('PENDENTE', 'PAGO', 'EM ATRASO'));

-- G)
COMMENT ON COLUMN tbl_despesas_RM98626.id_despesas IS 'ID da despesa';
COMMENT ON COLUMN tbl_despesas_RM98626.dt_lancamento IS 'Data de lançamento da despesa';
COMMENT ON COLUMN tbl_despesas_RM98626.id_fornecedor IS 'ID do fornecedor relacionado à despesa';
COMMENT ON COLUMN tbl_despesas_RM98626.numero_docto IS 'Número do documento da despesa';
COMMENT ON COLUMN tbl_despesas_RM98626.parcela_atual IS 'Número da parcela atual';
COMMENT ON COLUMN tbl_despesas_RM98626.parcela_maxima IS 'Número máximo de parcelas';
COMMENT ON COLUMN tbl_despesas_RM98626.dt_vencimento IS 'Data de vencimento da despesa';
COMMENT ON COLUMN tbl_despesas_RM98626.valor IS 'Valor da despesa';
COMMENT ON COLUMN tbl_despesas_RM98626.valor_pago IS 'Valor pago da despesa';
COMMENT ON COLUMN tbl_despesas_RM98626.id_categoria IS 'ID da categoria da despesa';
COMMENT ON COLUMN tbl_despesas_RM98626.dt_pagamento IS 'Data de pagamento da despesa';
COMMENT ON COLUMN tbl_despesas_RM98626.situacao IS 'Situação da despesa (PENDENTE, PAGO, EM ATRASO)';

--H)
ALTER TABLE tbl_despesas_RM98626
ADD CONSTRAINT check_valor_maior_que_zero
CHECK (valor > 0);

-- I)
ALTER TABLE tbl_despesas_RM98626
ADD CONSTRAINT check_parcela_atual_menor_ou_igual_parcela_maxima
CHECK (parcela_atual <= parcela_maxima);



--Exercício 3
--A)
UPDATE tbl_despesas_RM98626
SET valor = valor * 1.10 
WHERE id_fornecedor = 6 
AND dt_vencimento >= TO_DATE('01/01/2024', 'DD/MM/YYYY');

SELECT * FROM tbl_despesas_RM98626
WHERE id_fornecedor = 6
AND dt_vencimento >= TO_DATE('01/01/2024', 'DD/MM/YYYY');

--B)
UPDATE tbl_fornecedores_RM98626
SET nome = 'Serviços de Manutenção Ltda'
WHERE id_fornecedor = 4;

--C)
UPDATE tbl_fornecedores_RM98626
SET status = 'INATIVO'
WHERE id_cidade NOT IN (SELECT id_cidade FROM tbl_cidades_RM98626 WHERE sigla = 'SP');

--D)
INSERT INTO tbl_estados_RM98626 (sigla, nome_estado) VALUES ('SC', 'Santa Catarina');
INSERT INTO tbl_cidades_RM98626 (id_cidade, nome_cidade, sigla) VALUES (4, 'Balneário Camboriú', 'SC');

INSERT INTO tbl_fornecedores_RM98626 (id_fornecedor, dt_cadastro, nome, endereco, numero, bairro, cep, id_cidade, email, status, complemento)
VALUES (33, TO_DATE('06/08/2023', 'DD/MM/YYYY'), 'Serviços de Manutenção Ltda', 'Avenida Aquidaban', '2000', 'Centro', '13250123', 2, '', 'ATIVO', '.');

--E)
INSERT INTO tbl_categorias_RM98626 (id_categoria, descricao)
VALUES (5, 'Congressos e Convenções');

--F)
UPDATE tbl_despesas_RM98626
SET status = 'PAGO'
WHERE dt_pagamento IS NOT NULL AND valor_pago IS NOT NULL;

UPDATE tbl_despesas_RM98626
SET status = 'PAGO'
WHERE dt_pagamento IS NOT NULL AND valor_pago IS NOT NULL;

UPDATE tbl_despesas_RM98626
SET status = 'EM ATRASO'
WHERE dt_pagamento IS NULL AND TO_DATE(SYSDATE, 'DD/MM/YYYY') > dt_vencimento;

-- Exercício 4
DROP TABLE tbl_telefones_RM98626;
DROP TABLE tbl_tipo_telefones_RM98626;
DROP TABLE tbl_despesas_RM98626;
DROP TABLE tbl_categorias_RM98626;
DROP TABLE tbl_fornecedores_RM98626;
DROP TABLE tbl_cidades_RM98626;
DROP TABLE tbl_estados_RM98626;

SELECT * FROM tbl_fornecedores_RM98626;
SELECT * FROM tbl_cidades_RM98626;
SELECT * FROM tbl_categorias_RM98626;
SELECT * FROM tbl_despesas_RM98626;
