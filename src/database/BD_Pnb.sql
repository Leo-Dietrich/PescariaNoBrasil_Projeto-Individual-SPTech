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

insert into pontuacao(fkUsuario, pontos) values
(1,8);

select*from pontuacao;

select idPontuacao, pontos from pontuacao where fkUsuario = 1;

select count(distinct fkUsuario) from pontuacao where pontos = 0;
select count(distinct fkUsuario) from pontuacao where pontos = 1;
select count(distinct fkUsuario) from pontuacao where pontos = 2;
select count(distinct fkUsuario) from pontuacao where pontos = 3;
select count(distinct fkUsuario) from pontuacao where pontos = 4;
select count(distinct fkUsuario) from pontuacao where pontos = 5;
select count(distinct fkUsuario) from pontuacao where pontos = 6;
select count(distinct fkUsuario) from pontuacao where pontos = 7;
select count(distinct fkUsuario) from pontuacao where pontos = 8;
select count(distinct fkUsuario) from pontuacao where pontos = 9;
select count(distinct fkUsuario) from pontuacao where pontos = 10;

create table bacias(
idBacias int primary key auto_increment,
nome varchar(45) not null,
regiao varchar(45) not null);

create table rios(
idRios int,
fkBacias int,
	foreign key (fkBacias) references bacias(idBacias),
    primary key (idRios, fkBacias))
;

select*from usuario;