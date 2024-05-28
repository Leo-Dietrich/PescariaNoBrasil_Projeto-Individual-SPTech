create database pescaria_no_brasil;

use pescaria_no_brasil;

create table usuario(
id int primary key auto_increment,
nome varchar (45),
email varchar(45),
	constraint chkEmail check(email like('%@%')),
senha varchar(45));

create table pontuacao(
idPontuacao int auto_increment,
fkUsuario int,
	foreign key (fkUsuario) references usuario (id),
	primary key (idPontuacao, fkUsuario),
pontos int,
	check (pontos between 0 and 10),
datahora datetime default current_timestamp);

create table bacias(
idBacias int primary key auto_increment,
nome varchar(45) not null,
regiao varchar(45) not null);

create table rios(
idRios int,
fkBacias int,
	foreign key (fkBacias) references bacias(idBacias),
    primary key (idRios, fkBacias),

select*from usuario;