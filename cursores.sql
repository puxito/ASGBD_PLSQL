use practica2;

DELIMITER ;
DELIMITER $$
drop procedure if exists ejcursor1$$
create procedure ejcursor1()
begin
	declare idregistro int default 0;
	declare errorregistro int default 0;
    declare salida int default 0;
    declare mayor int default 0;
	declare idmayor int default 0;
	declare cursor1 cursor for select iderrores, numeroerror from errores;
	declare continue handler for not found set salida = 1;
	open cursor1;
    
		fetch cursor1 into idregistro, errorregistro;
		while (salida = 0) do
			if mayor < errorregistro then
            set mayor = errorregistro;
            set idmayor = idregistro;
            end if;
			
        
        
        fetch cursor1 into idregistro, errorregistro;
        end while;
		select idmayor, mayor;
    close cursor1;
    
end$$

call ejcursor1();


