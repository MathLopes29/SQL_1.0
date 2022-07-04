-- Selecionar todos os produtos com valor unitário acima da média. --

SELECT * from Produtos where
Valor_unit > (SELECT AVG(Valor_unit) from Produtos);

-- Selecionar todos os produtos com a data do cadastro igual à mais recente --

SELECT * from Produtos where 
Data_cad = (SELECT MAX(Data_cad) from Produtos);

-- Selecionar todos os produtos com valor unitário igual ao produto mais barato. --

SELECT * from Produtos where
Valor_unit = (SELECT MIN(Valor_unit) from Produtos);