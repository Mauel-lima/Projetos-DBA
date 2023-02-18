Use demodb;

-- Mudar nome de uma tabela
alter table produto
CHANGE Preço_normal preco_normal decimal(7,2);


CREATE FUNCTION fn_mult(x Decimal(5,2), y int)
RETURNS int deterministic
RETURN x * y;
SELECT fn_mult(1.5,4) as Multiplicação;

CREATE FUNCTION fn_msg(texto varchar(20))
RETURNS VARCHAR (30) deterministic
RETURN CONCAT("Olá ",texto," como vai??");

SELECT fn_msg("Mauel") as saudação;
SELECT fn_msg(dtNasc) as saudação from aluno;

CREATE FUNCTION fn_brData(vData date)
RETURNS varchar(20) deterministic
RETURN DATE_FORMAT(vData, "%d/%c/%Y");

SELECT fn_brData("2012/12/21") as databr;

-- Criando a tabela Produto
CREATE TABLE produto(
idProduto int primary key auto_increment,
nome Varchar(30),
preco_normal decimal(7,2),
estoque int
);

-- Inserindo valores
INSERT INTO produto values 
(null,"monitor",500,5),
(null,"pão",20,10),
(null,"mouse",45,20),
(null,"açai",25,15),
(null,"macarrão",5,15);
SELECT * FROM produto;

Delimiter &
CREATE FUNCTION fn_calcDesc(vProduto int, desconto decimal(10,2))
RETURNS decimal(10,2) READS SQL DATA
BEGIN
	DECLARE vPreco decimal(10,2);
	SELECT preco_normal FROM produto
		WHERE idProduto = vProduto into vPreco;
	RETURN vPreco * desconto;
END &
Delimiter ;

SELECT fn_calcDesc(2,2);
SELECT fn_calcDesc