USE AlphaMotors;

select * from CLIENTE;
select * from FUNCIONARIOS;
select * from CARROS;
select * from VENDA;

SELECT NOME, MODELO, CARACTERISTICAS->>'$.motor' as Motor
FROM CARROS
WHERE CARACTERISTICAS->>'$.cambio' LIKE 'Auto%';

SELECT id_funcionario, nome, cpf, cargo, salario 
from funcionarios 
where cargo like 'Vend%';

SELECT id_carro as ID, nome as Nome,caracteristicas->>'$.cor' as Cor, preco as Preço 
from carros 
where caracteristicas->>'$.cor' like 'Preto';

SELECT id_carro as ID, nome as Nome, caracteristicas->>'$.cor' as Cor, status as Status ,preco as Preço 
from carros 
where status like 'Dispon%';

select nome, modelo, preco, ano, km, caracteristicas->>'$.tipo_combustivel' as Combustivel 
from Carros 
where num_donos > 1;

select nome, modelo, preco, ano, km, caracteristicas->>'$.consumo' as consumo 
from Carros 
where caracteristicas->>'$.tipo_combustivel' like 'Flex%';

select nome, cpf, salario, cargo 
from funcionarios 
where data_nascimento > '2000-01-10';