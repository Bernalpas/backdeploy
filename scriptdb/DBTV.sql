

-- Bases de Datos para la TV --
-- 1. Creamos la base de datos --
create database tv;

-- 2. Seleccionamos la base de datos a utilizar --
use tv;

-- 3. Creamos la tabla de la Entidad Genero --
create table genero(
-- entero, positivo, no nulo, auto incremental --
idGenero int unsigned not null auto_increment,
-- dato de tipo string o caracteres --
nombre varchar(80),
-- seteamos el identificador de la tabla --
primary key(idGenero)        
); 

-- 4. Creamos la tabla de la entidad Pelicula --
create table pelicula(
-- entero, positivo, no nulo, auto incremental --
idPelicula int unsigned not null auto_increment,
-- dato de tipo string o caracteres --
titulo varchar(120),
-- dato de tipo decimal --
rating decimal,
-- entero, positivo, no nulo, es la clave foránea de la tabla --
idGenero int unsigned not null,
-- seteamos el identificador de la tabla --
primary key(idPelicula),
-- seteamos la clave foránea de la tabla --
foreign key(idGenero) references genero(idGenero)
);

-- 5. Creamos la tabla de la entidad actores -- 
create table actores(
-- entero, positivo, no nulo, auto incremental --
idActor int unsigned not null auto_increment,
-- dato de tipo string o caracteres --
nombre varchar(80),
-- dato de tipo string o caracteres --
apellido varchar(80),
-- seteamos el identificador de la tabla --
primary key(idActor)
);

-- 6. Creamos la tabla intermedia entre las entidades Pelicula y Actor --
create table pelicula_actor(
-- entero, positivo, no nulo, auto incremental --
id int unsigned not null auto_increment,
-- entero, positivo, no nulo, es la clave foránea de la tabla --
idPelicula int unsigned not null, 
-- entero, positivo, no nulo, es la clave foránea de la tabla --
idActor int unsigned not null,
-- seteamos el identificador de la tabla --
primary key(id),
-- seteamos la clave foránea de la tabla --
foreign key(idPelicula) references pelicula(idPelicula),
-- seteamos la clave foránea de la tabla --
foreign key(idActor) references actores(idActor)
);

-- Carga de datos en las tablas de nuestra DB --
-- Genero --
insert into genero values(null, "Comedia");
insert into genero values(null, "Romántica");
insert into genero values(null, "Terror");
insert into genero values(null, "Ciencia Ficción");
insert into genero values(null, "Acción");

-- Pelicula --
insert into pelicula values(null, "El Padrino", 10, 5);
insert into pelicula values(null, "Avangers", 9, 4);

-- Actores --
insert into actores values(null, "Robert", "De Niro");
insert into actores values(null, "Tom", "Hanks");




