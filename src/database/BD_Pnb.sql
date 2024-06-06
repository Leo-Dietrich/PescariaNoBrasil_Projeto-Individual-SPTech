create database pescaria_no_brasil;

use pescaria_no_brasil;

create table usuario(
id int primary key auto_increment,
nome varchar (45) not null,
email varchar(45) not null,
	constraint chkEmail check(email like('%@%')),
senha varchar(45) not null);

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

insert bacias (nome, regiao) values
('Bacia Amazônica', 'Norte'),
('Bacia Araguaia-Tocantins', 'Centro-Oeste/Norte'),
('Bacia do Paraná', 'Sudeste/Sul/Centro-Oeste'),
('Bacia do São Francisco', 'Nordeste/Centro-Oeste'),
('Bacia do Atlântico Sul', 'Sul/Sudeste');

create table rios(
idRios int,
fkBacias int,
	foreign key (fkBacias) references bacias(idBacias),
    primary key (idRios, fkBacias),
nome varchar(45) not null,
nascente varchar(60) not null,
foz varchar(60) not null);

insert into rios (idRios, fkBacias, nome, nascente, foz) values
(1, 1, 'Rio Negro', 'Rio Guainía, Colômbia', 'Rio Amazonas, Manaus'),
(2, 1, 'Rio Madeira', 'Rio Mamoré, Rio Madre De Dios, Bolívia', 'Rio Amazonas'),
(3, 1, 'Rio Tapajós', 'Rio São Manuel, Rio Juruena', 'Rio Amazonas'),
(1, 2, 'Rio Araguaia', 'Serra das Araras, Mato Grosso', 'Rio Tocantins, Pará'),
(2, 2, 'Rio Tocantins', 'Serra Dourada, Goiás', 'Rio Pará, Pará'),
(3, 2, 'Rio das Mortes', 'Chapada dos Guimarães, Mato Grosso', 'Rio Araguaia, Mato Grosso'),
(1, 3, 'Rio Paraná', 'Confluência dos rios Grande e Paranaíba, Minas Gerais', 'Rio da Prata, Argentina'),
(2, 3, 'Rio Tietê', 'Salesópolis, São Paulo', 'Rio Paraná, São Paulo'),
(3, 3, 'Rio Paranapanema', 'Serra Agudos Grandes, São Paulo', 'Rio Paraná, Paraná'),
(1, 4, 'Rio São Francisco', 'Serra da Canastra, Minas Gerais', 'Oceano Atlântico, Alagoas/Sergipe'),
(2, 4, 'Rio das Velhas', 'Serra do Espinhaço, Minas Gerais', 'Rio São Francisco, Minas Gerais'),
(3, 4, 'Rio Paracatu', 'Serra da Mata da Corda, Minas Gerais', 'Rio São Francisco, Minas Gerais'),
(1, 5, 'Rio Paraíba do Sul', 'Serra da Bocaina, São Paulo', 'Oceano Atlântico, Rio de Janeiro'),
(2, 5, 'Rio Itajaí-Açu', 'Serra do Mar, Santa Catarina', 'Oceano Atlântico, Santa Catarina'),
(3, 5, 'Rio Doce', 'Serra da Mantiqueira, Minas Gerais', 'Oceano Atlântico, Espírito Santo');

create table peixes(
idPeixes int primary key auto_increment,
nomePopular varchar(45),
nomeCientifico varchar(45) not null,
comportamento varchar(45));

insert into peixes (nomePopular, nomeCientifico, comportamento) values
('Tucunaré', 'Cichla spp.', 'carnívoro'),
('Pirarucu', 'Arapaima gigas', 'carnívoro'),
('Piraíba', 'Brachyplatystoma filamentosum', 'carnívoro'),
('Surubim Cachara', 'Pseudoplatystoma fasciatum', 'carnívoro'),
('Surubim Caparari', 'Pseudoplatystoma tigrinum', 'carnívoro'),
('Piranha', 'Pygocentrus spp.', 'onívoro'),
('Piau', 'Leporinus spp.', 'onívoro'),
('Pirarara', 'Phractocephalus hemioliopterus', 'carnívoro'),
('Jaú', 'Zungaro zungaro', 'carnívoro'),
('Cachorra', 'Hydrolycus spp.', 'carnívoro'),
('Piapara', 'Leporinus elongatus', 'onívoro'),
('Surubim Pintado', 'Pseudoplatystoma corruscans', 'carnívoro'),
('Pirambeba', 'Serrasalmus spp.', 'carnívoro'),
('Tilápia', 'Oreochromis spp.', 'onívoro'),
('Dourado', 'Salminus brasiliensis', 'carnívoro'),
('Pacu', 'Piaractus mesopotamicus', 'onívoro'),
('Pirambeba', 'Serrasalmus spp.', 'carnívoro'),
('Traíra', 'Hoplias malabaricus', 'carnívoro'),
('Robalo', 'Centropomus spp.', 'carnívoro'),
('Jundiá/Bagre', 'Rhamdia spp.', 'carnívoro'),
('Lambari', 'Astyanax spp.', 'onívoro');

