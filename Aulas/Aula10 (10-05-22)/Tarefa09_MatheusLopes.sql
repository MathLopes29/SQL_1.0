-- PRIMEIRA TABELA --
CREATE TABLE Clientes(
Codcli int,
Nome varchar(30),
Ender varchar(45),
Cidade varchar(25),
Fone char(12),
Idade int ,
constraint pk_Codcli primary key (Codcli),
);

-- SEGUNDA TABELA --
CREATE TABLE Pedidos(
NumPed int,
Cliente int,
Data_Entrega datetime,
Transport int,
constraint pk_Codprod primary key (NumPed),
constraint fk_Codcli foreign key (Cliente)
References Clientes (Codcli),
);

-- TERCEIRA TABELA -- 
CREATE TABLE Transporte(
Codigo int,
Nome varchar(20),
);

-- DROP / SELECT --
Drop Table Clientes;
Drop Table Pedidos;
Drop Table Transportadora;

Select* From Clientes;
Select* From Pedidos;
Select* From Transporte;

-- VALORES --
Insert into Clientes (Codcli,Nome,Ender,Cidade,Fone,Idade)
Values('1','Junior Assunção','Av. Itapark, 3633 ','Mauá','118746320',15),
('2','Lucas Carvalho','R. Padre Viêira, 424 ','Mauá','118746320',25),
('3','Nicolas de Macedo','Av. Dr. Augusto de Toledo, 255','SCS','118746320',19),
('4','Mathias Nacismento','Alameda São Caetano, 2231','Santo André','118746320',22),
('5','Laís Clara','R. Franco da Rocha, 61','SBC','118746320',17);

Insert into Pedidos (NumPed,Cliente,Data_Entrega,Transport)
Values(19456,'1','20220430',01),
(21142,'2','20220415',02),
(37189,'3','20220415',01),
(42150,'4','20220415',02),
(51493,'5','20220415',01);

Insert into Transporte (Codigo,Nome)
Values(01,'ABC'),
(02,'CBA');

-- UPDATE --
Update Clientes Set Cidade = 'São Paulo' Where Codcli = '2';

-- BUSCA POR LETRAS --
Select* From Transporte Where Nome like 'A%';

-- BUSCA POR PEDIDOS --
Select* From Pedidos Where Cliente = '2';
Select Count(Cliente) as 'Qtd_Cliente 2' From Pedidos Where Cliente = '2';

-- DATA MAX. DE ENTREGA --
Select * from Pedidos where Data_Entrega = (Select max(Data_Entrega) from Pedidos);

-- BUSCA DE PEDIDOS EM TRANSPORTADORAS --
Select Count(*) as 'Qtde_Transporte' From Transporte Where Nome like 'ABC';
Select* From Transporte Where Nome like 'CBA';

-- BUSCA POR PESSOAS POR CIDADES --
Select* From Clientes Where Cidade in ('Santo André', 'Mauá', 'SBC');
Select Count(Cidade) as 'QTD_Mauá' From Clientes Where Cidade = 'Mauá';

-- PESQUISA DE TABELAS SIMULTÂNEAS -- INNER JOIN --
Select Clientes.Codcli, Pedidos.NumPed, Transporte.Nome From Pedidos
Inner Join Clientes on Pedidos.Cliente = Clientes.Codcli
inner join Transporte on Pedidos.Transport = Transporte.Codigo;

Select Pedidos.NumPed, Pedidos.Data_Entrega, Clientes.Nome from Pedidos 
inner join Clientes on Pedidos.Cliente = Clientes.Codcli;

-- SELECIONAR CIDADES DE TODOS OS CLIÊNTES --
Select Distinct Cidade from Clientes;

-- MÉDIA DE IDADE --
Select avg(Idade) as 'Media' From Clientes;

-- ÁCIMA | ÁBAIXO DA MÉDIA --
Select* From Clientes Where Idade > (Select avg(Idade) From Clientes);
Select* from Clientes where idade < (SELECT AVG(idade) from Clientes);