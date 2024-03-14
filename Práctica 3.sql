create database practica3 charset utf8mb4 collate utf8mb4_spanish2_ci;
use practica3;

create table premiadas (
idPelicula int auto_increment,
tituloPelicula varchar(45),
anioPelicula int(4),
generoPelicula varchar(45),
nacionalidadPelicula varchar(45),
oscarsPelicula int(2),
directorPelicula varchar(45),

primary key (idPelicula)
);



-- Ejercicio 2

DELIMITER ;
DELIMITER $$
drop procedure if exists nacionalidad1$$
create procedure nacionalidad1(pais1 text)
begin
	select * from practica3.premiadas where nacionalidadPelicula = pais1;
end$$

call nacionalidad1('Francia')

-- Ejercicio 3

DELIMITER ;
DELIMITER $$
drop function if exists ejercicio3$$
create function ejercicio3()
returns int language sql deterministic
begin
	declare salida int default 0;
    declare legible int default 0;
    declare mayor int default 0;
	declare cursor1 cursor for select oscarsPelicula from practica3.premiadas;
	declare continue handler for not found set salida = 1;    
    open cursor1;
		while (salida = 0) do
			fetch cursor1 into legible;
			if legible > mayor then 
			set mayor = legible;
			end if;
		end while;
	close cursor1;
    return mayor;
end$$

select ejercicio3();

-- Ejercicio 4

DELIMITER ;
DELIMITER $$
drop procedure if exists ejercicio4$$
create procedure ejercicio4()
begin
	declare maxOscars int;
    set maxOscars = ejercicio3();
    select idPelicula, tituloPelicula, anioPelicula,generoPelicula, nacionalidadPelicula, oscarsPelicula, directorPelicula from practica3.premiadas where oscarsPelicula = maxOscars;
end$$

call ejercicio4();

-- Ejercicio 5

DELIMITER ;
DELIMITER $$
drop procedure if exists ejercicio5$$
create procedure ejercicio5(anioentrada int)
begin
select * from practica3.premiadas where anioPelicula = anioentrada;
end$$

call ejercicio5('1977');

-- Ejercicio 6

DELIMITER ;
DELIMITER $$
drop function if exists ejercicio6$$
create function ejercicio6()
returns int language sql deterministic
begin
	declare salida int default 0;
    declare numoscars int default 0;
    declare numoscarstotal int default 0;
    declare numpeliculas int default 0;
    declare result int default 0;
	declare cursor1 cursor for select oscarsPelicula from practica3.premiadas;
	declare continue handler for not found set salida = 1;    
    open cursor1;
		while (salida = 0) do
        fetch cursor1 into numoscars;
        set numoscarstotal = numoscars + numoscarstotal;
        set numpeliculas = numpeliculas + 1;
        end while;
	close cursor1;
    set result = numoscarstotal/numpeliculas;
    return result;
end$$

SELECT ejercicio6();

-- Ejercicio 7

DELIMITER ;
DELIMITER $$
drop procedure if exists ejercicio7$$
create procedure ejercicio7()
begin
    select * from practica3.premiadas where oscarsPelicula > (ejercicio6());
end$$

call ejercicio7();

-- Ejercicio 8

DELIMITER ;
DELIMITER $$
drop trigger if exists ejercicio8$$
create trigger ejercicio8
before
	insert on premiadas
for each row
begin
	if exists (select * from practica3.premiadas where new.tituloPelicula = tituloPelicula) then
    signal sqlstate '45000' set message_text = 'Ya existe en la base datos';
    end if;

end$$

insert into practica3.premiadas values(	10,	'Braveheart','1995','Bélico/Acción'	,'Irlanda','2','Mel Gibson');

-- Ejercicio 9

DELIMITER ;
DELIMITER $$
drop event if exists ejercicio9;
create event ejercicio9
on schedule every 1 year
starts '2024-01-18 00:00:00' enable
do
begin
    delete from premiadas where oscarsPelicula = 0;
end$$

show events;