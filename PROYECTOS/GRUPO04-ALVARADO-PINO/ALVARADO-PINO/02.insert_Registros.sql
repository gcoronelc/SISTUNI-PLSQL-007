


insert into sucursal values (1,'lima');
insert into sucursal values (2,'Ica');
insert into sucursal values (3,'Arequipa');



insert into Personal values (1,'Sergio Jacquez','12345674');
insert into Personal values (2,'Ximena alvarado','22345675');
insert into Personal values (3,'Percy LionHeard','32345676');
insert into Personal values (4,'Maribel Pino','42345677');
insert into Personal values (5,'Peluchin','52345678');



insert into Cliente values (1,'Maxima internacional S.A','10145678991');
insert into Cliente values (2,'Delltron S.A.C','10245678981');
insert into Cliente values (3,'Incomec S.A.C','10345678971');
insert into Cliente values (4,'Telware Peru S.A.C','10445678961');
insert into Cliente values (5,'Computadoras y Redes S.A.C','10545678951');
insert into Cliente values (6,'Enconn S.A.C','10645678941');
insert into Cliente values (7,'Micronix S.A.C','10745678931');
insert into Cliente values (8,'Alienware S.A.C','10845678921');
insert into Cliente values (9,'Soporte Carvajal S.A.C','10945678911');
insert into Cliente values (10,'DELL S.A.C','10125678221');



insert into Moneda values (1,'Sol','S/');
insert into Moneda values (2,'Dolar','$');



--insert into Igv values (1,18.00);



insert into Item values (1,'proyector EPSON TX',200,200);
insert into Item values (2,'USB KINGSTONK 64 GB',20,1000);
insert into Item values (3,'DISCO DURO EXTERNO TOSHIBA 2TB',380,600);
insert into Item values (4,'MOUSE TEROS',15,1000);
insert into Item values (5,'CASE MICRONISC',100,300);
insert into Item values (6,'MONITOR SANSUNG 20 PULGADAS ',300,400);
insert into Item values (7,'CELULAR LG MAXIMUS XX',450,700);
insert into Item values (8,'MEMORIA RAM KINGTONG 8GB',120,400);
insert into Item values (9,'LAPTOP OMEN HP I7 GAMER',1500,300);
insert into Item values (10,'TARJETA DE VIDEO 1050 4GB',600,200);
insert into Item values (11,'ESTABILIZADOR FORZA',200,700);
insert into Item values (12,'MODEM TP-LINK GAMER',250,150);
insert into Item values (13,'TECLADO GAMER',40,100);
insert into Item values (14,'TABLET SANSUNG TAB A',300,180);
insert into Item values (15,'IMPRESORTA MULTIFUNCIONAL HP',220,350);
insert into Item values (16,'IMPRESORA LASER CANON',500,300);
insert into Item values (17,'PROCESADOR I7',500,100);
insert into Item values (18,'PROCESADOR I5',400,200);
insert into Item values (19,'PROCESDOR I3',300,100);
insert into Item values (20,'PLACA MADRE GIGABYTE',500,250);



insert into ventas values (1,1,'F01-000001',10,2,1000,1,TO_DATE('01/02/2019','DD/MM/YYYY'));
insert into ventas values (2,2,'F01-000002',2,2,8760,1,TO_DATE('01/02/2019','DD/MM/YYYY'));
insert into ventas values (3,3,'F01-000003',3,2,8900,2,TO_DATE('02/02/2019','DD/MM/YYYY'));
insert into ventas values (4,1,'F01-000004',2,2,6390,4,TO_DATE('03/02/2019','DD/MM/YYYY'));
insert into ventas values (5,1,'F01-000005',10,2,18260,5,TO_DATE('04/02/2019','DD/MM/YYYY'));
insert into ventas values (6,2,'F01-000006',1,2,12225,2,TO_DATE('05/02/2019','DD/MM/YYYY'));
insert into ventas values (7,3,'F01-000007',4,2,12200,3,TO_DATE('06/02/2019','DD/MM/YYYY'));
insert into ventas values (8,3,'F01-000008',1,2,9650,1,TO_DATE('10/02/2019','DD/MM/YYYY'));
insert into ventas values (9,2,'F01-000009',9,2,10800,4,TO_DATE('11/02/2019','DD/MM/YYYY'));
insert into ventas values (10,1,'F01-000010',8,2,9520,1,TO_DATE('16/02/2019','DD/MM/YYYY'));
insert into ventas values (11,1,'F01-000011',10,2,17600,1,TO_DATE('01/02/2019','DD/MM/YYYY'));
insert into ventas values (12,2,'F01-000012',2,2,9600,1,TO_DATE('01/02/2019','DD/MM/YYYY'));
insert into ventas values (13,3,'F01-000013',3,2,15840,2,TO_DATE('02/02/2019','DD/MM/YYYY'));
insert into ventas values (14,1,'F01-000014',2,2,19870,4,TO_DATE('03/02/2019','DD/MM/YYYY'));
insert into ventas values (15,1,'F01-000015',10,2,38940,5,TO_DATE('04/02/2019','DD/MM/YYYY'));
insert into ventas values (16,2,'F01-000016',1,2,18260,2,TO_DATE('05/02/2019','DD/MM/YYYY'));
insert into ventas values (17,3,'F01-000017',4,2,9520,3,TO_DATE('06/02/2019','DD/MM/YYYY'));
insert into ventas values (18,3,'F01-000018',1,2,6390,1,TO_DATE('10/02/2019','DD/MM/YYYY'));
insert into ventas values (19,2,'F01-000019',9,2,18260,4,TO_DATE('11/02/2019','DD/MM/YYYY'));
insert into ventas values (20,1,'F01-000020',8,2,12225,1,TO_DATE('16/02/2019','DD/MM/YYYY'));




