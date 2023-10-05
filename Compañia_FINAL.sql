/*CREATE TABLE nombre_tabla (columnas-tipo-tama�o)*/
CREATE TABLE empleado (nombre VARCHAR(30), 
		       apellido VARCHAR(30), 
		       ci VARCHAR(10) NOT NULL, 
		       fecha_n DATE, 
		       direccion VARCHAR(30),
		       sexo CHAR(1), 
		       salario INTEGER(4), 
		       superci VARCHAR(10), 
		       dno INTEGER(1));
CREATE TABLE departamento (dnombre VARCHAR(30), 
			   dnumero INTEGER(1) NOT NULL, 
			   jefeci VARCHAR(10), 
			   jefe_fi DATE);
CREATE TABLE trabaja_en (eci VARCHAR(10) NOT NULL,
			 pno INTEGER(2) NOT NULL,
			 horas DOUBLE(4,2));
CREATE TABLE localizacion (dnumero INTEGER(1) NOT NULL,
			   dep_loca VARCHAR(30));
CREATE TABLE proyecto (pnombre VARCHAR(30),
		       pnumero INTEGER(2) NOT NULL,
		       plocal VARCHAR(30),
	               dnum INTEGER(1));
CREATE TABLE carga_f (eci VARCHAR(10) NOT NULL,
		      dep_nom VARCHAR(30),
		      sexo VARCHAR(1),
		      fecha_n DATE,
		      relacion VARCHAR(10));
ALTER TABLE empleado
ADD PRIMARY KEY (ci);

Tabla Departamento:
ALTER TABLE departamento ADD PRIMARY KEY (dnumero);

Tabla proyecto:
ALTER TABLE proyecto ADD PRIMARY KEY (pnumero);

Tabla Empleado:
ALTER TABLE empleado ADD FOREIGN KEY (dno) 
REFERENCES departamento (dnumero) ON DELETE SET null ON UPDATE CASCADE, 
ADD foreign KEY(superci) REFERENCES empleado(ci) 
ON DELETE SET NULL ON UPDATE CASCADE;

Tabla Trabaja_en:
ALTER TABLE trabaja_en 
ADD FOREIGN KEY(eci)
REFERENCES empleado(ci) 
ON DELETE CASCADE 
ON UPDATE CASCADE, 
ADD FOREIGN KEY(pno) 
REFERENCES proyecto (pnumero) 
ON DELETE CASCADE 
ON UPDATE CASCADE; 

TABLA departamento:
ALTER TABLE departamento 
ADD FOREIGN KEY(jefeci)
REFERENCES EMPLEADO (ci) 
ON DELETE SET NULL 
ON UPDATE CASCADE;

TAbla Proyecto:

ALTER TABLE proyecto ADD FOREIGN KEY(dnum) 
REFERENCES departamento (dnumero) ON DELETE SET NULL 
ON UPDATE CASCADE;

Tabla 	
ALTER TABLE carga_f ADD FOREIGN KEY (eci) 
REFERENCES empleado (ci) ON DELETE CASCADE 
ON UPDATE CASCADE;


ALTER TABLE departamento ADD UNIQUE (dnombre);

drop database,
/*drop nombre de la tabla;*/

RENAME TABLE nombe de la tabla TO nuevo nombre de la tabla;

drop table nombre de la tabla.
borrar columna

ALTER TABLE nOMBRE DE LA TABLA drop nombre de la columna;
Alter table nombre de la tabla add column nombre de la columna;
CAMBIAR NOMBRE DE LAS COLUMNAS  DE LAS TABLAS 
/*ALTER TABLE nombre_de_la_tabla CHANF�GE COLUMN "nombre_columna" "nuevi_nombre" "tipo_de_campo"*/


/*SQL COMANDOS
INSERT INTO nombrede la tabla(nombre_de_las_columnas) VALUES ("datos");
INSERT INTO VA AL COMANDO DE LA TABLA

INSERT INTO nombre_tabla SELECT tabla_origen.* FROM tabla_de_origen WHERE condicion;*/




INSERT INTO empleado (nombre, apellido, ci, fecha_n, direccion, sexo, salario)
VALUES 
    ('Juan', 'Polo', '123456789', '1959-03-03', 'Sucre 7-12', 'M', 3000),
    ('Humberto', 'Pons', '333445555', '1960-12-25', 'Bolivar 5-67', 'M', 4000),
    ('Marcia', 'Mora', '453453453', '1960-03-29', 'Colombia 4-23', 'F', 2500),
    ('Pablo', 'Castro', '666884444', '1955-09-15', 'Bolivar 1-50', 'M', 3800),
    ('Jaime', 'Perez', '888665555', '1957-04-05', 'Sangurima 8-34', 'M', 5500),
    ('Elena', 'Tapia', '987654321', '1961-05-03', 'Ordonez 7-29', 'F', 4300),
    ('Manuel', 'Bonilla', '987987987', '1958-07-16', 'B. Malo 1-10', 'M', 2500),
    ('Irma', 'Vega', '999887777', '1950-11-13', 'P. Cordova 3-45', 'F', 2500);



INSERT INTO departamento (`DNOMBRE`, `DNUMERO`, `JEFECI`, `JEFE_FI`)
VALUES ('Compras', 1, '333445555', '1978-06-06'), 
       ('Administrativo', 4, '987654321', '1982-12-05'), 
       ('Investigacion', 5, '888665555', '1980-12-05');


INSERT INTO localizacion (`DNUMERO`, `DEP_LOCA`) VALUES
(4, 'Guayaquil'),
(5, 'Quito'),
(5, 'Manta'),
(5, 'Cuenca'),
(1, 'Cuenca');



