--Comandos DDL--
create database compania;
use compania;

create table empleado (nombre varchar (30), apellido varchar (30), ci varchar (10) not null, fecha_n date, direccion varchar (30), sexo char(1), salario integer(4), superci varchar(10), dno integer(1));

create table departamento ( dnombre varchar(30), dnumero integer(1) not null, jefeci varchar(10), jefe_fi date);

create table trabaja_en (eci varchar(10) not null, pno integer (2) not null, horas double(4,2));

create table localizacion (dnumero integer (1) not null, dep_loca varchar (30));

create table proyecto (pnombre varchar (30), pnumero integer(2) not null, plocal varchar(30), dnum integer(1));

create table carga_f (eci varchar(10) not null, dep_nom varchar (30), sexo varchar (1), fechan_n date, relacion varchar(10));

alter table empleado add primary key(ci);

alter table departamento add primary key(dnumero);

alter table proyecto add primary key(pnumero);

alter table empleado add foreign key (dno) references departamento (dnumero) on delete set null on update cascade, add foreign key (superci) references empleado(ci) on delete set null on update cascade;

alter table localizacion add foreign key (dnumero) references departamento (dnumero) on delete cascade on update cascade;

alter table trabaja_en add foreign key (eci) references empleado(ci) on delete cascade on update cascade, add foreign key (pno) references proyecto(pnumero) on delete cascade on update cascade;

alter table  proyecto add foreign key (dnum) references departamento (dnumero) on delete set null on update cascade;

alter table carga_f add foreign key (eci) references empleado (ci) on delete cascade on update cascade;

alter table departamento add unique (dnombre);

insert into empleado (`nombre`, `apellido`, `ci`, `fecha_n`, `direccion`, `sexo`, `salario`) values ('Juan' , 'Polo','123456789' , '1959-03-03','Sucre 7-2' , 'M',3000), ('Humberto' , 'Pons','333445555' , '1960-12-25','Bolivar 5-67' , 'M',4000), ('Marcia' , 'Mora','453453453' , '1960-03-29','Colombia 4-23' , 'F',2500), ('Pablo' , 'Castro','666884444' , '1955-09-15','Bolivar 1-50' , 'M',3800), ('Jaime' , 'Perez','888665555' , '1957-04-05','Sangurima 8-34' , 'M',5500), ('Elena' , 'Tapia', '987654321' , '1961-05-03', 'Ordonez 7-29' , 'F',4300), ('Manuel' , 'Bonilla', '987987987' , '1928-07-16','B Malo 1-10' , 'M',2500), ('Irma' , 'Vega','999887777' , '1950-11-13','P. Cordova 3-45' , 'F',2500);

insert into departamento (`dnombre`,`dnumero`,`jefeci`,`jefe_fi`) values ('Compras' ,1,'333445555','1978-06-06'), ('Administrativo' ,4,'987654321','1982-12-05'),('Invertigacion' ,5,'888665555','1980-12-05');

insert into localizacion (`dnumero`,`dep_loca`) values (4,'Guayaquil'), (5,'Quito'), (5,'Manta'), (5,'Cuenca'), (1,'Cuenca');

insert into proyecto (`pnombre`,`pnumero`,`plocal`,`dnum`) values ('ProductoX',1,'Quito',5), ('ProductoY',2,'Manta',5), ('ProductoZ',3,'Cuenca',5), ('Computadora',10,'Guayaqui',4), ('Reorganizar',20,'Cuenca',1), ('Beneficios',30,'Guayaqui',4);

insert into trabaja_en (`eci`,`pno`,`horas`) VALUES ('123456789',  1 , 12.5), ('123456789',  2 , 15.6), ('666884444',  3 , 14.7), ('453453453',  1 , 10), ('453453453',  2 , 10), ('333445555',  2 , 20), ('333445555',  3 , 10), ('333445555', 10 , 10), ('999887777', 20 , 10), ('999887777', 30 , 30), ('987987987', 10 , 5), ('987987987', 10 , 15), ('987654321', 30 , 17), ('987654321', 30 , 10), ('987654321', 20 , 12), ('888665555', 20 , null);

update empleado set dno = 4 where ci = '987654321' or '987987987' or '999887777';
update empleado set superci = '333445555' where ci = '123456789';
update empleado set superci = '888665555' where ci = '333445555';
update empleado set superci = '333445555' where ci = '453453453';
update empleado set superci = '333445555' where ci = '666884444';
update empleado set superci = '888665555' where ci = '987654321';
update empleado set superci = '987654321' where ci = '987987987';
update empleado set superci = '987654321' where ci = '999887777';

update empleado set dno = null, superci = 333445555 where nombre = 'Juan';
update empleado set dno = null, superci = 888665555 where nombre = 'Humberto';
update empleado set dno = null, superci = 333445555 where nombre = 'Marcia';
update empleado set dno = null, superci = 888665555 where nombre = 'Pablo';
update empleado set dno = null, superci = 888665555 where nombre = 'Jaime';
update empleado set superci = 888665555 where nombre = 'Elena';
update empleado set superci = 987654321 where nombre = 'Manuel';
update empleado set superci = 987654321 where nombre = 'Irma';

update empleado set salario = 10000 where nombre = 'Irma';