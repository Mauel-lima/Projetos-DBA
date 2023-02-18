-- Criando Banco de dados
CREATE DATABASE OBL;
-- Utilizando banco de dados
USE OBL;

-- Criando a tabela Cliente
create table Cliente (
Id_Cliente int primary key auto_increment,
Nome varchar(30),
Email varchar(50),
Saldo_total numeric(7.2),
id_Representante_FK int -- Adicionar constraint na tabela representante
);
 
 -- Criando a tabela Equipe
 create table Equipe (
Id_equipe int primary key auto_increment,
Nome_equipe varchar (30),
N_jogador int,
Desconto decimal(2,2),
RepresentanteEquipe_FK int,
constraint FK_Equipe_RepresentanteEquipe_id_Cliente_FK foreign key (RepresentanteEquipe_FK)
 references Cliente (Id_Cliente) on delete set null on update set null
);

 -- Criando a tabela Representante de Equipe
  create table RepresentanteEquipe(
Id_Cliente_PF int,
Id_Equipe_Fk int,
constraint PF_RepresentanteEquipe_Cliente foreign key (id_cliente_PF)
 references Cliente (Id_Cliente) on delete set null on update set null,
constraint PF_RepresentanteEquipe_Equipe foreign key (id_Equipe_FK)
 references Equipe (Id_Equipe) on delete set null on update set null
);

 -- Criando a tabela individual
  create table Individual (
Id_Cliente_PF int,
CartaoFidelidade char (1),
constraint PF_Individual_Cliente foreign key (id_cliente_PF)
 references Cliente (Id_Cliente) on delete set null on update set null
);
-- Inserindo dados na tabela individual

 -- Criando a tabela Telefone
  create table Telefone (
Id_telefone int primary key auto_increment,
DDD int,
Numero int,
id_Cliente_FK int,
constraint FK_Telefone_Cliente foreign key (id_cliente_FK)
 references Cliente (Id_Cliente) on delete set null on update set null
);
-- Inserindo dados na tabela Telefone

 -- Criando a tabela Endereco
  create table Endereco (
Id_Endereco int primary key auto_increment,
Logadouro varchar (40),
numero int,
CEP bigint,
Bairro varchar (20),
Cidade varchar (20),
UF varchar (2),
Id_cliente_FK int,
constraint FK_Endereco_Cliente foreign key (id_cliente_FK)
 references Cliente (Id_Cliente) on delete set null on update set null
);
-- Inserindo dados na tabela Endereco

 -- Criando a tabela Representante
  create table Representante (
Id_Representante int primary key auto_increment,
Nome varchar (30),
Email varchar (60),
Taxa_Comi decimal(6,2),
Comi_Total decimal(7,2),
Id_Endereco_FK int,
Id_Telefone_FK int,
Id_Representante_FK int,
constraint FK_Representante_Endereco foreign key (id_Endereco_FK)
 references Endereco (Id_Endereco) on delete set null on update set null,
constraint FK_Representante_Telefone foreign key (id_Telefone_FK)
 references Telefone (Id_Telefone) on delete set null on update set null,
constraint FK_Representante_Representante foreign key (id_Representante_FK)
 references Representante (Id_Representante) on delete set null on update set null
);
-- Referenciando Representante na tabela Cliente
ALTER TABLE Cliente
ADD constraint FK_Cliente_Representante foreign key (id_Representante_FK)
 references Representante (Id_Representante) on delete set null on update set null;
-- Inserindo dados na tabela Representante



 -- Criando a tabela Atende
  create table Atende (
Id_Representante_PF int,
Id_Equipe_PF int,
constraint PF_Atende_Representante foreign key (id_Representante_PF)
 references Representante (Id_Representante) on delete set null on update set null,
constraint PF_Atende_Equipe foreign key (id_Equipe_PF)
 references Equipe (Id_Equipe) on delete set null on update set null
);
-- Inserindo dados na tabela Atende

 -- Criando a tabela Compra