INSERT INTO proyecto (PNOMBRE, PNUMERO, PLOCAL, DNUM) VALUES
('ProductoX', 1, 'Quito', 5),
('ProductoY', 2, 'Manta', 5),
('Producto2', 3, 'Cuenca', 5),
('Computadora', 10, 'Guayaquil', 4),
('Reorganizar', 20, 'Cuenca', 1),
('Beneficios', 30, 'Guayaquil', 4);


INSERT INTO trabaja_en (`ECI`, `PNO`, `HORAS`) VALUES
(123456789, 1, 12.5),
(123456789, 2, 15.6),
(666884444, 3, 14.7),
(453453453, 1, 10),
(453453453, 2, 10),
(333445555, 2, 20),
(333445555, 3, 10),
(333445555, 10, 10),
(333445555, 20, 10),
(999887777, 30, 30),
(999887777, 10, 5),
(987987987, 10, 15),
(987987987, 30, 17),
(987654321, 30, 10),
(987654321, 20, 12),
(888665555, 20, NULL);



INSERT INTO carga_f (`ECI`, `DEP_NOM`, `SEXO`, `FECHA_N`, `RELACION`) VALUES
('333445555', 'Maria', 'F', '1986-02-02', 'Hija'),
('333445555', 'Teodoro', 'M', '1990-10-10', 'Hijo'),
('333445555', 'Ana', 'F', '1965-09-15', 'Conyuge'),
('987654321', 'Alberto', 'M', '1967-07-06', 'Conyuge'),
('123456789', 'Miguel', 'M', '1984-11-05', 'Hijo'),
('123456789', 'Maria', 'F', '1987-01-09', 'Hija'),
('123456789', 'Elizabeth', 'F', '1960-12-12', 'Conyuge');




SELECT nombre_columnas FROM nombre_de_la_tabla;


/*Modificaciones*/
update empleado set superci = '333445555', dno = '5'
where ci = '123456789';

update empleado set superci = '888665555', dno = '5'
where ci = '333445555';

update empleado set superci = '987654321', dno = '4'
where ci = '999887777';

update empleado set superci = '888665555', dno = '4'
where ci = '987654321';

update empleado set superci = '333445555', dno = '5'
where ci = '666884444';

update empleado set superci = '333445555', dno = '5'
where ci = '453453453';

update empleado set superci = '987654321', dno = '4'
where ci = '987987987';

update empleado set dno = '1' where ci = '888665555';

delete from empleado where ci = '123456789';

/*subconsultas
select listas_de_columnas from lista_de_tablas 
where <expresion> <condicion> (
	Select nombre_columna from 	lista_de_tablas where condición);
*/
/*Consultas a realizar*/

/* 1. Listar las cargas familiares 
de la empleada elena tapia.*/
select * from carga_f 
where eci = (select ci  from empleado
 where nombre = "Elena");

/* 2. Listar los empleados que trabajan 
en el departamento administrativo.*/
select * from empleado 
where superci = (select jefeci from departamento 
where dnumero = 4);

/* 3. Listar los proyectos en los que 
los empleados tengan cargas familiares de sexo femenino.*/
select * from proyecto 
where dnum in (select dno from empleado 
where ci in (select eci from carga_f where sexo = "F") );

/* 4. Listar todos los departamentos 
en los cuales todos sus empleados 
ganan entre 2500 y 4300 dolares.*/
select * from departamento 
where dnumero in (select dno from empleado 
where salario between 2500 and 4300);

/* 5. Listar todos los empleados 
que no tengan cargas familiares.*/
select * from empleado 
where ci not in (select eci from carga_f );

/* 6. Listar todos los proyectos 
que pertenecen al departamento de compras.*/
select * from proyecto 
where dnum = (select dnumero from departamento 
where dnombre = "Compras");

/* 7. Listar los empleados que trabajan en el productoz.*/
select * from empleado 
where dno = (select dnumero from departamento 
where dnumero = (select dnum from proyecto 
where pnumero = 3) );

/* 8. Listar el nombre 
de los empleados que pertenezcan 
a mas de un proyecto.*/
SELECT nombre FROM empleado 
WHERE ci IN ( SELECT eci FROM trabaja_en
    GROUP BY eci
    HAVING COUNT(DISTINCT pno) > 1
);

/* 9. Listar todos los proyectos 
que pertenecen al departamento ubicado en Quito.*/
select * from proyecto
where plocal = "Quito" and dnum = (select dnumero from departamento
where dnumero in (select dnumero from localizacion 
where dep_loca = "Quito"));

/* 10. Listar todos los empleados y sus respectivas cargas 
siempre y cuando hayan nacido en el mismo mes.*/
SELECT e.nombre, c.dep_nom FROM empleado e, carga_f c
WHERE e.ci IN ( SELECT c.eci FROM carga_f c, empleado e
    WHERE MONTH(c.fecha_n) = MONTH(e.fecha_n)
) GROUP BY e.nombre, c.dep_nom;

/* 11. Listar el nombre del departamento 
que tiene a mas de tres empleados.*/
SELECT nombre FROM empleado
WHERE ci IN (SELECT eci FROM trabaja_en GROUP BY eci
    HAVING COUNT(DISTINCT pno) > 1
);

/* 12. Listar el departamento  con el mayor salario.*/
SELECT d.dnombre, e.salario FROM departamento d
INNER JOIN empleado e ON d.dnumero = e.dno
WHERE e.salario = (
    SELECT MAX(salario) 
    FROM empleado
);

