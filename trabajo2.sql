use Ayacucho;

-- Ejercicio 1: Selecciona todos los registros de una tabla.
select * from e01_producto;

-- Ejercicio 2: Selecciona todos los productos de una determinada marca (definida por el usuario)
select * from e01_producto where marca like "V%";

-- Ejercicio 3: Selecciona todos los productos en orden alfabético ascendente por nombre.
select * from e01_producto order by trim(nombre) regexp "[A-Za-z]", trim(nombre) asc;

-- Ejercicio 4: Agrega un nuevo producto a la tabla.
insert into e01_producto (codigo_producto, marca, nombre, descripcion, precio, stock)
values ("999", "Acme", "EX-099", "Trampa para corre-caminos", 001010111, 000000001);

-- Ejercicio 5: Actualiza el precio del producto con ID 5 a 49.99.
update e01_producto set precio=49.99 where codigo_producto = 5;

-- Ejercicio 6: Elimina el producto con ID 3.
select * from e01_detalle_factura where codigo_producto = 3;
delete from e01_detalle_factura where codigo_producto = 3;
delete from e01_producto where codigo_producto = 3;

-- Ejercicio 7 (SELECT con BETWEEN): Selecciona todos los productos cuyo precio esté entre $10 y $50.
select * from e01_producto where precio between 10 and 50;

-- Ejercicio 8: Selecciona todos los productos cuyo precio sea mayor que el precio promedio de todos los productos.
select avg(precio) as precio_promedio from e01_producto;
select * from e01_producto where precio > (select avg(precio) from e01_producto);

-- Ejercicio 9 (UPDATE Simple): Actualiza el precio de todos los productos en la marca "Nulla Dignissim Institute" para que sea $5 más caro.
select * from e01_producto where marca like "%Nulla%";
set sql_safe_updates = 0;
update e01_producto set precio = precio + 5 where marca = "Nulla Dignissim Institute";
set sql_safe_updates = 1;
select * from e01_producto where marca like "%Nulla%";

-- Ejercicio 10 (SELECT con NOT, AND, OR): Selecciona todos los telefonos cuyo codigo de area no sea 844  y su numero sea mayor que 4369984 o su tipo sea F.
select * from e01_telefono where codigo_area <> 844 and (nro_telefono > 436984 or tipo = "F");

-- Ejercicio 11: Selecciona los 10 productos más caros.
select * from e01_producto order by precio desc limit 10;

-- Ejercicio 12 (SELECT con LIKE): Selecciona las facturas cuya fecha contiene el año "2016".
select * from e01_factura where fecha like "2016%";

-- Ejercicio 13 (INSERT Simple): Agrega un nuevo producto a la tabla con el nombre "Nuevo Producto" y un precio de $29.99.
insert into e01_producto (codigo_producto, marca, nombre, descripcion, precio,stock)
values (900, "Acme", "Nuevo Producto", "sin descripcion", 29.99, 5);

-- Ejercicio 14 (UPDATE con NOT, AND, OR): Incrementa el precio de todos los productos en un 5%, pero solo si su precio actual es inferior a $50 o su nombre no contiene "descuento".
set sql_safe_updates = 0;
update e01_producto set precio = precio * 1.05 where not (precio >= 50 and nombre like "%descuento%") or precio < 50;
set sql_safe_updates = 1;

-- Ejercicio 15 (SELECT con <> y AND): Selecciona los teléfono que no sean del tipo F y cuyo número no sea mayor  a 4892549
select * from e01_telefono where tipo <> "F" and nro_telefono <= 4892549;



