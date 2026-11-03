-- new database
create database firma;
--prepnuti do dane db
use firma;
--vytvoreni tabulky na strane 1
create table profese(
id int primary key identity(1,1),
nazev varchar(20) not null unique
);
--vytvoreni tabulky na strane N (cizi klic)
create table zamestnanec(
id int primary key identity(1,1),
profese_id int not null foreign key references profese(id), -- cizi klic profese 
prijmeni varchar(20) not null, 
plat int not null check(plat>0) -- vetsi nez nula hlidani
);
--vytvoreni diagramu v MSSQL serveru : dBdiagram --> new diagram (screenshotovat)
--ulozeni diagramu jako vystrisek, ulozeni skriptu na plochu(to co pisu) jako sql
--zmena struktury tabulky (pridani sloupce datum narozeni)
--alter table zamestnanec add datum_narozeni date;
--SQL DDL(vytvareni struktury):create,alter,drop
--smazani tabulky na strane 1
-- drop table profese; -- neni mozne vzhledem k zavislosti tabulky na strane N
--napred je nutne smazat zavisle tabulky strana N
--drop table zamestnanec;
--smazani cele databaze .. je mozne pouze pokud mame prava sa(server admin) jsme v master prepnuti
--use master; 
--drop database firma; -- zavrit diagramy,byt master

--SQL DML(prikazy pro praci s daty): insert,update,delete,select
-- vlozeni profesi 
insert into profese(nazev) values('web_designer'),('web_developer'),('programmer');
--vypis vsech dat z jedne tabulky
select * from profese order by id; -- * --> vsechno, order by id je sezareni
--vlozeni jednoho zamestnance
insert into zamestnanec(profese_id,prijmeni,plat) values(1,'lopocha',35000); -- zamestnanec(spravne poradi) --> pak doplnime ve values
select * from zamestnanec
-- spojeni tabulek pres klice(pk fk)
select profese.nazev,zamestnanec.prijmeni --vyber toho co chci vypsat
from profese inner join zamestnanec on profese.id=zamestnanec.profese_id -- z profese spojeni s zamestnancem a klic se musi rovnat
--rucni vlozeni dat : prave tlacitko na tabulku a edit --> ID je unikatni pro tabulku
