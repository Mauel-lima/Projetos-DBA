-- Criando o banco de dados
CREATE database treino;
use treino;

-- Criação da tabela Disco, e as colunas
CREATE table Disco(
IdCd int,
nome varchar(30) NOT NULL,
constraint pk_IdCd primary key (IdCd) -- Atribuindo IdCd como chave primária
);

-- Criação da tabela Musica, e as colunas
CREATE table Musica(
IdMusica int,
nome varchar(30) NOT NULL,
cantor varchar(30) NOT NULL,
IdDisco_fk int,
constraint pk_IdMusica primary key (IdMusica) -- Atribuindo IdMusica como chave primária
);


-- Alteração da tabela Musica para referenciar a chave estrangeira
ALTER table Musica
ADD constraint IdMusica_Disco_FK foreign key (IdDisco_fk)
	references Disco(IdCd),
-- Alteração da tabela Musica
DROP COLUMN cantor;
    
-- Alteração da tabela Disco
ALTER table Disco
ADD (estilo varchar(30) NOT NULL);



-- Criando tabela cantor
CREATE table cantor(
IdCantor int,
nome varchar(30) NOT NULL,
telefone bigint,
constraint pk_IdCantor primary key (IdCantor) -- Atribuindo IdCantor como chave primária
);

-- Relacionamento n:n entre Cantor e musica gera uma tabela
CREATE table possui(
IdCantor_fk int,
IdMusica_Fk int
);

-- Alteração da tabela possui para referenciar a chave estrangeira
ALTER table possui
ADD constraint IdCantor_Musica_FK foreign key (IdCantor_fk)
	references cantor(IdCantor),
ADD constraint IdMusica_Cantor_FK foreign key (IdMusica_fk)
	references Musica(IdMusica);