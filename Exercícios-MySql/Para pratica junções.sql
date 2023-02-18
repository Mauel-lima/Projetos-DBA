USE empresa;
Select * from dependentes;
Select * from funcionario;
Select * from departamento;

-- Nome do funcionário e seus repectivos dependetes utilizando WHERE
Select f.nome, d.nome from funcionario f, dependentes d
	WHERE f.codigoFun = d.cod_funcionario_fk;

-- Descrção do departamento e todos os dados de seus respectivos funcionários utilizando INNER JOIN
Select * from departamento dpt -- Duvida, pois não retorna só a descrição do departamento
	INNER JOIN funcionario f
	ON(dpt.codigoDept = f.cod_departamento_fk);

-- Um produto cartesiano com os departamentos e os funcionários
SELECT * FROM departamento, funcionario; -- ou
SELECT * FROM departamento CROSS JOIN funcionario;

-- Todos os departamentos com seus respectivos funcionários ou associado com valor null os que não possui funcionário. LEFT OUTER JOIN
Select dpt.Descricao, f.nome From departamento dpt 
	LEFT OUTER JOIN funcionario f 
	ON(dpt.codigoDept = f.cod_departamento_fk);

-- Todos os Funcionários com seus respectivos Dependentes ou associado ao valor null quando não possuir dependentes. RIGHT OUTHER JOIN
Select d.nome 'nome dependentes', f.nome From dependentes d 
	RIGHT OUTER JOIN funcionario f 
	ON(f.codigoFun = d.cod_funcionario_fk);