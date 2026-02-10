use AlphaMotors;

INSERT INTO CLIENTE (CPF, NOME, DATA_NASCIMENTO, NUM_CELULAR, EMAIL, RG) VALUES
('123.456.789-00', 'Carlos Alberto Souza', '1985-04-12', '(83) 99988-7766', 'carlos.souza@email.com', '3.456.789'),
('234.567.890-11', 'Mariana Oliveira', '1992-09-25', '(83) 98877-6655', 'mari.oliveira@email.com', '4.567.890'),
('345.678.901-22', 'Pedro Henrique Lima', '1978-02-10', '(83) 97766-5544', 'pedro.lima@email.com', '5.678.901'),
('456.789.012-33', 'Fernanda Costa', '2001-11-05', '(83) 96655-4433', 'nanda.costa@email.com', '6.789.012'),
('567.890.123-44', 'João Victor Azevedo', '1999-07-20', '(83) 95544-3322', 'joao.azevedo@email.com', '7.890.123');
INSERT INTO CLIENTE (CPF, NOME, DATA_NASCIMENTO, NUM_CELULAR, EMAIL, RG) VALUES
-- Cliente sem celular e sem e-mail (idoso ou sem tecnologia)
('111.222.333-44', 'Antônio da Silva', '1955-03-15', NULL, NULL, '1.222.333'),
-- Cliente sem data de nascimento (dado desconhecido no cadastro)
('222.333.444-55', 'Beatriz Souza', NULL, '(83) 98888-1111', 'bia.souza@teste.com', '2.333.444'),
-- Cliente apenas com dados obrigatórios (CPF e Nome) e RG. O resto NULL.
('333.444.555-66', 'Cláudio Ferreira', NULL, NULL, NULL, '3.444.555');


INSERT INTO FUNCIONARIOS (CPF, NOME, RG, SALARIO, DATA_CONTRATO, CARGO, FALTAS, DATA_NASCIMENTO, NUM_CELULAR, EMAIL) VALUES
('987.654.321-00', 'Roberto Almeida', '2.345.678', 3500.00, '2020-01-15', 'Vendedor Sênior', 0, '1980-05-20', '(83) 91122-3344', 'roberto.vendas@alphamotors.com'),
('876.543.210-99', 'Juliana Mendes', '3.456.789', 4200.00, '2019-03-10', 'Gerente de Vendas', 1, '1988-12-12', '(83) 92233-4455', 'juliana.gerencia@alphamotors.com'),
('765.432.109-88', 'Lucas Pereira', '4.567.890', 2800.00, '2023-06-01', 'Vendedor Júnior', 2, '2002-08-30', '(83) 93344-5566', 'lucas.vendas@alphamotors.com');
INSERT INTO FUNCIONARIOS (CPF, NOME, RG, SALARIO, DATA_CONTRATO, CARGO, FALTAS, DATA_NASCIMENTO, NUM_CELULAR, EMAIL) VALUES
-- Funcionário recém-contratado, ainda sem cargo definido, sem e-mail corporativo
('444.555.666-77', 'Daniela Rocha', '4.555.666', 2500.00, '2024-02-01', NULL, DEFAULT, '2000-01-10', '(83) 97777-2222', NULL),
-- Funcionário antigo, dados de contato desatualizados (NULL)
('555.666.777-88', 'Eduardo Santos', '5.666.777', 3800.00, '2018-05-20', 'Mecânico Chefe', DEFAULT, NULL, NULL, NULL);


INSERT INTO CARROS (NOME, KM, NUM_DONOS, ANO, PRECO, MODELO, STATUS, CARACTERISTICAS) VALUES
('Toyota Corolla XEI', 45000, 1, '2021', 120000.00, 'Sedan', 'Disponível', 
 '{
    "cor": "Prata", 
    "cambio": "Automático CVT", 
    "motor": "2.0", 
    "tipo_combustivel": "Flex", 
    "qnt_lugares": 5, 
    "consumo": "11.6 km/l", 
    "tam_porta_malas": "470 L", 
    "tam_tanque": "50 L"
 }'),

