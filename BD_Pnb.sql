create database pescaria_no_brasil;

use pescaria_no_brasil;

create table usuario(
id int primary key auto_increment,
nome varchar (45),
email varchar(45),
	constraint chkEmail check(email like('%@%')),
senha varchar(45));



