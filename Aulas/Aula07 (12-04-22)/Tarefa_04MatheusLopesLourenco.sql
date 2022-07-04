-- TABELA --
CREATE TABLE Cadastro_ProdDoceria(
	Codprod  int NOT NULL,
	Nome varchar(40) NOT NULL,
	Marca char(25),
	Descrição varchar(40),
	Preço numeric(9,2),
	Qtde int,
	Color char(20),
	constraint key_car PRIMARY KEY(Codprod)
);

-- PRODUTOS / REGISTRO --
INSERT INTO Cadastro_ProdDoceria(Codprod, Nome, Marca, Descrição, Preço, Qtde, Color)
VALUES(01,'Five Stars', 'Lacta', 'Chocolate em Barra de 40g', 2.50, 25, 'Dourado'),
(02,'Snickers', 'Mars', 'Chocolate em Barra de 45g', 2.00, 20, 'Marrom'),
(03,'Kit Kat', 'Nestle', 'Chocolate em Barra de 42g', 3.50, 20, 'Vermelho'),
(04,'Tablete lacreme mezzo', 'Cacau Show', 'Chocolate em Barra de 100g', 14.50, 20, 'Branco'),
(05,'Tablete lacreme ao leite', 'Cacau Show', 'Chocolate em Barra de 100g', 14.50, 20, 'Branco'),
(06,'Toblerone', 'Mondelez', 'Barra de Chocolate ao Leite de 100g', 22.00, 15, 'Amarelo'),
(07,'Chocolate Swiss Classic', 'Lindt', 'Chocolate ao leite em Barra de 100g', 30.00, 13, 'Azul'),
(08,'Ovo Tripla Camada Oreo', 'Lacta', 'Ovo de Pascoa Tripla Camada de 350g', 57.00, 30, 'Azul'),
(09,'Milka Oreo', 'Mondelēz International', 'Chocolate em Barra de 100g com Oreo', 14.00, 17,'Roxo'),
(10,'Ovo clássicos 7kg', 'Cacau Show', 'Ovo de Pascoa de 7Kg', 1000.00, 8, 'Marrom'),
(11,'Ovo de Páscoa Classic ao Leite', 'Nestle', 'Ovo de Pascoa de 350g', 65.00, 32, 'Vermelho'),
(12,'Ovo de Pascoa Ferrero Rocher', 'Ferrero', 'Ovo de Pascoa de 185g', 50.00, 27, 'Dourado'),
(13,'Ovo Língua de Gato Extra Cremoso', 'Kopenhagen', 'Ovo de Pascoa de 300g', 130.00, 15, 'Preto'),
(14,'Ovo Língua de Gato Branco', 'Kopenhagen', 'Ovo de Pascoa de 300g', 125.00, 15, 'Branco'),
(15,'Ovo Língua de Gato Ao Leite 500G', 'Kopenhagen', 'Ovo de Pascoa de 500g', 170.00, 15, 'Preto'),
(16,'Ovo Repleto 4 Clássicos 270G', 'Kopenhagen', 'Ovo de Pascoa de 270g', 140.00, 15, 'Vermelho'),
(17,'Ovo Repleto 4 Clássicos 270G', 'Kopenhagen', 'Ovo de Pascoa de 270g', 140.00, 15, 'Vermelho'),
(18,'Ovo Exagero Nhá Benta 400G', 'Kopenhagen', 'Ovo de Pascoa de 400g', 148.00, 15, 'Branco'),
(19,'Ovo de Páscoa Milka Oreo 156g', 'Mondelēz International', 'Ovo de Pascoa de 156g', 90.00, 15, 'Roxo'),
(20,'Petit Gateau Chocolate Mr Bey 240g', 'Mondelēz International', 'Petti Gateau Mr Bey 240g', 72.00, 15, 'Roxo');

-- BUSCA --
SELECT* FROM Cadastro_ProdDoceria;

-- DROP/EXCLUSÃO DA TABELA --
DROP TABLE Cadastro_ProdDoceria;

-- EXCLUIR PRODUTOS COM QTDE ABAIXO DE 5 --
DELETE FROM Cadastro_ProdDoceria WHERE Qtde<5;

-- PRODUTOS ENTRE 10 E 50 --
SELECT * FROM Cadastro_ProdDoceria
WHERE Preço BETWEEN 10 AND 50;

SELECT COUNT(*) FROM Cadastro_ProdDoceria
WHERE Preço BETWEEN 10 AND 50;


-- MAX VALOR DE PREÇO --
SELECT MAX(Preço) AS 'MAIOR VALOR' 
FROM Cadastro_ProdDoceria;

--MIN VALOR DE PREÇO --
SELECT MIN(Preço) AS 'MINIMO VALOR'
FROM Cadastro_ProdDoceria;

-- MÉDIA DE PREÇO --
SELECT AVG(Preço) AS 'MEDIA' 
FROM Cadastro_ProdDoceria;


-- LISTAGEM DE CORES EM ORDEM --
SELECT * 
FROM Cadastro_ProdDoceria 
WHERE Color in ('Vermelho', 'Azul','Branco', 'Preto')
ORDER BY Codprod asc;

SELECT * 
FROM Cadastro_ProdDoceria 
WHERE Color in ('Vermelho')
ORDER BY Codprod asc;

-- LISTAGEM DE CORES DISTINTAS --
SELECT DISTINCT (Color)
FROM Cadastro_ProdDoceria;


-- QUAL A QTDE DE REGISTROS NO CADASTRO? --
SELECT COUNT(*) AS 'REGISTRO' 
FROM Cadastro_ProdDoceria;


-- SOMATÓRIA DOS PREÇOS --
SELECT SUM(Preço) AS 'SOMATORIO' 
FROM Cadastro_ProdDoceria;

-- SOMATÓRIA DAS QTDE DOS PRODUTOS --
SELECT SUM(Qtde) AS 'SOMATORIO'
FROM Cadastro_ProdDoceria;


-- UPDATE DE DADOS --
UPDATE Cadastro_ProdDoceria SET Preço ='1000.00' 
WHERE CODPROD = 10;

-- AUMENTO DE 15% -- <$10
UPDATE Cadastro_ProdDoceria SET Preço = (Preço*'0.15')+Preço
WHERE Preço<10;

--DESCONTO DE 5% -- >$500
UPDATE Cadastro_ProdDoceria SET Preço = (-Preço*'0.05')+Preço
WHERE Preço>500;

-- LISTAGEM DE DESCRIÇÃO --
SELECT *
FROM Cadastro_ProdDoceria 
WHERE Descrição like 'Ovo%'
ORDER BY Codprod asc;