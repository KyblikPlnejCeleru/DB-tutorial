use firma;
create table profese(
id int primary key identity(1,1),
nazev varchar(20) not null unique check(len(nazev)>=3)
);
create table zam(
id int primary key identity(1,1),
prijmeni varchar(20) not null  check(len(prijmeni)>=3),
jmeno varchar(20) not null,
email varchar(50) not null check(email like '%@%'),
narodnost varchar(20) not null default 'ceska',
jazyk varchar(20) not null check(jazyk in('cesky','anglicky','spanelsky')),
vek int not null check(vek > 17),
datum_prijeti date check(datum_prijeti >= getdate()),
profese_id int foreign key references profese(id)
);
select getdate();
insert into profese(nazev) values('telocvik'),('larp'),('tungtungsahur');
select * from profese order by nazev;
select * from zam;
--spojeni tabulek pomoci joinu
--inner join vypis se jen profese a zam, ktere maji, u kterych je spojeni
select profese.nazev, zam.prijmeni 
from profese inner join zam on profese.id = zam.profese_id;
-- left vypise vsechna i ty co nemaji spojeni 
--vsechny profese i ty co nemaji zamestnance
select profese.nazev, zam.prijmeni 
from profese left join zam on profese.id = zam.profese_id;
--pridame zam bez profese
select profese.nazev, zam.prijmeni 
from profese right join zam on profese.id = zam.profese_id;
select profese.nazev, zam.prijmeni 
from profese full outer join zam on profese.id = zam.profese_id;
