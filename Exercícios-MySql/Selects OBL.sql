USE OBL;

/*                                              SELECTS DO PROJETO                                */ 
 
 -- 1. Usando a instrução SELECT *, mostre todos os dados armazenados na tabela cliente.
 SELECT * FROM cliente;

-- 2. Usando a instrução SELECT *, mostre todos os dados armazenados na tabela time.
SELECT * FROM equipe;

/* 3. Usando a instrução SELECT *, mostre todos os dados armazenados na tabela item, ordenado
por nome, em ordem decrescente.*/
SELECT * FROM produto
ORDER BY item DESC; 

-- 4. Exiba o nome, a descrição e a categoria de todos os itens da tabela.
SELECT item, categoria, Descricao FROM produto; 

-- 5. Crie uma consulta que utilize a função SUM.
 SELECT SUM(N_jogador) Jogadores FROM equipe;

-- 6. Crie uma consulta que utilize a função Concat.
SELECT CONCAT('A equipe ', 
Nome_equipe,' é representada pelo(a) cliente ', 
Nome,'.') AS representantes FROM equipe, cliente
WHERE RepresentanteEquipe_FK = Id_Cliente; 

-- 7. Crie uma consulta para a tabela item que retorne aqueles cujo preço esteja entre 3 e 10.
SELECT * FROM produto
WHERE valor BETWEEN 3 AND 10;

-- 8. Crie uma consulta que exiba todos os clientes que seu nome inicie com a letra A.
SELECT * FROM cliente
WHERE nome LIKE 'a%';  

-- 9. Crie uma consulta utilizando o operador AND e outra consulta com operador OR.
SELECT * FROM produto
INNER JOIN compra
inner join contem 
ON contem.id_Compra_PF = Id_Compra 
AND contem.id_Produto_PF = Id_produto 
GROUP BY Id_Compra ;

/*10. Exiba todas as informações sobre os representantes de vendas e seus endereços usando
uma junção.*/
SELECT * FROM representante, endereco
WHERE Id_Representante = Id_Endereco_FK;

/* 11. Adapte a consulta da pergunta anterior para mostrar somente o id, o nome, o sobrenome, e
o número do telefone dos representantes de vendas.*/
SELECT Id_Representante, nome, DDD, numero 
FROM representante, telefone
WHERE Id_Representante = Id_Telefone_FK;

-- 12. Use o INNER JOIN unir a tabela de clientes e a de representantes de vendas.
SELECT * FROM CLIENTE c
INNER JOIN REPRESENTANTE r 
ON c.id_representante_fk = r.Id_Representante;

/* 13. Usando a resposta da Tarefa 3, adicione uma junção para que o nome da equipe
representada pelo cliente seja incluído nos resultados.*/
-- Não feito, Que tarefa 3?

/*14. Usando a resposta da Tarefa 4, adicione mais uma condição para mostrar somente os
resultados do cliente com o número ‘1’.*/
-- Não feito, Que tarefa 4?

-- 15. Crie uma consulta utilizando OUTER JOIN, envolvendo a tabela ‘time’.
SELECT e.Nome_equipe, c.nome FROM equipe e
LEFT OUTER JOIN Cliente c 
ON e.RepresentanteEquipe_FK = c.id_cliente
UNION SELECT e.Nome_equipe, c.nome
FROM equipe e RIGHT OUTER JOIN Cliente c
ON e.RepresentanteEquipe_FK = c.id_cliente;						

-- 16. Crie um produto cartesiano entre as tabelas de clientes e de representante de vendas.
SELECT * FROM CLIENTE CROSS JOIN REPRESENTANTE;