select*from peixes;

create table iscas(
idIscas int primary key auto_increment,
tipo varchar(45) not null,
	constraint chkTipo check(tipo in('artificial', 'natural', 'viva')),
nome varchar(45) not null);

insert into iscas (tipo, nome) values
('natural', 'lambaris'),                 
('natural', 'camarões vivos'),           
('artificial', 'Isca de superfície'),     
('natural', 'peixes vivos'),             
('natural', 'Isca de meia água'),        
('natural', 'Tuvira'),                   
('natural', 'minhocoçu'),                
('natural', 'massa'),                    
('natural', 'minhoca'),                  
('natural', 'frutas'),                   
('natural', 'insetos'),                  
('natural', 'milho'),                    
('artificial', 'Isca de barbela longa'), 
('natural', 'bicho da laranja'),         
('natural', 'tenébrio'),                 
('artificial', 'Spinner');               

create table PeixeIsca(
fkIscas int,
	foreign key(fkIscas) references iscas(idIscas),
fkPeixes int,
	foreign key(fkPeixes) references peixes(idPeixes),
	primary key(fkIscas,fkPeixes));

create table baciasPeixes(
fkBacias int,
	foreign key(fkBacias) references bacias(idBacias),
fkPeixes int,
	foreign key(fkPeixes) references peixes(idPeixes),
    primary key(fkBacias,fkPeixes),
natureza varchar(45) not null);

insert baciasPeixes values
(1, 1, 'Nativa'),
(1, 2, 'Nativa'),
(1, 3, 'Nativa'),
(1, 4, 'Nativa'),
(1, 5, 'Nativa'),
(1, 6, 'Nativa'),
(1, 7, 'Nativa'),
(2, 1, 'Nativa'), 
(2, 8, 'Nativa'), 
(2, 9, 'Nativa'), 
(2, 6, 'Nativa'), 
(2, 10, 'Nativa'),
(2, 7, 'Nativa'), 
(2, 3, 'Nativa'),
(3, 15, 'Nativa'),   
(3, 16, 'Nativa'),   
(3, 9, 'Nativa'),    
(3, 11, 'Nativa'),   
(3, 12, 'Nativa'), 
(3, 13, 'Nativa'),  
(3, 1, 'Introduzida'), 
(3, 14, 'Introduzida'),
(4, 15, 'Nativa'),   
(4, 16, 'Nativa'),   
(4, 12, 'Nativa'),
(4, 18, 'Nativa'),   
(4, 19, 'Nativa'),   
(4, 20, 'Nativa'),
(4, 21, 'Nativa'),   
(4, 14, 'Introduzida'),
(5, 18, 'Nativa'),   
(5, 15, 'Nativa'),   
(5, 19, 'Nativa'),   
(5, 20, 'Nativa'),
(5, 14, 'Introduzida'), 
(5, 21, 'Nativa');

-- Seleciona todos os peixes da bacia amazônica:
select peixes.nomePopular, peixes.nomeCientifico, baciasPeixes.natureza
from baciasPeixes
join peixes on baciasPeixes.fkPeixes = peixes.idPeixes
join bacias on baciasPeixes.fkBacias = bacias.idBacias
where bacias.nome = 'Bacia Amazônica';

-- Seleciona os peixes carnívoros de todas as bacías:
SELECT peixes.nomePopular, peixes.nomeCientifico, bacias.nome AS bacia
FROM baciasPeixes
JOIN peixes ON baciasPeixes.fkPeixes = peixes.idPeixes
JOIN bacias ON baciasPeixes.fkBacias = bacias.idBacias
WHERE peixes.comportamento = 'carnívoro';

-- Conta o número de peixes por bacia:
SELECT bacias.nome AS bacia, COUNT(*) AS numero_de_peixes
FROM baciasPeixes
JOIN bacias ON baciasPeixes.fkBacias = bacias.idBacias
GROUP BY bacias.nome;