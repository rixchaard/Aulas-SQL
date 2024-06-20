create table genero(
id integer not null,
nome varchar(100),
constraint genero_pkey primary key (id)
);


create table filme(
id numeric(5) not null,
nome varchar(100),
duracao integer,
sinopse varchar(2000),
genero integer,
data timestamp,
constraint pk_genero primary key (id),
constraint fk_genero_filme foreign key (genero)
references genero (id)
);



insert into genero values (1,'drama');
insert into genero values (2,'comedia');
insert into genero values (3,'terror');
insert into genero values (4,'romance');
insert into genero values (5,'suspense');
insert into filme
values (1,'os outros','90','aaaaaaaaaaaa',5,'2006-08-15');
insert into filme
values (2,'duplex','120','aaaaaaaaaaaa',2,'2001-08-15');
insert into filme
values (3,'click','100','aaaaaaaaaaaa',2,'2005-08-15');
insert into filme
values (4,'o piano','90','aaaaaaaaaaaa',1,'2005-06-12');



-- -----------------------------------------------------
/* 1. Criar uma função para retornar o id do gênero passando o nome dele */

CREATE FUNCTION idgenero (varchar)
RETURNS integer AS
'
SELECT id
FROM genero
where nome ilike $1

'
LANGUAGE 'sql';

SELECT idgenero ('terror');

-- $1, $2, $3... Corresponde aos parametros inseridos nos parenteses

-- -----------------------------------------------------
/* 2. Criar uma função para fazer o insert na tabela de gêneros. */

create function insgenero (numeric,varchar)
returns void as
'
insert into genero values($1,$2)
'
language 'sql';

select insgenero (6,'Ação');

select idgenero ('Ação');



-- -----------------------------------------------------
/* 3. Fazer um insert na tabela gêneros utilizando a função criada.*/


select insgenero (7,'policial')


-- -----------------------------------------------------
/* 4. Fazer um insert utilizando a função junto com a sequence da tabela. */


'
CREATE SEQUENCE seq_gen
start with 10
'



-- -----------------------------------------------------
/*5. Criar uma função para deletar um gênero da tabela passando o id.*/

CREATE FUNCTION deletagen (int)
returns void ad
'
delete from genero where id = $1;
'
language 'sql';


-- -----------------------------------------------------
/* 6. Chamar a função do item 5 passando o nome como parâmetro.*/

select deleta_gen (idgenero('documentario'));


-- -----------------------------------------------------