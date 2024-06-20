create table Cargo(
codigo numeric(5),
nome varchar(100) not null,
salario_base numeric(10,2) not null,
Constraint pk_cargo_cod Primary Key (codigo)
);

create table Cidade(
codigo numeric(5),
nome varchar(100) not null,
Constraint pk_cidade_cod Primary Key (codigo)
);

create table Departamento(
codigo numeric(5),
nome varchar(100) not null,
Constraint pk_depto_cod Primary Key (codigo)
);

create table Funcionario(
codigo numeric(5),
nome varchar(100) not null,
telefone varchar(50) null,
salario numeric(10,2) not null,
cod_cargo numeric(5) not null,
cod_cidade numeric(5) not null,
cod_depto numeric(5) not null,
gerente numeric(5),
Constraint pk_func_cod Primary Key (codigo),
Constraint fk_func_cargo Foreign Key(cod_cargo)
References Cargo(codigo),
Constraint fk_func_cidade Foreign Key(cod_cidade)
References Cidade(codigo),
Constraint fk_func_depto Foreign Key(cod_depto)
References Departamento(codigo),
Constraint fk_func_gerente Foreign Key(gerente)
References Funcionario(codigo)
);

INSERT INTO cargo (codigo,nome,salario_base)
VALUES (1,'estagiario',800.00);
INSERT INTO cargo (codigo,nome,salario_base)
VALUES (2,'gerente',2000.00);
INSERT INTO cargo (codigo,nome,salario_base)
VALUES (3,'supervisor',1800.00);
INSERT INTO cargo (codigo,nome,salario_base)
VALUES (4,'encarregado',1500.00);
INSERT INTO cargo (codigo,nome,salario_base)
VALUES (5,'auxiliar',1000.00);
INSERT INTO cidade (codigo,nome) VALUES (1,'Mogi das Cruzes');
INSERT INTO cidade (codigo,nome) VALUES (2,'São Paulo');
INSERT INTO cidade (codigo,nome) VALUES (3,'Campinas');
INSERT INTO cidade (codigo,nome) VALUES (4,'São Jose dos Campos');
INSERT INTO departamento (codigo,nome) VALUES (1,'vendas');
INSERT INTO departamento (codigo,nome) VALUES (2,'compras');
INSERT INTO departamento (codigo,nome) VALUES (3,'PCP');
INSERT INTO departamento (codigo,nome) VALUES (4,'produção');
INSERT INTO funcionario(codigo, nome, telefone, salario,
cod_cargo, cod_cidade, cod_depto, gerente)
VALUES (1,'Antonio Leite','989 0999',10000.00,2,3,2,NULL);
INSERT INTO funcionario (codigo, nome, telefone, salario,
cod_cargo, cod_cidade, cod_depto, gerente)
VALUES (2,'Lucas Silva','8778 7878',7000.00,2,1,1,1);
INSERT INTO funcionario (codigo, nome, telefone, salario,
cod_cargo, cod_cidade, cod_depto, gerente)
VALUES (3,'Bruna Santos','899 9987', 2000.98, 3, 3, 4, 2);
INSERT INTO funcionario (codigo, nome, telefone, salario,
cod_cargo, cod_cidade, cod_depto, gerente)
VALUES (4,'Camila Rocha','987 554545',4000.98,4,2,1,1);
INSERT INTO funcionario (codigo, nome, telefone, salario,
cod_cargo, cod_cidade, cod_depto, gerente)
VALUES (5,'Dayna Santos','7655 6654',600.00,1,4,3,1);
INSERT INTO funcionario (codigo, nome, telefone, salario,
cod_cargo, cod_cidade, cod_depto, gerente)
VALUES (6,'Emerson Santos','899 99989',6000.98,2,3,4,2);


--1. Consulta
SELECT nome, salario
from Funcionario
WHERE salario BETWEEN 6000 AND 8000
ORDER By Salario asc;

--2.
SELECT funcionario.nome, cargo.nome
from Funcionario, Cargo
where funcionario.cod_cargo = cargo.codigo
ORDER BY funcionario.nome, cargo.nome asc;

--3.
SELECT departamento.nome, funcionario.nome
from Funcionario, Departamento
where funcionario.cod_depto = departamento.codigo
order by funcionario.nome, departamento.nome; 

--4.
SELECT funcionario.nome, funcionario.salario
from Funcionario, Departamento
where Departamento.nome = "compras";

select * from departamento;
--5.



