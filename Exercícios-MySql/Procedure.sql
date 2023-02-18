use demodb;
drop PROCEDURE pr_mostrarPreco;
CREATE PROCEDURE pr_mostrarPreco(item int)
SELECT CONCAT("O item ", nome, " custa ", preco_normal, " reais") as valor
from produto where idProduto = item;

call pr_mostrarPreco(2);
select * from aluno;
create table matricula(
idAluno_fk int,
constraint fk_idAluno foreign key (idAluno_fk)
	references aluno (idAluno) on delete set null on update set null
);
alter table matricula
add idturma_fk int,
ADD constraint fk_idturma foreign key (idturma_fk)
	references turma (idturma) on delete set null on update set null
;
alter table aluno
drop fk_AlunoTurma;
drop idturma_fk;
 drop PROCEDURE sp_alunos_Aula;
Delimiter $
CREATE PROCEDURE sp_alunos_Aula(aula varchar(30))
Begin
	SELECT t.nome as "nome da turma", a.nome as "nome aluno"
		FROM aluno a inner join matricula m
			ON(a.idAluno = m.idAluno_fk)
		inner join turma t
			ON(m.idturma_fk = t.idturma)
		where t.nome = aula;
END $
Delimiter ;
call sp_alunos_Aula("inteligentes");