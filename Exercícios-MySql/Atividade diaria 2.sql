USE treino;
select * from Disco;
select * from Musica;
select * from Cantor;
select * from possui;

#Registros para disco
insert into Disco values(1,'Barões da pisadinha','forro');
insert into Disco values(2,'MC lan','funk');
insert into Disco values(3,'Topo','Eletrônica');

#Registros músicas
insert into Musica values(1,'Tic Tac',2);
insert into Musica values(2,'Juliana',2);
insert into Musica values(3,'Tá rocheada',1);
insert into Musica values(4,'Esquema preferido',1);
insert into Musica values(5,'Passarinho que som é esse',3);

#Excluir registro de Musica
DELETE FROM Musica
WHERE IdMusica = 5;

#Excluir registro de disco
DELETE FROM Disco
WHERE IdCd = 3;

#Alterar registros
UPDATE Disco
SET nome = 'DJ Topo'
WHERE IdCd = 3;

UPDATE Musica
SET nome = 'Xuliana'
WHERE idMusica = 2;

#Inserir cantores
insert into Cantor values(1,'Barões','61984161365');
insert into Cantor values(2,'Lan','61984161362');
insert into Cantor values(3,'Topo','61984161326');

#Inserir na tabela possui
insert into possui values(1,3);
insert into possui values(2,1);
insert into possui values(3,4);

#Excluir banco de dados
DROP database treino