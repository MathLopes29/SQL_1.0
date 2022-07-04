 -- PRIMEIRA TABELA --
CREATE TABLE Alunos(
RM Int,
Nome varchar(45),
Curso int,
Serie int,
Periodo varchar(20),
Constraint pk_RM primary key (RM),
)

-- SEGUNDA TABELA --
CREATE TABLE Disciplinas(
CodDisc int,
Nome_Disc varchar (20), 
Constraint pk_CodDisc primary key (CodDisc),
)

-- TERCEIRA TABELA --
CREATE TABLE Cursos(
CodCurso int,
Nome_Curso varchar (30), 
Constraint pk_CodCurso primary key (CodCurso),
)

-- QUARTA TABELA --
CREATE TABLE Notas(
RM_Notas int,
Discipl int,
Nota1 numeric (10,2),
Nota2 numeric (10,2),
Constraint RM_Discipl primary key (RM_Notas,Discipl),
Constraint fk_RM foreign key (RM_Notas)
References Alunos (RM),
Constraint fk_Discipl foreign key (Discipl)
References Disciplinas (CodDisc),
)

-- REGISTRO DE DADOS --
Insert Into Alunos(RM,Nome,Curso,Serie,Periodo)
Values('1','Matheus','2','3','Matutino'),
('2','Lucas','5','1','Noturno'),
('3','Igor','1','2','Vespertino '),
('4','Luana','4','3','Matutino'),
('5','Giovanna','3','2','Vespertino');

Insert Into Disciplinas(CodDisc,Nome_Disc)
Values('1','MAT'),
('2','LP'),
('3','FIS'),
('4','QUIM'),
('5','HIST');

Insert Into Cursos(CodCurso,Nome_Curso)
Values('1','Informatica'),
('2','Plastico'),
('3','Plastico'),
('4','Informatica'),
('5','Informatica');

Insert Into Notas(RM_Notas,Discipl,Nota1)
Values('1','1',8.0),
('2','3',5.4),
('3','2',7.2);

Insert Into Notas(RM_Notas,Discipl,Nota2)
Values('4','5',7.7),
('5','4',5.9);


-- BUSCA E DROP DE DADOS --
Select* From Alunos;
Select* From Disciplinas;
Select* From Cursos;
Select* From Notas;

Drop Table Alunos;
Drop Table Disciplinas;
Drop Table Cursos;
Drop Table Notas;


-- C)Selecionar nome, período e série de todos os alunos do curso de Informática --
Select Alunos.Nome, Alunos.Serie, Alunos.Periodo, Cursos.Nome_Curso  From Alunos Inner Join Cursos 
on Curso = CodCurso 
Where Cursos.Nome_Curso = 'Informatica'; 

--D) Selecionar Nome do aluno, curso, nome da disciplina, nota1 e nota2, de todos os alunos --
Select Alunos.Nome, Alunos.Curso, Disciplinas.CodDisc, Notas.Nota1, Notas.Nota2 From Alunos Inner Join Notas
on RM = RM_Notas
Inner Join Disciplinas 
on Discipl = CodDisc;

-- E) Selecionar todas as notas do aluno (Seu nome)--
Select * From Alunos Where Nome = 'Matheus';

Select Alunos.Nome, Notas.Nota1, Notas.Nota2  From Alunos Inner Join Notas 
on RM = RM_Notas
Where Nome = 'Matheus';

-- F) Selecionar RM, nome e curso de todos os alunos com nota1 superior a 8 na disciplina MAT --
Select Alunos.RM, Alunos.Nome , Cursos.CodCurso, Disciplinas.Nome_Disc, Notas.Nota1 From Alunos Inner Join Notas
on RM = RM_Notas
Inner Join Cursos
on Curso = CodCurso
Inner Join Disciplinas
on Discipl = CodDisc
Where Nome_Disc = 'MAT'
;

-- G) Quantas notas (nota1) inferior a 6,0, em Banco de Dados --
Select (Nota1) From Notas Where Nota1 <6.0;

-- H) Qual a média de Notas (Nota2) na disciplina LP? --
Select AVG (Nota2) as 'Media' From Notas;

-- I) Quantos alunos temos no curso de Informática? --
Select Alunos.Nome, Cursos.CodCurso, Cursos.Nome_Curso From Alunos Inner Join Cursos
on Curso = CodCurso
Where Nome_Curso like 'Informatica';

Select Count (*) From Cursos Where Nome_Curso like 'Informatica';

-- J) Quantos alunos temos no curso de Plástico? --
Select Count(*) From Cursos Where Nome_Curso like 'Plastico';

Select Alunos.Nome, Cursos.CodCurso, Cursos.Nome_Curso From Alunos Inner Join Cursos
on Curso = CodCurso
Where Nome_Curso like 'Plastico';

-- K) Selecionar todos os alunos que não possuem Nota1 --
Select Count(*) From Notas Where Nota1 is null;

Select Alunos.Nome, Notas.RM_Notas, Notas.Nota1 From Alunos Inner Join Notas
on RM = RM_Notas
Where Nota1 is null;

-- L) Selecionar todos os alunos que não possuem Nota2 --
Select Alunos.Nome, Notas.RM_Notas, Notas.Nota2 From Alunos Inner Join Notas
on RM = RM_Notas
Where Nota2 is null;

-- M) Selecionar todos os alunos que não possuem Nota1 em MAT.--
Select Alunos.Nome, Cursos.Nome_Curso, Notas.RM_Notas, Notas.Nota1 From Alunos Inner Join Cursos
on Curso = CodCurso Inner Join Notas
on RM = RM_Notas
Where Nota1 is null;
