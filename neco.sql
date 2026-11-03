create database kina; -- create db
use kina; -- prepnuti na kina
create table kino(                           --tabulka kino 1 vazba
id int primary key identity(1,1),           
nazev varchar(20) not null,
mesto varchar(20) not null
);
create table film(                            -- tabulka film 1 vazba
id int primary key identity(1,1),
nazev varchar(20) not null unique,
delka int not null
);
create table program(                          -- tabulka N strana ty foreign klice delaji tu vazbu
id int primary key identity(1,1),
kino_id int not null foreign key references kino(id),
film_id int not null foreign key references film(id),
datum date not null
);
insert into kino(nazev,mesto) values('pes','praha') , ('cenda','pardubice'); -- vlozeni dat 
insert into film(nazev,delka) values ('hery potr',167),('pirati z askabaru',164),('cau',100);
insert into program(kino_id,film_id,datum) values(1,1,'2026-11-03'), (2,1,'2025-06-04'), (2,3,'2027-10-14'),(1,2,'2023-08-07')
select kino.nazev ,  program.datum , film.nazev 
from program 
inner join film on film.id = program.film_id   -- vzdy davat .id vole
inner join kino on  kino.id= program.kino_id


