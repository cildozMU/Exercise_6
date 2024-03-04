-------------------------------------------------------------------------------------------
-- Criação da tabela Estudantes
-------------------------------------------------------------------------------------------
CREATE TABLE Estudantes (
    ID INTEGER,
    Nome VARCHAR(255),
    Valor INTEGER
);
-------------------------------------------------------------------------------------------
-- Inserção de dados na tabela Estudantes
-------------------------------------------------------------------------------------------
INSERT INTO Estudantes (ID, Nome, Valor) VALUES
(1, 'Julia', 81),
(2, 'Carol', 68),
(3, 'Maria', 99),
(4, 'Andreia', 78),
(5, 'Jaqueline', 63),
(6, 'Marcela', 88);
-------------------------------------------------------------------------------------------
-- Criação da tabela Notas
-------------------------------------------------------------------------------------------
CREATE TABLE Notas (
    Conceito INTEGER,
    Min_Valor INTEGER,
    Max_Valor INTEGER
);
-------------------------------------------------------------------------------------------
-- Inserção de dados na tabela Notas
-------------------------------------------------------------------------------------------
INSERT INTO Notas (Conceito, Min_Valor, Max_Valor) VALUES
(1, 0, 9),
(2, 10, 19),
(3, 20, 29),
(4, 30, 39),
(5, 40, 49),
(6, 50, 59),
(7, 60, 69),
(8, 70, 79),
(9, 80, 89),
(10, 90, 100);
-----------------------------------------------------------------------------------
-- QUERY --
-----------------------------------------------------------------------------------
-- 1. SELECIONA O NOME,  E O NOTAS DOS ALUNOS:
SELECT
  -- Se a nota for maior ou igual a 8, mostra o nome do aluno, caso contrário, mostra 'NULL'
  CASE
    WHEN Notas.Conceito >= 8 THEN Estudantes.Nome
    ELSE 'NULL'
  END AS Name,
  -- Seleciona a nota
  Notas.Conceito,
  -- Seleciona o valor do aluno
  Estudantes.Valor
FROM
  -- Junta as tabelas Estudantes e Notas usando o valor do aluno para determinar a faixa de notas
  Estudantes
JOIN
  Notas ON Estudantes.Valor BETWEEN Notas.Min_Valor AND Notas.Max_Valor
WHERE
  -- Filtra apenas notas maiores ou iguais a 8 ou notas menores que 8 com valores não nulos
  Notas.Conceito >= 8
  OR (Notas.Conceito < 8 AND Estudantes.Valor IS NOT NULL)
-- Ordena os resultados em ordem decrescente de nota, em ordem alfabética pelo nome (se nota >= 8)
-- e em ordem crescente de valor (se nota < 8)
ORDER BY
  Notas.Conceito DESC,
  CASE
    WHEN Notas.Conceito >= 8 THEN Estudantes.Nome
  END ASC,
  Estudantes.Valor ASC;
