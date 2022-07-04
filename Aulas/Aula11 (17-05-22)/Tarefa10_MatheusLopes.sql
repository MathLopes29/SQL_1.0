 -- PRIMEIRA TABELA --
CREATE TABLE Est_Cliente(
CPF varchar(13),
Nome varchar(30),
Nascto datetime,
Constraint pk_CPF primary key (CPF),
)

-- SEGUNDA TABELA --
CREATE TABLE Est_Modelo(
CodMod int,
Descr varchar(40),
Constraint pk_CodMod primary key (CodMod),
)

-- TERCEIRA TABELA --
CREATE TABLE Est_Patio(
Num int,
Ender varchar(40),
Capacidade int, 
Constraint pk_Num primary key (Num),
)

-- QUARTA TABELA --
CREATE TABLE Est_Veiculo(
Placa varchar(8),
Cliente_cpf varchar(13),
Modelo int,
Cor varchar(20),
Ano int,
Constraint pk_Placa primary key (Placa),
Constraint fk_Cliente_cpf foreign key (Cliente_cpf)
References Est_Cliente (CPF),
Constraint fk_Modelo  foreign key (Modelo)
References Est_Modelo (CodMod),
)

-- QUINTA TABELA -- 
CREATE TABLE Est_Estaciona(
Codigo int,
Patio_Num int,
Placa_Veic varchar(8),
Data_Entr datetime,
Data_Saida datetime,
Hora_Entr varchar(10),
Hora_Saida varchar(10),
constraint pk_Codigo primary key (Codigo),
Constraint fk_patio_num  foreign key (Patio_Num)
References Est_Patio (Num),
)

-- DROP / SELECT --
Drop Table Est_Cliente
Drop Table Est_Modelo
Drop Table Est_Patio
Drop Table Est_Veiculo
Drop Table Est_Estaciona

Select* From Est_Cliente
Select* From Est_Modelo
Select* From Est_Patio
Select* From Est_Veiculo
Select* From Est_Estaciona


-- REGISTROS --
Insert into Est_Cliente (CPF,Nome,Nascto)
Values('52847906634','Lucas Carvalho','20030729'),
('14805932972','João de Macedo','20040915'),
('84620135701','Mathias Nacismento','19951025'),
('46980034569','Mathias Nacismento','19780705'),
('21478603546','Laís Clara','19840318')

Insert into Est_Modelo (CodMod,Descr)
Values(1,'Fiat Toro 2022 - Automatico'),
(2,'Onix Plus 2022 - Manual'),
(3,'HR-V 2022 - Automatico'),
(4,'Corola GLI 2022 - Automatico'),
(5,'Cruze 2023 - Automatico')

Insert into Est_patio (Num,Ender,Capacidade)
Values('10','A1','4'),
('20','B4','4'),
('30','C7','4'),
('40','D6','4'),
('50','E5','4')

Insert into Est_Veiculo (Placa,Cliente_cpf,Modelo,Cor,Ano)
Values('MJQ-7620','52847906634','1','Vermelho','2022'),
('FIX-2097','14805932972','2','Prata','2022'),
('ZPQ-3349','84620135701','3','Cinza','2022'),
('SWP-2118','46980034569','4','Preto','2022'),
('JJJ-2020','21478603546','5','Branco','2022')

Insert into Est_Estaciona (Codigo,Patio_Num,Placa_Veic,Data_Entr,Data_Saida,Hora_Entr,Hora_Saida)
Values('1','10','MJQ-7620','20220510','20220515','135242','182037'),
('2','20','FIX-2097','20220130','20220312','083032','1538955'),
('3','30','ZPQ-3349','20220418','20220622','175048','221045'),
('4','40','SWP-2118','20211220','20220729','160029','092843'),
('5','50','JJJ-2020','20221007','20221209','120021','171256');

-- c)Placa e Nome de Todos os Veiculos --
Select Est_Veiculo.Placa, Est_Veiculo.Cliente_cpf, Est_Cliente.Nome From Est_Veiculo Inner Join Est_Cliente 
on Est_Cliente.CPF = Est_Veiculo.Cliente_cpf;

-- d)Exiba o CPF e o nome do cliente que possui o veículo de placa MJQ-7620 --
SELECT Est_Cliente.CPF, Est_Cliente.Nome, Est_Veiculo.Placa FROM Est_Cliente INNER JOIN Est_Veiculo
ON CPF = Cliente_cpf
WHERE Est_Veiculo.Placa = 'MJQ-7620';

-- e)Exiba a placa e a cor do veículo que possui o código de estacionamento 1 --
SELECT Est_Veiculo.Placa, Est_Veiculo.Cor, Est_Estaciona.Codigo FROM Est_Veiculo INNER JOIN Est_Estaciona
ON  Placa = Placa_Veic
WHERE CODIGO = '1';

-- f)Exiba a placa e o ano do veículo que possui o código de estacionamento 1 --
SELECT Est_Veiculo.Placa, Est_Veiculo.Ano, Est_Estaciona.Codigo FROM Est_Veiculo INNER JOIN Est_Estaciona
ON PLACA = Placa_Veic
WHERE Codigo = '1';