create table Compra (
Id_Compra int primary key auto_increment,
Dt_Compra date,
V_Total decimal(7,2),
Qtd_itens int,
Id_cliente_FK int,
constraint FK_Compra_Cliente foreign key (id_cliente_FK)
 references Cliente (Id_Cliente) on delete set null on update set null
);
-- Inserindo dados na tabela Compra

 -- Criando a tabela Produto
  create table Produto (
Id_produto int primary key auto_increment,
item varchar (30),
Quantidadde int,
Valor decimal(7,2),
Categoria varchar (30),
Tamanho varchar (4),
Cor varchar (20),
Descricao varchar(60)
);
-- Inserindo dados na tabela Produto

 -- Criando a tabela Contem
  create table Contem (
id_Compra_PF int,
id_Produto_PF int,
constraint PF_Contem_Compra foreign key (id_Compra_PF)
 references Compra (Id_Compra) on delete set null on update set null,
constraint PF_Contem_Produto foreign key (id_Produto_PF)
 references Produto (Id_Produto) on delete set null on update set null
);
-- Inserindo dados na tabela Contem

 -- Criando a tabela inventario
  create table Inventario (
Id_inventario int primary key auto_increment,
uni_atacado int,
uni_disponivel int,
Id_produto_FK int,
constraint FK_inventario_produto foreign key (id_produto_FK)
 references produto (Id_produto) on delete set null on update set null
);
-- Inserindo dados na tabela inventario

 -- Criando a tabela historico
  create table historico (
Id_historico int primary key auto_increment,
Dt_inicio date,
Dt_Fim date,
preco decimal(7,2)
);
-- Inserindo dados na tabela historico

 -- Criando a tabela Compoem
  create table compoem (
id_produto_PF int,
id_historico_PF int,
constraint PF_id_produto foreign key (id_produto_PF)
 references produto (Id_produto) on delete set null on update set null,
 constraint PF_id_historico foreign key (id_historico_PF)
 references historico (Id_historico) on delete set null on update set null
);
-- Inserindo dados na tabela Compoem

/*                           INSERINDO DADOS NAS TABELAS                             */

-- Inserindo dados na tabela Cliente
insert into cliente (Nome, Email, Saldo_total) values 
('Ana carvalho','ana1990@gmail.com',1000),
('Beto ferreira','beto1266@gmail.com',2000),
('juliana marques','julianamarques882@gmail.com',50),
('jose Moreira','josemdossants@gmail.com',9987),
('Eduardo gonçales','dudugonçales@gmail.com',2321),
('Joao ferreira','ferreirajoao@gmail.com',3213),
('Caio Carvalho','carvalhocaio@gmail.com',3213),
('Iago Moreira','Iagom12343@gmail.com',2323),
('Joaldson pereira','Pereira51623@gmail.com',1001),
('Eduarda Marques','marquesEduarda@gmail.com',98),
('Maria fernada','fernanda99876@gmail.com',97),
('Carlos Rafael','carlao7765@gmial.com',987),
('Gabriel rafael','rafaelgabriel@gmial.com',102),
('Marcos Rocha','Marcosro121233@gmail.com',241),
('Gabriela marques','gabimarqs12990@gmail.com',423);

-- Inserindo dados na tabela Equipe
insert into Equipe ( Nome_equipe, RepresentanteEquipe_FK ,N_jogador) values
('Arizona',1,6),
('Atlanta',3,10),
('Baltimore',5,25),
('Boston Red Sox',7,40),
('Chicago Cubs',9,15),
('Cleveland Indians',11,30),
('Detroit Tigers',13,45),
('Houston Astros',15,4);

-- Inserindo dados na tabela individual
insert into Individual(Id_Cliente_PF,CartaoFidelidade) Values
(2,'S'),
(1,'S'),
(5,'S'),
(3,'S'),
(7,'S'),
(4,'S'),
(6,'S'),
(9,'S'),
(8,'S'),
(10,'S'),
(11,'S'),
(12,'S'),
(14,'S'),
(13,'S'),
(15,'N');

-- Inserindo dados na tabela Telefone
insert into Telefone (DDD,Numero,id_Cliente_FK) values
(65,32656656,3),
(61,326565565,2),
(35,2155425,6),
(12,1255155,1),
(66,122555555,4),
(61,21256336,5),
(39,12546665,7),
(32,164646,8),
(61,226266,14),
(62,15525845,13),
(62,225666,12);

