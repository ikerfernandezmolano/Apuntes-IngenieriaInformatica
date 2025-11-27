-- Crear la base de datos invitados
CREATE DATABASE IF NOT EXISTS invitados;

-- Usar la base de datos invitados
USE invitados;

-- Crear la tabla clientes con restricción de unicidad en el número de teléfono
DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    telefono VARCHAR(15) NOT NULL UNIQUE
);
CREATE DATABASE INVITADOS; USE INVITADOS; CREATE TABLE CLIENTES(id INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(255) NOT NULL, apellido VARCHAR(255) NOT NULL, telefono VARCHAR(15) NOT NULL UNIQUE);
