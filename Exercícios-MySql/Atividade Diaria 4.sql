CREATE DATABASE Treino;
USE Treino;

-- Criando a tabela aluno
CREATE TABLE Aluno(
matricula int primary key auto_increment,
nome Varchar(30),
dtNasc date,
endereco varchar(100),
tel bigint
);

-- Criando a tabela Trabalho
CREATE TABLE Trabalho(
id_trabalho int primary key auto_increment,
nome Varchar(30),
matricula_fk int,
constraint fk_matricula foreign key (matricula_fk)
	references Aluno (matricula) on delete set null on update set null
);
-- inserindo dados

INSERT INTO Aluno values (null,'João','2005-12-21','Rua 3 poderes lote 8', '61998637459'),
						 (null,'Maria','2004-10-11','Rua 3 poderes lote 7','61998236459'),
                         (null,'Sofia','2006-01-29','Rua 3 poderes lote 6','61985937459'),
                         (null,'Ruan','2002-09-03','Rua 3 poderes lote 5','61998637369'),
                         (null,'Gabriel','2007-06-20','Rua 3 poderes lote 4','61998626459');

INSERT INTO Trabalho values (null,'Português',2),
							(null,'Matemática',1),
                            (null,'Geografia',3),
                            (null,'Ed. Física',4),
                            (null,'Artes',5),
                            (null,'Música',2),
                            (null,'História',1),
                            (null,'Sociologia',2),
                            (null,'Física',5),
                            (null,'Química',5);

-- Quantidade de trabalhos feiots por alunos
select a.nome, count(t.matricula_fk)
	from Aluno a, Trabalho t
    where t.matricula_fk = a.matricula
    group by a.nome;
    
-- Nome do aluno e seus trabalhos com WHERE
Select a.nome, t.nome from Aluno a, Trabalho T
	WHERE t.matricula_fk = a.matricula;
    
-- Nome do aluno e seus trabalhos com INNER JOIN
Select a.nome, t.nome from Aluno a
	INNER JOIN Trabalho t
	ON(a.nome = 'maria' and t.matricula_fk = a.matricula);
    
-- Matricula, nome e seus trabalhos
Select a.matricula, a.nome, t.nome From Aluno a
	LEFT OUTER JOIN Trabalho t
	ON(t.matricula_fk = a.matricula);
    
-- Apagar Banco de dados
drop database treino;