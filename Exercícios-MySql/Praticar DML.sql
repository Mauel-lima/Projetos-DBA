use empresa;
SELECT * FROM departamento;
SELECT * FROM funcionario;
SELECT * FROM dependentes;

#Inserindo dados na tabela departamento
INSERT into departamento values (1 ,'RH');
INSERT into departamento values (2 ,'Logistica');
INSERT into departamento values (3 ,'Financeiro');
INSERT into departamento values (4 ,'Administrativo');
INSERT into departamento values (5 ,'Transp');


#Inserindo dados na tabela funcionario
INSERT into funcionario values (1 ,'Jose', 'Rua 3 poderes lote 8', '61984161365',1);
INSERT into funcionario values (2 ,'Fernando', 'Rua 3 poderes lote 6', '61984191365',2);
INSERT into funcionario values (3 ,'Maria', 'Rua 3 poderes lote 4', '61984161665',3);
INSERT into funcionario values (4 ,'Sofia', 'Rua 3 poderes lote 2', '61984161565',4);
INSERT into funcionario values (5 ,'Leandro', 'Rua 3 poderes lote 10', '61984161465',5);


#Inserindo dados na tabela dependentes
INSERT into dependentes values (1 ,1,'Jose junior','2002/04/03');
INSERT into dependentes values (2 ,2,'Fernandinho','2005/05/06');
INSERT into dependentes values (3 ,3,'Mariazinha','2003/06/10');
INSERT into dependentes values (4 ,4,'Ana Sofia','2005/02/25');
INSERT into dependentes values (5 ,5,'Leandro junior','2004/01/28');

#Atualizações na tabela dependentes
UPDATE dependentes
SET dtNasc = '2003/04/03'
WHERE codigoDepend = 1;

#Atualização na tabela funcionario
UPDATE funcionario
SET telefone = '61984161362'
WHERE codigoFun = 3;

#Atualização na tabela departamento
UPDATE departamento
SET Descricao = 'Transporte'
WHERE codigoDept = 5;

#Excluir registro
DELETE FROM dependentes
WHERE codigoDepend = 5;
DELETE FROM funcionario
WHERE codigoFun = 5;
DELETE FROM departamento
WHERE codigoDept = 5;



