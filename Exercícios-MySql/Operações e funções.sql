Use demodb;
SELECT * FROM aluno;

use demodb;
#Inserindo dados na tabela funcionario
	INSERT into turma values (1 ,'Baguceiros', 40);
	INSERT into turma values (2,'Inteligentes', 20);

#Inserindo dados na tabela funcionario
	INSERT into aluno values (1 ,'Jose', 1,'2004/01/28');
	INSERT into aluno values (2 ,'Fernando', 1,'2003/04/20');
	INSERT into aluno values (3 ,'Maria', 2, '2005/05/30');
	INSERT into aluno values (4 ,'Sofia', 2, '2005/01/01');
	INSERT into aluno values (5 ,'Leandro', 2, '2005/02/28');


-- Adicionar coluna genero e nota a tabela aluno
	ALTER table aluno
	ADD (genero varchar(1) NOT NULL),
	ADD (nota int);

-- Atualizar genero e nota para todos os registros
-- Mulheres
	UPDATE aluno
	SET genero = 'F'
	WHERE idaluno = 3 or idaluno = 4;
    
-- Homens
	UPDATE aluno
	SET genero = 'M'
	WHERE idaluno = 1 or idaluno = 2 or idaluno = 5;
    
-- Melhores alunos
	UPDATE aluno
		SET nota = 80
		WHERE idaluno = 1;
        
	UPDATE aluno
		SET nota = 90
		WHERE idaluno = 3;
        
	UPDATE aluno
		SET nota = 60
		WHERE idaluno = 4;
        
-- Bagunceiros
	UPDATE aluno
		SET  nota = 50
		WHERE idaluno = 2;
	UPDATE aluno
		SET  nota = 40
		WHERE idaluno = 5;
    
-- Buscar a maior nota
	SELECT nome, max(nota)
		FROM aluno;
        
-- Buscar a menor nota
	SELECT nome, min(nota)
		FROM aluno;
        
-- Somar as notas dos alunos
	SELECT nome, sum(nota)
		FROM aluno;
        
-- Buscar os alunos que possuem nota maior que 70
	SELECT * FROM aluno
        WHERE nota > 70
        order by nome;
        
-- Calcular a media dos alunos por sexo
	SELECT genero, avg(nota)
		FROM aluno
        group by genero;
        
-- Selecionar com like
	SELECT * FROM aluno
		WHERE nota LIKE 80;
    
-- Selecionar com between
	SELECT * FROM aluno 
    WHERE dtNasc BETWEEN '2004-01-28' AND '2006-12-12'
    order by dtNasc asc;

-- Selecao livre com uma das funções
	SELECT turma.nome, avg(aluno.nota)
		from aluno, turma
		group by aluno.idturma_fk
		order by turma.nome;
		