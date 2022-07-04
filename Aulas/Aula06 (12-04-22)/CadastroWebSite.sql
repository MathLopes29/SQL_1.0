-- CREATE --
CREATE TABLE CadastroWebSite(
	Id int NOT NULL,
	Nome varchar(40),
	Ender varchar(20),
	Email varchar(20),
	Telefone varchar(12),
	CPF char(11),
	Valor_in numeric(10,2),
	constraint pk_car PRIMARY KEY(Id)
);

-- DROP --
DROP TABLE CadastroWebSite;

-- INSERT INTO and VALUES --
INSERT INTO CadastroWebSite(Id,Nome,Ender,Email,Telefone,CPF,Valor_in)
VALUES (01,'Matt','Av.Rui Carlos,554','matt@gmail.com','992245370','52260034927',78054.6);

INSERT INTO CadastroWebSite(Id,Nome,Ender,Email,Telefone,CPF,Valor_in)
VALUES (02,'Carlos','Av Paulista 1078','carlos@outlook.com', '789653214','45678935701',78900.5);

INSERT INTO CadastroWebSite(Id,Nome,Ender,Email,Telefone,CPF,Valor_in)
VALUES(03,'Pedri','Rua Barcelona 89','pedri@gmail.com','477693254','96375423109',25041.9);

-- BUSCA DE DADOS --
SELECT* FROM CadastroWebSite ;
 
-- BUSCA DE DADOS POR LETRA E ORDEM --
SELECT * FROM CadastroWebSite WHERE nome like 'm%'  ORDER BY nome asc ;


-- UPDATE --
UPDATE CadastroWebSite 
SET ENDER='Av.Rui.Barbosa,33' 
WHERE ID = 1
;

-- ALTER TABLE  --
ALTER TABLE CadastroWebSite 
ADD Telefone varchar(9) 
;

-- ALTER DROP COLLUM --
ALTER TABLE CadastroWebSite
DROP COLLUM Telefone
;

-- SELECIONAR TODOS OS NOMES DE PEDRI, MESSI, NEYMAR --
SELECT *
FROM CadastroWebSite
WHERE Nome ='Pedri' or Nome = 'Messi' or Nome = 'Neymar'
;

SELECT*
FROM CadastroWebSite
WHERE Nome in ('Pedri', 'Messi', 'Neymar')
;

-- QUAL A QTDE DE REGISTROS NO CADASTRO? -- COUNT --
SELECT COUNT(*)
AS 'QTDE' 
FROM CadastroWebSite
;

-- SOMATÓRIA DOS VALORES -- SUM --
SELECT SUM(Valor_in)
AS 'SOMATORIO' 
FROM CadastroWebSite
;

-- MAX VALOR --
SELECT MAX(Valor_in)
AS 'MAIOR VALOR' 
FROM CadastroWebSite
;

--MIN VALOR --
SELECT MIN(Valor_in)
AS 'MINIMO VALOR'
FROM CadastroWebSite
;

-- MÉDIA DE VALORES --
SELECT AVG(Valor_in)
AS 'MEDIA' 
FROM CadastroWebSite
;