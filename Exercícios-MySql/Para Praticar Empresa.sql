CREATE database empresa; -- criação do banco de dados empresa
USE empresa; -- Usar o banco de dados empresa

CREATE table Funcionario( -- criação da tabela funcionario, e as colunas
codigoFun int,
nome varchar(30) NOT NULL,
endereco VARCHAR(60),
telefone bigint,
cod_departamento_fk int,
constraint pk_codigoFun primary key (codigoFun) -- Atribuindo codigoFun como chave primária
);

CREATE table Departamento( -- criação da tabela Departamento, e as colunas
codigoDept int,
Descricao varchar (20) NOT NULL,
constraint pk_codigoDept primary key (codigoDept) -- Atribuindo codigoDept como chave primária
);

CREATE table Dependentes(  -- criação da tabela Dependentes, e as colunas
codigoDepend int,
cod_funcionario_fk int,
nome varchar (20) NOT NULL,
dtNasc date NOT NULL,
constraint pk_codigoDepend primary key (codigoDepend) -- Atribuindo codigoDepend como chave primária
);

-- Alteração da tabela Funcionario para referenciar a chave estrangeira
ALTER table Funcionario
ADD constraint fk_FunDept foreign key (cod_departamento_fk)
	references Departamento(codigoDept);
    
-- Alteração da tabela Dependetes para referenciar a chave estrangeira
ALTER table Dependentes
ADD constraint fk_DependFun foreign key (cod_funcionario_fk)
	references Funcionario(codigoFun)