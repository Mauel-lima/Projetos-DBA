use empresa;
-- Uma View que traga o Dependente, o funcionário do qual é dependente;
CREATE VIEW depend_Funcionario AS
SELECT dep.nome as Dependente, f.nome as funcionario
FROM dependentes dep, funcionario f
WHERE dep.cod_funcionario_fk = f.codigoFun
;
/*Teste
SELECT * FROM depend_Funcionario;
*/

--  outra View que retorne o nome do funcionário e a quantidade de dependentes que cada um deles possui.
CREATE VIEW QtdDepend_Funcionario AS
SELECT count(dep.nome) OVER (PARTITION BY f.CodigoFun) as Dependente, f.nome as funcionario
FROM dependentes dep, funcionario f
WHERE dep.cod_funcionario_fk = f.codigoFun 
;
/*Teste
SELECT * FROM QtdDepend_Funcionario;
*/

-- Outra View que retorne o departamento e a quantidade de funcionários que cada um possui.
CREATE VIEW QtdFuncionario_Dept AS
SELECT dept.Descricao as 'Departamento', count(f.cod_departamento_fk) OVER (PARTITION BY dept.codigoDept ) as 'QTD funcionarios'
FROM departamento dept, funcionario f
WHERE dept.codigoDept = f.cod_departamento_fk
;
/*Teste
SELECT * FROM QtdFuncionario_Dept;
*/

--  Outra View que retorne o dependente, o funcionário do qual é dependente, e o departamento do funcionário.
CREATE VIEW FUN_DEPT_DEPEND AS
SELECT dep.nome as 'Dependente', f.nome as 'funcionario', dept.Descricao 'Departamento'
FROM  Dependentes dep, departamento dept, funcionario f
WHERE (dep.cod_funcionario_fk = f.codigoFun and f.cod_departamento_fk = codigoDept)
;
/*Teste
SELECT * FROM FUN_DEPT_DEPEND;
*/