insert into dtventas values (1,1,1,4,200,800);
insert into dtventas values (1,2,5,2,100,200);

insert into dtventas values (2,1,2,3,20,60);
insert into dtventas values (2,2,7,10,450,4500);
insert into dtventas values (2,3,10,7,600,4200);

insert into dtventas values (3,1,19,10,300,3000);
insert into dtventas values (3,2,3,15,380,5700);
insert into dtventas values (3,3,11,1,200,200);

insert into dtventas values (4,1,4,10,15,150);
insert into dtventas values (4,2,8,7,120,840);
insert into dtventas values (4,3,15,20,220,4400);
insert into dtventas values (4,4,1,5,200,1000);

insert into dtventas values (5,1,3,2,380,760);
insert into dtventas values (5,2,9,10,1500,15000);
insert into dtventas values (5,3,17,5,500,2500);

insert into dtventas values (6,1,4,15,15,225);
insert into dtventas values (6,2,18,30,400,12000);

insert into dtventas values (7,1,1,10,200,2000);
insert into dtventas values (7,2,16,20,500,10000);
insert into dtventas values (7,3,13,5,40,200);

insert into dtventas values (8,1,2,10,20,200);
insert into dtventas values (8,2,19,30,300,9000);
insert into dtventas values (8,3,7,1,450,450);

insert into dtventas values (9,1,18,2,400,800);
insert into dtventas values (9,2,1,50,200,10000);

insert into dtventas values (10,1,3,4,380,1520);
insert into dtventas values (10,2,10,5,600,3000);
insert into dtventas values (10,3,16,10,500,5000);

insert into dtventas values (11,1,3,4,380,1520);
insert into dtventas values (11,2,8,4,120,480);
insert into dtventas values (11,3,11,30,200,6000);
insert into dtventas values (11,4,1,8,200,1600);
insert into dtventas values (11,5,10,5,600,3000);
insert into dtventas values (11,6,16,10,500,5000);

insert into dtventas values (12,1,2,30,20,600);
insert into dtventas values (12,2,14,5,300,1500);
insert into dtventas values (12,3,17,15,500,7500);

insert into dtventas values (13,1,4,4,15,60);
insert into dtventas values (13,2,8,4,120,480);
insert into dtventas values (13,3,13,30,40,1200);
insert into dtventas values (13,4,1,8,200,1600);
insert into dtventas values (13,5,10,10,600,6000);
insert into dtventas values (13,6,17,13,500,6500);
insert into dtventas values (13,7,6,20,300,6000);

insert into dtventas values (14,1,3,14,380,5320);
insert into dtventas values (14,2,8,20,120,2400);
insert into dtventas values (14,3,10,20,600,12000);
insert into dtventas values (14,4,4,10,15,150);

insert into dtventas values (15,1,4,4,15,60);
insert into dtventas values (15,2,8,4,120,480);
insert into dtventas values (15,3,13,30,40,1200);
insert into dtventas values (15,4,1,8,200,1600);
insert into dtventas values (15,5,10,10,600,6000);
insert into dtventas values (15,6,17,13,500,6500);
insert into dtventas values (15,7,6,20,300,6000);
insert into dtventas values (15,8,5,50,100,5000);
insert into dtventas values (15,9,3,20,380,7600);
insert into dtventas values (15,10,19,15,300,4500);

insert into dtventas values (16,1,3,2,380,760);
insert into dtventas values (16,2,9,10,1500,15000);
insert into dtventas values (16,3,17,5,500,2500);

insert into dtventas values (17,1,3,4,380,1520);
insert into dtventas values (17,2,10,5,600,3000);
insert into dtventas values (17,3,16,10,500,5000);

insert into dtventas values (18,1,4,10,15,150);
insert into dtventas values (18,2,8,7,120,840);
insert into dtventas values (18,3,15,20,220,4400);
insert into dtventas values (18,4,1,5,200,1000);

insert into dtventas values (19,1,3,2,380,760);
insert into dtventas values (19,2,9,10,1500,15000);
insert into dtventas values (19,3,17,5,500,2500);

insert into dtventas values (20,1,4,15,15,225);
insert into dtventas values (20,2,18,30,400,12000);









/*
select * from sucursal;
select * from  personal;
select * from  cliente;
select * from  Moneda;
select * from  item;
select * from  Ventas;
select * from  DtVentas;
*/






-- delete from dtventas;
-- select * from dtventas;
-- drop table dtventas;