-- g)Exiba a placa, o ano do veículo e a descrição de seu modelo, se ele possuir ano a partir de 2000 --
SELECT Est_Veiculo.Placa, Est_Veiculo.Ano, Est_Modelo.Descr FROM Est_Veiculo INNER JOIN Est_Modelo
ON CodMod = Modelo
WHERE ANO BETWEEN 2022 AND (SELECT MAX(Est_Veiculo.Ano) FROM Est_Veiculo);

-- h)Exiba o endereço, a data de entrada e de saída dos estacionamentos do veículo de placa “ZPQ-3349" --
SELECT Est_Patio.Ender, Est_Estaciona.Data_Entr, Est_Estaciona.Data_Saida FROM Est_Patio INNER JOIN Est_Estaciona
ON Num = Patio_Num
WHERE Est_Estaciona.Placa_Veic = 'ZPQ-3349';


--i)Exiba a quantidade de vezes que os veículos de cor preto estacionaram --
SELECT COUNT (*) AS 'QUANTIDADE DE VEZES ESTACIONADAS'
FROM Est_Estaciona INNER JOIN Est_Veiculo
ON Est_Estaciona.Placa_Veic = Est_Veiculo.Placa
WHERE Est_Veiculo.Cor = 'Preto';


-- j)Liste todos os clientes que possuem carro de modelo 1 --
SELECT Est_Cliente.*, Est_Modelo.Descr, Est_Modelo.CodMod FROM Est_Cliente INNER JOIN Est_Veiculo
ON Est_Cliente.CPF = Est_Veiculo.Cliente_cpf
INNER JOIN Est_Modelo ON Est_Modelo.CodMod = Est_Veiculo.Modelo
WHERE Est_Modelo.CodMod = '1';


-- k) Liste as placas, os horários de entrada e saída dos veículos de cor BRANCO --
SELECT Est_Veiculo.Placa, Est_Estaciona.Hora_Entr, Est_Estaciona.Hora_Saida, Est_Veiculo.Cor
FROM Est_Veiculo INNER JOIN Est_Estaciona ON Est_Veiculo.Placa = Est_Estaciona.Placa_Veic
WHERE Est_Veiculo.Cor = 'Branco';


-- l) Liste todos os estacionamentos do veículo de placa “SWP-2118” --
SELECT Est_Veiculo.Placa, Est_Estaciona.* FROM Est_Estaciona INNER JOIN Est_Veiculo
ON Est_Veiculo.Placa = Est_Estaciona.Placa_Veic
WHERE Est_Veiculo.Placa = 'SWP-2118';


-- m)  Exiba o nome do cliente que possui o veículo cujo código do estacionamento é 2 --
SELECT Est_Cliente.Nome, Est_Veiculo.Modelo, Est_Estaciona.Codigo FROM Est_Cliente INNER JOIN Est_Veiculo
ON Est_Cliente.CPF = Est_Veiculo.Cliente_cpf INNER JOIN Est_Estaciona
ON Est_Estaciona.Placa_Veic = Est_Veiculo.Placa
WHERE Est_Estaciona.Codigo = '2';


--n) Exiba o CPF do cliente que possui o veículo cujo código do estacionamento é 3 --
SELECT Est_Cliente.Nome, Est_Cliente.CPF, Est_Estaciona.Codigo FROM Est_Cliente INNER JOIN Est_Veiculo ON
Est_Cliente.CPF = Est_Veiculo.Cliente_cpf INNER JOIN Est_Estaciona
ON Est_Estaciona.Placa_Veic = Est_Veiculo.Placa
WHERE Codigo = '3';


-- o) Exiba a descrição do modelo do veículo cujo código do estacionamento é 2 --
SELECT Est_Modelo.Descr, Est_Estaciona.Codigo FROM Est_Modelo INNER JOIN Est_Veiculo
ON Est_Modelo.CodMod = Est_Veiculo.Modelo INNER JOIN Est_Estaciona
ON Est_Estaciona.Placa_Veic = Est_Veiculo.Placa
WHERE Est_Estaciona.Codigo = '2';


-- p) Exiba a placa, o nome dos donos e a descrição dos modelos de todos os veículos --
SELECT Est_Veiculo.Placa, Est_Cliente.Nome, Est_Modelo.Descr FROM Est_Cliente INNER JOIN Est_Veiculo
ON Est_Cliente.CPF = Est_Veiculo.Cliente_cpf INNER JOIN Est_Modelo
ON Est_Modelo.CodMod = Est_Veiculo.Modelo;


Select Count (*) as 'Qtde_EstaCinza' From Est_Estaciona Where Placa_Veic like 'ZPQ-3349';

-- q) Exiba todos os Clientes com o Nome João --
Select (Nome) From Est_Cliente Where Nome like '%João%';

-- r) Selecionar Cor dos carrros --
Select Distinct Cor From Est_Veiculo;

-- s) Veiculos Lançados dps de 2020 --
Select* From Est_Veiculo Where Ano>2020