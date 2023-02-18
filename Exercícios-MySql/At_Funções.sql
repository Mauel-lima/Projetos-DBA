/* construa uma função que retorne a quantidade de dias que se passaram desde a última
consulta de um paciente. A função deve receber apenas o id do paciente como parâmetro:
-- Dica1:
 para retornar da data atual, utilize a função CURDATE() - sem argumentos;
-- Dica2:
 para subtrair uma data de outra e retornar o valor em dias, utilize a seguinte função: DATEDIFF(maior data, menor data) 
 - essa função retornará a diferença entre a maior e a menor data inseridas como argumentos 
 – lembre-se de colocar as datas no formato correto (yyyy/mm/dd) e entre aspas*/
 
 USE treino;
 SELECT * FROM consulta;
  drop FUNCTION Dias_consulta
Delimiter &
CREATE FUNCTION Dias_consulta(id_paciente int)
RETURNS int READS SQL DATA
BEGIN
	DECLARE ultimaData date;
	SELECT max(dtConsulta), idpaciente_fk FROM consulta
		WHERE idpaciente_fk = id_paciente into @ultimaData;
	RETURN (DATEDIFF(CURDATE(), @ultimaData));
END &
Delimiter ;

SELECT Dias_consulta(3);