-- Inserindo dados na tabela Endereco
Insert into Endereco (Logadouro,numero,CEP,Bairro,Cidade,UF,Id_cliente_FK) values 
('Rua José Alves 462',11,'21365445','anhanguera','Rio de Janeiro','RJ',1),
('Rua Medusa 825',6,'56669525', 'novo hamburgo','Recife','PE',3),
('Rua Deputado Manoel da Costa lima 1812',12,'336665214', 'jardim as aves','Jataí','GO',2),
('Rua José de Brito 1188',10,'23565952', 'san juan','João Monlevade','MG',5),
('2ª Travessa João Francisco Ribeiro 1680',2,'6598856', 'jardim dos anjos','Igarassu','PE',4),
('Rua Bernardo Kelner 480',15,'221156632',' pinheiro','Nova Iguaçu','RJ',7),
('Praça Dom Malan 541',12,'14656866','casadeval','Petrolina','PE',6),
('Quadra Quadra 002 Conjunto G 363',15,'3263551166','setor norte','Brazlândia','DF',9),
('Parque Carlos Lacerda 187',12,'36599854','cariri','Rio de Janeiro','RJ',8),
('Rua Vital Barbosa de Melo 259',3,'36251425', 'carrilhado','Recife','PE',11),
('Rua Cecílio Gonçalves 1856',6,'3255954', 'cabra mansa','Mogi das Cruzes','SP',10),
('Rua Nove 1352',25,'2654659','carros santos','Belo Horizonte','MG',12),
('Rua da Tangerineira 1027',52,'3655924','caramelos voadosres','Boa Vista','RR',13),
('Travessa Miosótis 709',125,'32659981','laranjeiras','Petrópolis','RJ',14),
('Rua Garibaldi 1157',250,'1254622','Praça João Paulo','Várzea Paulista','SP',2),
('Rua José Salge 280',52,'266598844', 'ubatuba','Uberaba','MG',3),
('Rua Anna Campos Mellão 1128',15,'31324645', 'caramelo azul','São Paulo','SP',11),
('Travessa Elvira Carvalho 1543',12,'12542658', 'passo fundo','Itabuna','BA',12),
('Rua Marcos Freire 885',10,'12546669','barroa alto','Barreiras','BA',14),
('Rua Aventino 1217',13,'125469855', 'alto paraiso','Belo Horizonte','MG',8);

-- Inserindo dados na tabela Representante
Insert into Representante(Nome,Email,Taxa_Comi,Comi_Total,Id_Endereco_FK,Id_Telefone_FK,Id_Representante_FK) values 
('Eduarda C Goncalves','EduardaCarvalhoGoncalves@einrot.com',2.2,5.2,1,2,null),
('Isabelle Barbosa','IsabellePereiraBarbosa@superrito.com',3.5,5.1,2,10,1),
('Estevan Rocha','EstevanRodriguesRocha@teleworm.us',3.5,3.2,2,2,1);

-- Inserindo dados na tabela Atende
insert into Atende(Id_Representante_PF,Id_Equipe_PF) values
(1,7),
(2,6),
(3,8),
(1,5),
(2,1),
(3,8),
(1,6),
(2,3),
(3,2),
(1,4),
(2,5),
(3,7),
(1,2),
(2,4),
(3,8);

-- Inserindo dados na tabela Compra
insert into Compra (Dt_Compra,V_Total,Qtd_itens,Id_cliente_FK) values
("2022-11-12",100.00,3,5),
("2022-01-05",25.99,5,1),
("2022-09-03",29.99,10,3),
("2022-02-01",152.99,3,5),
("2022-03-14",129.25,14,10),
("2022-02-19",100.00,3,12),
("2022-02-05",25.99,5,15),
("2022-05-03",29.99,1,5),
("2022-05-01",152.99,6,5),
("2022-06-14",149.25,2,6),
("2022-08-12",100.00,2,4),
("2022-04-05",25.99,5,6),
("2022-04-03",29.99,1,4),
("2022-04-01",152.99,3,7),
("2022-03-17",129.25,5,9),
("2022-03-12",100.00,3,3),
("2022-11-03",25.99,1,1),
("2022-09-03",29.99,1,1),
("2022-09-12",152.99,23,8),
("2022-06-15",129.25,2,1);

