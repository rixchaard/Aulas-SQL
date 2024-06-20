-- -----------------         EX 10/05            ---------------------------
--2 a.
create table depto (
    cd_depto int primary key,
    ds_depto varchar(50) not null
);

create sequence seq_depto;

insert into depto values (nextval('seq_depto'), 'TI'), 
                         (nextval('seq_depto'), 'PSC'),
                         (nextval('seq_depto'), 'PLT');
                         
select * from depto
-- ------------------------------------------------------------

/* 2b) Desenvolva o script SQL de criação da tabela PSSOA. 
Inclua pelo menos 5 registros (utilize sequence e insert com query 
quando necessário). .*/

create table pssoa (
    cd_pssoa int primary key,
    cd_depto int not null references depto(cd_depto),  
    ds_pessoa varchar(50)
);

create sequence seq_pssoa;

insert into pssoa values (nextval('seq_pssoa'), (select cd_depto from depto where ds_depto ilike 'TI'), 'Maria'), 
                         (nextval('seq_pssoa'), (select cd_depto from depto where ds_depto ilike 'PSC'), 'João'),                      
                         (nextval('seq_pssoa'), (select cd_depto from depto where ds_depto ilike 'PLT'), 'Luiz');
select * from pssoa


-- ------------------------------------------------------------

/* 2c) O  analista  de  projeto  te  pediu  para  adicionar  uma  nova  
coluna  na  tabela  PSSOA chamada de DT_NASC (Data de Nacimento). 
Atualize esta informação em todos os registros inseridos. */

alter table pssoa
add column DT_NASC date;

update pssoa
set DT_NASC = '2001-09-23'
where ds_pessoa ilike 'Maria' 

update pssoa
set DT_NASC = '2004-06-04'
where ds_pessoa ilike 'Luiz'

update pssoa
set DT_NASC = '1998-12-25'
where ds_pessoa ilike 'João'

select * from pssoa

-- ------------------------------------------------------------
/* 2d) O analista de sistemas solicitou que seja criada uma view 
para possibilitar a geração de um relatório referente aos 
aniversariantes (nome da pessoa, data de nascimento) o mês de 
setembro. Dica: pesquise sobre a função date_part. */

create view aniversarios9(pssoa, data) as 
    select ds_pessoa, dt_nasc
    from pssoa
    where date_part ('month', dt_nasc) = 09;
    
select * from aniversarios9

-- ------------------------------------------------------------
/* 2e) O analista de sistemas solicitou que seja criada uma 
view para possibilitar a geração de um relatório mensal de pessoas 
lotada em um departamento (nome da pessoa, nome do departamento).  */

create view lotacao(pessoa, depto) as 
    select p.ds_pessoa, d.ds_depto
    from pssoa p, depto d
    where d.cd_depto = p.cd_depto;
    
select * from lotacao


-- ------------------------------------------------------------
/* 2f) O analista de sistemas solicitou que seja criada uma view para 
gerar relatório de pessoas em ordem decrescente. */

create view pessoas(nomes) as
    select ds_pessoa
    from pssoa
    order by ds_pessoa desc;

select * from pessoas



-- ------------------------------------------------------------
/* 2g) O analista de sistemas  solicitou que  seja criada uma view 
para gerar relatório de departamento que estão vazios(não possuem pessoas). */
-- Utilização de sub-select! **********************************

create view depto_vazio(nomes) as
    select d.ds_depto
    from depto d
    where d.cd_depto not in (select distinct cd_depto from pssoa);
    
select * from depto_vazio    
    
-- ------------------------------------------------------------


-- ------------------------------------------------------------
/* 2h)  O  analista  de  sistemas  solicitou  que  seja  criada  uma  view  
para  gerar  relatório  de departamento que não estão vazios (possuem pessoas).   */




-- ------------------------------------------------------------
/* 3) O analista do projeto, 1 ano depois decidiu criar o sistema de segurança
e pediu para incluir uma nova tabela chamada USUAS (Usuários) de acordo com 
o modelo revisado apresentado abaixo (OBS: incluir pelo  menos 5 registros 
na nova tabela):  */




-- ------------------------------------------------------------
/*  */



-- ------------------------------------------------------------
/*  */



-- ------------------------------------------------------------
/*  */



-- ------------------------------------------------------------
/*  */



-- ------------------------------------------------------------


