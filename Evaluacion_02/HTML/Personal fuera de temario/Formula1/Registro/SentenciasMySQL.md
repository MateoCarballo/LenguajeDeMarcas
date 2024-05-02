DROP DATABASE IF EXISTS usuarios;
CREATE DATABASE 	usuarios;
USE usuarios;

CREATE TABLE registros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    genero VARCHAR(10),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_nacimiento VARCHAR(50),
    pais_nacimiento VARCHAR(50),
    correo VARCHAR(100),
    clave VARCHAR(100)
);

SELECT * FROM registros;


INSERT INTO registros (genero, nombre, apellido, fecha_nacimiento, pais_nacimiento, correo, clave)
        VALUES ('genero', 'nombre', 'apellido', '2024-01-01', 'paisDeNacimiento', 'correo', 'clave');

