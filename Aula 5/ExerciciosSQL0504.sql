CREATE TABLE Aluno (
    rgm integer,
    nome varchar(150) NOT NULL,
    idade integer NOT NULL,
    situacao varchar(150),
    constraint pk_rgm PRIMARY KEY (rgm)
);

CREATE TABLE Disciplina (
    codigo integer NOT NULL,
    disciplina varchar(15) unique NOT NULL,
    media numeric(10,2) NOT NULL,
    constraint pk_cod PRIMARY KEY (codigo)
);

CREATE TABLE Notas(
    cod_aluno integer,
    cod_disc integer,
    p1 numeric (2),
    p2 numeric (2),
    media numeric (2,1),
    faltas integer,
    constraint pk_notas PRIMARY KEY (cod_aluno, cod_disc),
    constraint fk_notas_rgm foreign key (cod_aluno) references Aluno (rgm),
    constraint fk_notas_cod foreign key (cod_disc) references disciplina(codigo)
); 

-- Inserindo valores na Tabela Aluno:

    insert into Aluno values (100, 'Maria', 20, 'A'); 
    insert into Aluno values (200, 'João', 18, 'A'); 
    insert into Aluno values (300, 'Luiz', 25, 'A'); 
    insert into Aluno values (400, 'Julia', 27, 'A'); 
    insert into Aluno values (500, 'Gabriela', 17, 'A'); 


select * from Aluno;

-- inserindo valores na tabela disciplina:

    insert into Disciplina values (100, 'Matemática', 7);
    insert into Disciplina values (200, 'Português', 7);
    insert into Disciplina values (300, 'História', 7)
    insert into Disciplina values (400, 'Física', 7);
    insert into Disciplina values (500, 'Química', 7);
     
    select * from Disciplina;
    
-- inserindo valores na tabela notas:
    
    insert into Notas values (100, 100, 5, 7, null, 5);
    insert into Notas values (200, 200, 7, 9, null, 2);
    insert into Notas values (300, 100, 5, 7, null, 0);
    insert into Notas values (400, 400, 7, 5, null, 1);
    insert into Notas values (500, 100, 5, 8, null, 7);
    
    select * from Notas;
    
-- Pode ser feito um calculo automático para o preenchimento da média:

    update notas
    set media = (p1+p2)/2;
    
    select * from Notas;
    
-- 3. 

    select * from aluno;
    /* Fez com que todos alunos que
    contém J no nome, atualize a situacao */
    update aluno
    set situacao = 'com J'
    where nome ilike 'j%';
    
-- 4.

    select * from notas;
    update notas
    set faltas = faltas + 1;
    
-- 5.
    
    update notas
    set faltas = 9
    where media > 6 and faltas < 10;
    
    select * from notas;
    
-- 6.

    select * from aluno;
    
    update aluno
    set situacao = 'Aluno potencial'
    where idade between 18 and 25;
    
    
-- 7.
    select * from aluno;

    update aluno
    set situacao = 'em avaliação'
    where idade in(23,28,54,55);
    
-- 8.
    select * from aluno;

    update aluno
    set situacao = 'tem ai no nome'
    where nome ilike '%ia';
    
-- 9. 
    select * from aluno;
 
    update aluno
    set situacao = 'Idade ideal'
    where idade = 23 or idade = 26;
    
-- ------------------------------------------------    
    