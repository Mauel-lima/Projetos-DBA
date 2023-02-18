CREATE DATABASE TREINO;
USE TREINO;

-- Criando tabela medico
CREATE TABLE Medico(
idMedico int NOT NULL primary key auto_increment,
nome varchar (30),
CRM int,
UF varchar(4),
UNIQUE KEY uk_consulta (CRM, UF)
);

-- Criando tabela Paciente
CREATE TABLE Paciente(
idPaciente int NOT NULL primary key auto_increment,
nome varchar(30), 
cpf bigint
);

-- Criando a tabela consulta
CREATE TABLE Consulta(
dtConsulta date, 
hora time, 
valor decimal (6, 2), 
diagnostico varchar(100),
idMedico_fk int, 
idPaciente_fk int, 
CONSTRAINT fk_ConsultaMedico FOREIGN KEY (idMedico_fk)
	REFERENCES Medico (idMedico)
		ON DELETE CASCADE,
CONSTRAINT fk_ConsultaPaciente FOREIGN KEY (idPaciente_fk)
	REFERENCES Paciente (idPaciente)
		ON DELETE CASCADE);

-- 3 registros para  médico
INSERT INTO Medico (nome, CRM, UF) VALUES ("Enzo",17798, "DF"),
										  ("Breno",78666, "GO"),
										  ("Carla",91014, "DF");

-- 6 registros para paciente;
INSERT INTO Paciente (nome, cpf) VALUES ("João", 39892519027),
										("Tiago", 10768734304),
										("Kauê", 68875563080),
										("Marina", 82679904370),
										("Otávio", 85254645628),
										("Sophia", 31664821643);

-- 10 registros para consulta
INSERT INTO Consulta () VALUES ("2022-10-26", "8:30",133.33, "Viruse", 3,5),
							   ("2022-11-03", "10:01", 32, "Hipertensão", 2, 3),
                               ("2022-11-04", "14:15", 85.67, "Hipertensão", 1, 3),
                               ("2022-11-11", "17:42", 132.67, "Depressão", 2, 2),
                               ("2022-11-15", "12:54", 148.33, "Osteoporose", 1, 3),
                               ("2022-11-23", "12:35", 100.33, "AIDS/HIV", 2, 2),
                               ("2022-12-02", "8:28", 41.33, "", 3, 5),
                               ("2022-12-08", "15:15", 41.33, "", 2, 5),
                               ("2022-12-12", "8:45", 85.67, "", 1, 4),
                               ("2022-12-16", "10:48", 69, "", 3, 2);

-- Excluir um registro de paciente
DELETE FROM Paciente
	WHERE idPaciente = 5;

-- Alterar algum registro de médico
UPDATE Medico
	SET nome = "Carla"
	Where idMedico = 3;

-- Alterar diagnóstico de alguma consulta
UPDATE Consulta
	SET diagnostico = "Anemia"
	WHERE dtConsulta = "2022-11-23" AND hora = "12:35" AND idPaciente_fk = 2;

-- Realizar uma consulta que traga o total de consultas realizadas por medico
SELECT m.nome as "Medico", count(c.idMedico_fk) as "Consultas Realizadas"
	FROM Consulta c
	INNER JOIN Medico m ON c.idMedico_fk = m.idMedico
	GROUP BY m.idMedico;

-- Crie uma View que que retorne o nome do médico e seu CRM, a data da consulta, o nome do paciente e o diagnóstico. "CRIAR AINDA"
SELECT *
	FROM Medico m
	INNER JOIN Consulta c ON m.idMedico = c.idMedico_fk
	INNER JOIN Paciente p ON c.idPaciente_fk = p.idPaciente;

-- Adicionar a coluna sexo na tabela Paciente
ALTER TABLE Paciente
	ADD COLUMN sexo char(1);

-- Adicionar valores na coluna que acabou de ser criada
UPDATE Paciente
	SET sexo = "M"
	Where idPaciente IN (1, 2, 3, 5);

UPDATE Paciente
	SET sexo = "F"
	Where idPaciente NOT IN (1, 2, 3, 5);


-- Buscar a quantidade de pacientes por sexo
SELECT sexo, count(sexo) as "Quantidade"
	FROM Paciente
	GROUP BY sexo;

-- Buscar o valor gasto por cliente
SELECT p.nome, SUM(c.valor) as "Valor total"
	FROM Consulta c
	INNER JOIN Paciente p ON c.idPaciente_fk = p.idPaciente
	GROUP BY c.idPaciente_fk;

-- Buscar todos os pacientes que seu nome termine com a letra 'a'
SELECT *
	FROM Paciente 
	WHERE nome LIKE '%a';

-- Excluir o banco de dados
DROP DATABASE Treino;