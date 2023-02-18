CREATE DATABASE Treino; -- craindo database
use Treino; -- Usando o database

 create table cliente( -- criando tabela cliente
 idCliente int auto_increment,
 nome varchar (30) not null,
 constraint pk_idCliente primary key (idCliente)); -- definindo chave primária
 
 create table roupa ( -- criando tabela roupa
 idRoupa int auto_increment,
 nome varchar (30) not null,
tamanho varchar (3), -- enum('pp',p',m')
valor decimal (6,2),
constraint pk_idRoupa primary key (idRoupa) -- definindo chave prmária
);

create table compra( -- criando tabela compra
dtCompra date,
qdt int, 
idCliente_fk int,
idRoupa_fk int,
constraint fk_idCliente foreign key (idCliente_fk) -- definido chave estrangeira para cliente
	references cliente (idCliente) on delete set null on update set null, -- Referenciando a chave primária, e definindo para null se deletar ou alterar
constraint fk_idRoupa foreign key (idRoupa_fk) -- definido chave estrangeira para Roupa
	references roupa (idRoupa) on delete set null on update set null  -- Referenciando a chave primária, e definindo para null se deletar ou alterar
);
-- Inserindo dados na tabela cliente
INSERT INTO cliente (nome) values ('Bia'),
								  ('Joãozinho');
-- Inserindo dados na tabela roupa                                  
INSERT INTO roupa (nome,tamanho,valor) values ('Camisa','M',9999),
                                              ('Bermuda','P',15.99),
                                              ('Short','G',99),
                                              ('Casaco','M',30.00),
                                              ('Vestido','P',150),
                                              ('Saia','GG',15),
                                              ('Camiseta','P',300.99),
                                              ('Meia','M',50),
                                              ('Camisa Polo','G',99.99),
                                              ('Cinto','U',100);
-- Inserindo dados na tabela compra                                             
INSERT INTO Compra (dtCompra, qdt, idCliente_fk, idRoupa_fk) values ('2022-10-15',3,1,10),
                                                                    ('2022-02-28',2,1,4),
                                                                    ('2022-03-15',5,2,5),
                                                                    ('2022-03-15',2,2,9),
                                                                    ('2022-10-10',10,1,3);
                                                                    
-- Excluindo um registro de roupa
delete from roupa
where idRoupa= 10;

-- Alterando 1 registro de roupa
update roupa
set valor = 99.99
where idRoupa=1;

-- Alterando 1 registro de compra
update compra
set dtCompra= '2022-10-25'
where idCliente_fk=1 and dtCompra='2022-10-10';


-- Alterando chave estrangeira (roupa) de compra para 5 se for nulo
update compra 
set idRoupa_fk=5
where idRoupa_fk is null;

-- Selecionar toda a tabela de compra
select * from compra;

-- Conta o total de compras por idCliente e ordena pelo nome dos clientes
select cliente.nome, count(compra.idCliente_fk) -- selecionando o nome na tabela cliente
	from cliente, compra
    where compra.idCliente_fk=cliente.idCliente
    group by cliente.nome;

-- Conta o total de compras por idCliente e ordena pelo nome dos clientes usando o inner join
select cliente.nome, count(compra.idCliente_fk) -- o 'count' conta a quantidade de vezes que a variavel informada aparece 
	from cliente inner join compra
		on compra.idCliente_fk= cliente.idCliente
	group by cliente.nome;
    
-- Quantidade de produtos vendidos por dia
select compra.dtCompra 'data', sum(qdt) -- 'sum' soma os valores que entram
	from compra
    group by dtCompra;
    
-- Quantidade de produtos vendidos por dia maiores que 7
select dtCompra, sum(qdt)
	from compra 
    where qdt > 7
    group by dtCompra;
    
-- Quantidade de produtos vendidos por dia maiores que 7 usando having para restringir
select dtCompra, sum(qdt)
	from compra 
    group by dtCompra 
    having sum(qdt)>7;

-- Quantidade de produtos vendidos por data menores quem uma data x e que seja ordenado em ordem decrscente
select compra.dtCompra 'data', sum(qdt)
	from compra -- 'FROM' de algum lugar
    where dtCompra < '2023-07-01' -- 'where' onde tal coisa acontece
    group by dtCompra -- 'group by' traz todos os valores especificados da coluna
    order by dtCompra desc; -- 'asc' 'desc' para crescente/decrescente e 'order by' ordena a coluna mas traz todas as colunas da tabela
   
-- Os clientes em ordem alfabética, order by já faz isso
select * from cliente order by nome; 

-- média de valores ordenada pelo tamanho, 'avg' calcula a média aritmética
select tamanho, avg(valor) from roupa group by tamanho;

-- Quantidade de produtos por tamanho
select tamanho, count(*) from roupa group by tamanho;
 
 -- Quantidade de produtos comprados por cliente e o valor total gasto
 select c.nome, sum(cp.qdt) 'qdtTotal',sum(r.valor) 'vlr unitario Total' , -- Soma o total da quantidade e os valores unitários
     sum(r.valor * cp.qdt) 'vlrTotal' -- soma o valor total a partir da multiplicação do valor pela quantidade
	from cliente c inner join compra cp 
    on c.idCliente=cp.idCliente_fk
    inner join roupa r
		on r.idRoupa=cp.idRoupa_fk
        group by c.nome;

-- Exclui o banco de dados
DROP database treino;