('Honda Civic Touring', 60000, 2, '2019', 115000.00, 'Sedan', 'Vendido', 
 '{
    "cor": "Branco Perolizado", 
    "cambio": "Automático CVT", 
    "motor": "1.5 Turbo", 
    "tipo_combustivel": "Gasolina", 
    "qnt_lugares": 5, 
    "consumo": "12 km/l", 
    "tam_porta_malas": "519 L", 
    "tam_tanque": "56 L"
 }'),

('Fiat Toro Volcano', 30000, 1, '2022', 145000.00, 'Picape', 'Disponível', 
 '{
    "cor": "Vermelho", 
    "cambio": "Automático 9 marchas", 
    "motor": "2.0 Diesel", 
    "tipo_combustivel": "Diesel", 
    "qnt_lugares": 5, 
    "consumo": "10 km/l", 
    "tam_porta_malas": "937 L", 
    "tam_tanque": "60 L"
 }'),

('Hyundai HB20', 15000, 1, '2023', 75000.00, 'Hatch', 'Disponível', 
 '{
    "cor": "Preto", 
    "cambio": "Manual", 
    "motor": "1.0", 
    "tipo_combustivel": "Flex", 
    "qnt_lugares": 5, 
    "consumo": "13.3 km/l", 
    "tam_porta_malas": "300 L", 
    "tam_tanque": "50 L"
 }'),

('Jeep Compass Longitude', 55000, 2, '2020', 130000.00, 'SUV', 'Manutenção', 
 '{
    "cor": "Cinza", 
    "cambio": "Automático 6 marchas", 
    "motor": "2.0 Flex", 
    "tipo_combustivel": "Flex", 
    "qnt_lugares": 5, 
    "consumo": "8.8 km/l", 
    "tam_porta_malas": "410 L", 
    "tam_tanque": "60 L"
 }');
 INSERT INTO CARROS (NOME, KM, NUM_DONOS, ANO, PRECO, MODELO, STATUS, CARACTERISTICAS) VALUES
-- Carro Zero KM (sem donos anteriores, preço a definir pelo gerente)
('Volkswagen Polo Track', 0, NULL, '2024', NULL, 'Hatch', 'Em Trânsito', 
 '{
    "cor": "Branco", 
    "motor": "1.0", 
    "tipo_combustivel": "Flex", 
    "qnt_lugares": 5
 }'), 
 -- Note acima: omiti "cambio", "consumo", etc. no JSON e deixei PRECO e NUM_DONOS como NULL

-- Carro antigo, modelo não especificado no sistema, preço NULL (aguardando avaliação)
('Chevrolet Chevette', 180000, 5, '1992', NULL, NULL, 'Oficina', 
 '{
    "cor": "Bege", 
    "cambio": "Manual", 
    "motor": "1.6", 
    "obs": "Carro para colecionador, precisa de reforma"
 }');
 
 
 INSERT INTO VENDA (FORMA_PAG, DESCONTO, NUM_PARCELAS, JUROS, ENTRADA, VALOR_TOTAL, ID_cliente, ID_carro, ID_funcionario) VALUES
-- Venda do Honda Civic (Carro ID 2) para Mariana (Cliente ID 2) pelo Roberto (Func ID 1)
('Financiamento', 0.00, 48, 1.99, 30000.00, 115000.00, 2, 2, 1),
-- Venda à vista (hipotética) de um carro
('Pix', 5000.00, 1, 0.00, 115000.00, 115000.00, 1, 1, 2);
INSERT INTO VENDA (FORMA_PAG, DESCONTO, NUM_PARCELAS, JUROS, ENTRADA, VALOR_TOTAL, ID_cliente, ID_carro, ID_funcionario) VALUES
-- Venda em negociação: Cliente e Carro definidos, mas valores ainda NULL
(NULL, NULL, NULL, NULL, NULL, NULL, 6, 6, 4),

-- Venda à vista rápida: Sem juros, sem parcelas, sem entrada registrados
('Dinheiro', 1000.00, NULL, NULL, NULL, 18000.00, 7, 7, 5);