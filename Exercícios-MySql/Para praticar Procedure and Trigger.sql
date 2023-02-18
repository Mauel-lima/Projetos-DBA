use demodb; 
select * from aluno; 
select * from turma; 
select * from matricula; 
DROP PROCEDURE Nota_aluno;

-- Criar procedure que atualize a nota do aluno conforme parametro passado pelo usuário
CREATE PROCEDURE Nota_aluno(IN id_aluno int, nota_aluno int)
	UPDATE aluno
	SET nota= nota_aluno
    where idAluno = id_aluno;
Call Nota_aluno(1, 90);

-- Criar uma trigger que diminua a capacidade da tabela turma, conforme um novo aluno é matriculado
DROP TRIGGER Diminui_capacidade;
Delimiter $
CREATE TRIGGER Diminui_capacidade AFTER INSERT
ON matricula
FOR EACH ROW
BEGIN
	UPDATE turma, matricula
	SET capacidade = capacidade - 1
    where (matricula.idturma_fk = turma.idturma AND idturma_fk <> 0);
END $
Delimiter ;
/* Teste
insert into matricula value (1,2);
insert into matricula value (5,1);*/

-- Criar uma trigger que caso o aluno desista de continuar na turma, a capacidade volte ao valor que era sem ele
DROP TRIGGER Aumentar_capacidade;
Delimiter $
CREATE TRIGGER Aumentar_capacidade AFTER DELETE
ON matricula
FOR EACH ROW
BEGIN
	UPDATE turma, matricula
	SET capacidade = capacidade + 1
    where (matricula.idturma_fk = turma.idturma AND idturma_fk <> 0);
END $
Delimiter ;
/* Teste
DELETE from matricula
where idAluno_fk = 5;*/