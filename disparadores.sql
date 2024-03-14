create trigger comprobarRangoUpdate before update on muestra
for each row
begin
	if new.dato = old.dato then
    dato = new.dato
    else
    dato = old.dato