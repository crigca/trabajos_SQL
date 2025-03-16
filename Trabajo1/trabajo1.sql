CREATE DATABASE IF NOT EXISTS Facturacion;
USE Facturacion;

-- Tabla Cliente(entidad pricipal)
-- Relacion 1:1 con tabla telefono
CREATE TABLE E01_Cliente (
    nro_cliente INT PRIMARY KEY, 
    nombre VARCHAR(50) NOT NULL, 
    apellido VARCHAR(45),
    direccion VARCHAR(45),
    activo TINYINT NOT NULL 
);

-- Tabla Telefono relacion 1:1 con Cliente
CREATE TABLE E01_Telefono (
	nro_cliente INT PRIMARY KEY,
    codigo_area INT NOT NULL, 
    nro_telefono INT NOT NULL, 
    tipo CHAR(1) NOT NULL, 
    CONSTRAINT fk_cliente_telefono 
        FOREIGN KEY (nro_cliente) 
        REFERENCES E01_Cliente(nro_cliente) 
        ON DELETE CASCADE
);

-- Tabla Factura relacion 1:N con Cliente
CREATE TABLE E01_Factura (
    nro_factura INT PRIMARY KEY, 
    fecha DATE NOT NULL,
    total_sin_iva DOUBLE NOT NULL, 
    iva DOUBLE NOT NULL, 
    total_con_iva DOUBLE NOT NULL, 
    nro_cliente INT NOT NULL, 
    CONSTRAINT fk_factura_cliente 
        FOREIGN KEY (nro_cliente) 
        REFERENCES E01_Cliente(nro_cliente) 
        ON DELETE CASCADE
);

-- Tabla Producto relacion 1:N con Detalle Factura
CREATE TABLE E01_Producto (
    codigo_producto INT PRIMARY KEY, 
    marca VARCHAR(45) NOT NULL, 
    nombre VARCHAR(45) NOT NULL, 
    descripcion VARCHAR(45),
    precio FLOAT NOT NULL, 
    stock INT NOT NULL 
);

-- Tabla Detalle Factura relacion 1:N con Producto y Detalle Factura
CREATE TABLE E01_Detalle_Factura (
    nro_factura INT NOT NULL, 
    nro_item INT NOT NULL, 
    cantidad FLOAT NOT NULL, 
    codigo_producto INT NOT NULL, 
    PRIMARY KEY (nro_factura, nro_item), 
    CONSTRAINT fk_detalle_factura 
        FOREIGN KEY (nro_factura)
        REFERENCES E01_Factura(nro_factura) 
        ON DELETE CASCADE,
	CONSTRAINT fk_detalle_producto 
        FOREIGN KEY (codigo_producto)
        REFERENCES E01_Producto(codigo_producto) 
        ON DELETE CASCADE
);