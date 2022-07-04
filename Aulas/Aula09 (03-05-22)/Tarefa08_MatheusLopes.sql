-- PRIMEIRA TABELA --
CREATE TABLE Clientes(
Codcli int,
Nome varchar(30),
Ender varchar(45),
Bairro varchar(25),
Cidade varchar(20),
Idade int ,
constraint pk_Codcli primary key (Codcli),
);

-- SEGUNDA TABELA --
CREATE TABLE Produtos(
Codprod int,
Descrição varchar(30),
Preco numeric(9,2), 
Qtde_estq int,
constraint pk_Codprod primary key (Codprod),
);

-- TERCEIRA TABELA  --
CREATE TABLE Pedidos(
Codped int,
Codcli int,
Data_Entrega datetime, 
constraint pk_Codped primary key (Codped),
constraint fk_Codcli foreign key (Codcli)
References Clientes (Codcli),
);

-- QUARTA TABELA --
CREATE TABLE Itens_pedido(
Codped int,
Codprod int,
Qtde int,
Constraint pk_item primary key (codped,codprod),
Constraint fk_Codped foreign key (Codped)
References Pedidos (Codped), 
Constraint fk_Codprod foreign key (Codprod)
References Produtos (Codprod),
);

-- BUSCA DE DADOS --
Select * From Clientes;
Select* From Produtos;
Select* From Pedidos;
Select* From Itens_pedido;

-- DELETAR TABELA --
Drop Table Clientes;
Drop Table Produtos;
Drop Table Pedidos;
Drop Table Itens_pedido;

-- REGISTRO --
Insert into Clientes (Codcli,Nome,Ender,Bairro,Cidade,Idade)
Values('1','Thiago Neves','Av. Itapark, 3633 ','Jardim Itapark Velho','Mauá',19),
('2','Italo Manuel','R. Padre Viêira, 424 ','Jardim Miranda D.Aviz','Mauá',25),
('3','Lucas Nascimento','Av. Dr. Augusto de Toledo, 255','Santa Paula','SCS',34),
('4','Jane Carvalho','Alameda São Caetano, 2231','Santa Maria','SCS',28),
('5','Ana Clara Lopes','R. Franco da Rocha, 61','Vila Vitoria','Santo André',21),
('6','Guilherme Sarutobi','Av. Maria Servidei Demarchi, 1308','Demarchi','SBC',15);

Insert into Produtos (Codprod,Descrição,Preco, Qtde_estq)
Values('23584716','Naruto Gold Vol.1',45.00,'15'),
('54697123','Demon Slayer Vol.1',42.00,'10'),
('30487922','Jujutsu Kaisen Vol.1',30.00,'8'),
('40562879','One Piece Box Set 4',959.00,'1'),
('15640187','Watchmen - Edição Definitiva',155.00,'3');

-- O GUILHERME E A ANA COMPRARAM O MESMO LIVRO ... WATCHMEN --

Insert into Pedidos (Codped,Codcli,Data_Entrega)
values(6024,'1','20220813'),
(7743,'2','20220212'),
(8502,'3','20220415'),
(9112,'4','20220729'),
(1087,'5','20220215'),
(9364,'6','20220415');

Insert Into Itens_pedido (Codped,Codprod,Qtde)
Values(6024,'23584716',1),
(7743,'15640187',1),
(8502,'40562879',1),
(9112,'30487922',1),
(1087,'54697123',1),
(9364,'15640187',1);


-- UPDATE DE VALORES --
Update Itens_pedido set Qtde = 3 Where Codped = '8502';

Update Produtos set Qtde_estq = 9 Where Codprod = '15640187';


-- BUSCA ENTRE PREÇOS --
Select * From Produtos Where Preco between 10 and 70;


-- MÉDIA DE IDADE --
Select avg(Idade) as 'Media' from Clientes;
Select* From Clientes Where Idade > (Select Avg(Idade) From Clientes);

-- MÉDIA DE PREÇO --
Select avg(Preco) as 'Media' from Produtos;
-- PRODUTOS ÁCIMA DA MÉDIA --
Select * From Produtos Where Preco > (Select avg(Preco) From Produtos);


-- NUMERO DE PEDIDOS --
Select Count (*) From Pedidos;

-- CIDADES DOS CLIÊNTES --
Select Count(Cidade) From Clientes ;
Select Distinct Cidade From Clientes;
Select * From Clientes Where Cidade = 'SBC';


-- AUMENTO DE 10% --
UPDATE Produtos SET Preco = Preco*0.10+ Preco;


-- PEDIDOS DO CLIENTE DE CODIGO 1 --
Select Count(*) From Pedidos Where Codcli = '1';
Select * From Pedidos Where Codcli = '1';


-- SELECIONAR NOME QUE COMEÇA COM A LETRA 'A' --
Select* From Clientes Where Nome like 'A%';