-- Inserindo dados na tabela Produto
insert into Produto (item,Quantidadde,Valor,Categoria,Tamanho,Cor,descricao) values
("camiseta", 120 , 45.35,"vestuario","p","branca","sem manga"),
("blusa",400, 54.00,"vestuario","p","vermelha","manga longa"),
("shorts",300, 119.00,"vestuario","p","preto","tactel"),
("camiseta", 120 , 45.35,"vestuario","m","verde","com mangas"),
("blusa",400, 54.00,"vestuario","m","azul","masculina manga longa"),
("shorts",300, 119.00,"vestuario","m","marrom","moletom"),
("camiseta", 120 , 45.35,"vestuario","g","amarelo","manga curta"),
("blusa",400, 54.00,"vestuario","g","preto","personalizada"),
("shorts",300, 119.00,"vestuario","g","vermelho","personalizado"),
("bone",125,129.99,"vestuario",null,null,"personalizado"),
("luva",150,99.99,"vestuario",null,null,"couro"),
("meia",140,129.50,"vestuario",null,null,"meiao"),
("kit equipamentos de treino",159,300.00,"kit",null,null,"kit completo"),
("bola",89,25.00,"equipamento",null,null,"méddia");

-- Inserindo dados na tabela Contem
insert into Contem (id_Compra_PF,id_Produto_PF) values
(1,11),
(2,10),
(3,9),
(4,3),
(5,4),
(6,4),
(7,6),
(8,9),
(9,4),
(10,5),
(1,1),
(2,1),
(3,5),
(4,1),
(5,1),
(6,3),
(7,7),
(8,1),
(9,6),
(10,4),
(11,3);

-- Inserindo dados na tabela inventario
 insert into Inventario (uni_atacado,uni_disponivel,Id_produto_FK) values
(10,150,11),
(20,130,10),
(3,150,9),
(40,192,3),
(5,150,4),
(6,95,4),
(17,300,6),
(20,36,9),
(10,190,4),
(10,300,5),
(10,300,11);

-- Inserindo dados na tabela historico
insert into historico (Dt_inicio,Dt_Fim,preco) values
("2022-01-01","2022-11-10",100.00), 
("2022-01-01","2022-01-30",120.00),
("2022-01-03","2022-01-30",95.00),
("2022-01-02","2022-01-15",89.99),
("2022-02-19","2022-10-02",90.99),
("2022-02-13","2022-12-13",125.99),
("2022-03-01","2022-10-02",52.99),
("2022-06-12","2022-10-02",35.00),
("2022-10-10","2022-11-10",120.99),
("2022-12-09","2022-12-31",85.00),
("2022-10-15","2022-10-20",35.99);

-- Inserindo dados na tabela Compoem
insert into compoem (id_produto_PF,id_historico_PF) values
(1,2),
(2,5),
(3,1),
(4,6),
(5,9),
(6,10),
(7,3),
(8,4),
(9,7),
(10,8),
(12,11),
(13,5),
(14,10);

/*                                              UPDATE NA TABELA EQUIPE                                 */

-- Sem desconto para quem tem menos de 9 jogadores
UPDATE Equipe
 SET Desconto= 0
    where(N_jogador < 9 AND Id_Equipe <> 0);
-- Inserindo desconto de 5% para os que tem no minimo de 9 jogadores e no maximo 24
UPDATE Equipe
 SET Desconto= 0.05 
    where(N_jogador >= 9 AND N_jogador < 25   AND Id_Equipe <> 0);
-- Inserindo desconto de 10% para os que tem no minimo de 25 jogadores e no maximo 39
UPDATE Equipe
 SET Desconto= 0.1 
    where(N_jogador >= 25   AND N_jogador < 40 AND Id_Equipe <> 0);
-- Inserindo desconto de 20% para os que tem mais de 40 jogadores
UPDATE Equipe 
SET 
    Desconto = 0.2
WHERE
    (N_jogador >= 40 AND Id_Equipe <> 0);