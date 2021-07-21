drop database if exists Biblioteca3;
create database Biblioteca3;
use Biblioteca3;
create table informacion_usuario(
id_Usuario varchar(10),
nombre varchar(25),
dirección varchar(25),
barrio varchar(20),
telefono varchar (10),
tipo_usuario varchar(50),
primary key(id_Usuario)
);

create table categorias(
id_categoria varchar(3),
nombrecategoria varchar(40),
primary key(id_categoria)
);

create table libros(
título varchar(30),
id_categoria varchar(3),
isbn varchar(17),
páginas varchar(250),
editorial varchar(20),
autor varchar(20),
foto varchar(50),
formato varchar(30),
primary key(isbn),
foreign key(id_categoria) references categorias(id_categoria)
);

create table autores(
id_autor varchar(3),
nombre varchar(50),
primary key (id_autor)
);

create table autores_libro(
isbn varchar(17),
id_autor varchar(3),
primary key(id_autor,isbn),
foreign key(isbn) references libros(isbn),
foreign key(id_autor) references autores(id_autor)
);

create table ejemplares(
id_ejemplar int auto_increment,
isbn varchar(17),
primary key(id_ejemplar),
foreign key(isbn) references libros(isbn)
);

create table prestamoslibros(
id_ejemplar varchar(3),
fechaInicial varchar(10),
fechaRetorno varchar(10),
estadoLibro varchar(30),
id_Usuario varchar(10),
primary key(id_ejemplar,id_Usuario,fechaInicial),
foreign key(id_Usuario) references informacion_usuario(id_Usuario)
);

insert into informacion_usuario values('43836776','Rosa Martínez','cra 56# 5-54','Guayabal','3016923050','Profesor');

insert into categorias values
('100','Matemáticas'),
('200','Ingeniería'),
('300','Ciencias Sociales'),
('400','Español'),
('500','Biología');

insert into libros values('Malditas matemáticas', '100', '1017940133100','250','LoqueLeo','Vincent del Toro',NULL,'CD');
insert into libros values('Fundamentos de ingenieria Electrica', '200', '1017940133200','180','Prentice',NULL,'Camilo Perez','Impreso');
insert into libros values ('Introducción a las Ciencias Sociales','300','1017940133300','240','Latino',NULL,'Federiko Mesa','Impreso');
insert into libros values('Español cuadernos en Ruta', '400', '1017940133400','100','Edelvives','Federiko Mesa',NULL,'Impreso');
insert into libros values('Biología Célular y Mólecular', '500', '1017940133500','150','McGranny','Federiko Mesa',NULL,'Impreso');

insert into autores values('001','Vincent del Toro'),('002','Camilo Perez'),('003','Federiko Mesa');

insert into autores_libro values('1017940133100','001'),('1017940133200','002'),('1017940133200','003');

insert into ejemplares(isbn) values ('1017940133200'),('1017940133200'),('1017940133200'),('1017940133100');
