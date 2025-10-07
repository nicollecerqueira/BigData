#Nicolle Cerqueira da Silva 
#20220075347

  
-- EXERCÍCIO 1

CREATE KEYSPACE IF NOT EXISTS universidade_comunitaria
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE universidade_comunitaria;

CREATE TABLE IF NOT EXISTS professores (
    id_professor UUID PRIMARY KEY,
    nome TEXT,
    disciplina TEXT,
    cidade TEXT
);

INSERT INTO professores (id_professor, nome, disciplina, cidade)
VALUES (uuid(), 'Rafaela Souza', 'Banco de Dados', 'Campina Grande');

INSERT INTO professores (id_professor, nome, disciplina, cidade)
VALUES (uuid(), 'Carlos Henrique', 'Redes de Computadores', 'João Pessoa');

INSERT INTO professores (id_professor, nome, disciplina, cidade)
VALUES (uuid(), 'Juliana Rocha', 'Programação Web', 'Patos');

SELECT * FROM professores;


-- EXERCÍCIO 2

CREATE TABLE IF NOT EXISTS alunos (
    id_aluno UUID PRIMARY KEY,
    nome TEXT,
    curso TEXT,
    idade INT,
    cidade TEXT
);

INSERT INTO alunos (id_aluno, nome, curso, idade, cidade)
VALUES (uuid(), 'Lucas Lima', 'Engenharia da Computação', 22, 'Campina Grande');

INSERT INTO alunos (id_aluno, nome, curso, idade, cidade)
VALUES (uuid(), 'Mariana Ribeiro', 'Sistemas de Informação', 20, 'João Pessoa');

INSERT INTO alunos (id_aluno, nome, curso, idade, cidade)
VALUES (uuid(), 'Pedro Nunes', 'Ciência da Computação', 24, 'Patos');

UPDATE alunos
SET cidade = 'Sousa'
WHERE id_aluno = (SELECT id_aluno FROM alunos WHERE nome = 'Lucas Lima' LIMIT 1);

SELECT * FROM alunos;


-- EXERCÍCIO 3

CREATE TABLE IF NOT EXISTS disciplinas (
    id_disciplina UUID PRIMARY KEY,
    nome TEXT,
    carga_horaria INT,
    professor_responsavel TEXT
);

INSERT INTO disciplinas (id_disciplina, nome, carga_horaria, professor_responsavel)
VALUES (uuid(), 'Arquitetura de Computadores', 60, 'Carlos Henrique');

INSERT INTO disciplinas (id_disciplina, nome, carga_horaria, professor_responsavel)
VALUES (uuid(), 'Programação Mobile', 80, 'Juliana Rocha');

INSERT INTO disciplinas (id_disciplina, nome, carga_horaria, professor_responsavel)
VALUES (uuid(), 'Redes de Computadores', 40, 'Rafaela Souza');

SELECT * FROM disciplinas;


-- EXERCÍCIO 4

CREATE TABLE IF NOT EXISTS matriculas (
    id_matricula UUID PRIMARY KEY,
    id_aluno UUID,
    id_disciplina UUID,
    semestre TEXT,
    nota FLOAT
);

INSERT INTO matriculas (id_matricula, id_aluno, id_disciplina, semestre, nota)
VALUES (uuid(), uuid(), uuid(), '2024.1', 8.5);

INSERT INTO matriculas (id_matricula, id_aluno, id_disciplina, semestre, nota)
VALUES (uuid(), uuid(), uuid(), '2024.1', 7.9);

INSERT INTO matriculas (id_matricula, id_aluno, id_disciplina, semestre, nota)
VALUES (uuid(), uuid(), uuid(), '2024.2', 9.2);

SELECT * FROM matriculas;

UPDATE matriculas
SET nota = 9.8
WHERE id_matricula = (SELECT id_matricula FROM matriculas LIMIT 1);

SELECT * FROM matriculas;



-- EXERCÍCIO 5

CREATE TABLE IF NOT EXISTS coordenadores (
    id_coordenador UUID PRIMARY KEY,
    nome TEXT,
    curso TEXT,
    telefone TEXT,
    email TEXT
);

INSERT INTO coordenadores (id_coordenador, nome, curso, telefone, email)
VALUES (uuid(), 'Fernanda Silva', 'Sistemas de Informação', '(83) 99876-2345', 'fernanda.silva@unicom.br');

INSERT INTO coordenadores (id_coordenador, nome, curso, telefone, email)
VALUES (uuid(), 'Rodrigo Almeida', 'Engenharia da Computação', '(83) 99922-7811', 'rodrigo.almeida@unicom.br');

INSERT INTO coordenadores (id_coordenador, nome, curso, telefone, email)
VALUES (uuid(), 'Beatriz Carvalho', 'Ciência da Computação', '(83) 98761-1123', 'beatriz.carvalho@unicom.br');

SELECT * FROM coordenadores;

DELETE FROM coordenadores WHERE nome = 'Rodrigo Almeida';

SELECT * FROM coordenadores;
