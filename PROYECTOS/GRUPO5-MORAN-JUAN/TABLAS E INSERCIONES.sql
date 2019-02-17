--TABLA CATEGORIA
CREATE TABLE CATEGORIA(
id_categoria NUMBER,
nombre_categoria VARCHAR2(40),
descripcion_cat  VARCHAR2(200),
constraint pk_ica primary key(id_categoria)
)
--TABLA PRODUCTOS - CATEGORIA
CREATE TABLE PRODUCTO_CATEGORIA(
id_categoria1 NUMBER,
id_producto1 NUMBER,
constraint fk_ica1 foreign key (id_categoria1) references CATEGORIA(id_categoria),
constraint  fk_ipro1 foreign key(id_producto1) references PRODUCTOS(id_producto)
)
--TABLA PRODUCTOS
CREATE TABLE PRODUCTOS(
id_producto NUMBER,
nombre_producto VARCHAR2(35),
precio_unitario NUMBER,
unidades_en_stock NUMBER,
unidades_pedida NUMBER,
descatalogado VARCHAR2(12), 
constraint pk_ipro primary key(id_producto)
)
--TABLA PRODUCTO-PROVEEDORES
CREATE TABLE PRODUCTOS_PROVEEDORES(
id_producto2 NUMBER,
id_proveedores1 NUMBER,
constraint fk_ipro2 foreign key (id_producto2) references PRODUCTOS (id_producto),
constraint fk_iprov1 foreign key (id_proveedores1) references PROVEEDORES(id_proveedores)

)
--TABLA PROVEEDORES
CREATE TABLE PROVEEDORES (
id_proveedores NUMBER,
nombre_proveedor VARCHAR2(50),
nombre_contacto VARCHAR2(50),
puesto_contacto VARCHAR2(45),
direccion VARCHAR2(40),
localidad VARCHAR2(45),
estado VARCHAR2(50),
cod_postal NUMBER,
telefono VARCHAR2(40),
constraint pk_iprov primary key(id_proveedores)
)
--TABLA CLIENTE
CREATE TABLE CLIENTE(
id_cliente  NUMBER,
nombre_cliente VARCHAR2(45),
apellido_cliente VARCHAR2(40),
direccion_cliente VARCHAR2(35),
localidad_cliente VARCHAR2(50),
region_cliente VARCHAR2(60),
cos_postal_cliente NUMBER,
pais_cliente VARCHAR2(30),
Telefono_cliente VARCHAR2(9),
constraint pk_icli primary key(id_cliente)
)
--TABLA PEDIDOS
CREATE TABLE PEDIDOS(
id_pedido NUMBER,
id_cliente1 NUMBER,
id_empleado1 NUMBER,
fecha_pedido DATE,
fecha_envio DATE,
ruta_envio VARCHAR2(35),
FECHA_OBJETIVA Date,
id_transportista1 NUMBER,
constraint pk_ipe primary key(id_pedido),
constraint fk_icli1 foreign key (id_cliente1) references CLIENTE(id_cliente),
constraint fk_emp1 foreign key(id_empleado1) references EMPLEADOS(id_empleado),
constraint fk_itrans1 foreign key(id_transportista1) references TRANSPORTISTAS(id_transportista)
)
--TABLA EMPLEADOS
CREATE TABLE EMPLEADOS(
id_empleado NUMBER,
nombre_empleado VARCHAR2(25),
apellido_empleado VARCHAR(35),
puesto_empleado VARCHAR(45),
direccion_empleado VARCHAR2(45),
localidad VARCHAR2(40),
estado VARCHAR2(15),
cod_postal NUMBER,
telefono VARCHAR2(9),
fecha_nacimiendo DATE,
fecha_contratacion DATE,
constraint pk_iemp primary key(id_empleado)
)
--TABLA TRANSPORTISTAS 
CREATE TABLE TRANSPORTISTAS(
id_transportista NUMBER,
commpañia VARCHAR2(40),
contacto VARCHAR2(50),
direccion VARCHAR2(60),
localidad VARCHAR2(40),
estado VARCHAR(15),
cod_postal NUMBER,
telefono VARCHAR2(9),
constraint pk_itrans primary key(id_transportista)
)
--TABLA DETALLE-PRODUCTO
CREATE TABLE DETALLE_PRODUCTO(
id_detalle VARCHAR2(50),
cantidad NUMBER,
descuento NUMBER,
id_pedido1 NUMBER,
id_producto3 NUMBER,
constraint pk_idet primary key (id_detalle),
constraint fk_ipe1 foreign key(id_pedido1) references PEDIDOS(id_pedido),
constraint fk_ipro3 foreign key (id_producto3) references PRODUCTOS(id_producto) 
)

--------------------------------------------------------------------------------------------
--INSERTANDO DATOS EN CLIENTES
insert into CLIENTE values(11,'JOSE','MORALES','PEDRO MONERNO','CHINCHA','ICA',051,'PERU',956535323);
insert into CLIENTE values(12,'JUAN','PEREZ','PUEBLO NUEVO','CHINCHA','ICA',051,'PERU',945254698);
insert into CLIENTE values(13,'MARIA','UCULMANA','AYABCA','ICA','ICA',051,'PERU',956124873);
insert into CLIENTE values(14,'KARINA','PACHAS','MIRAFLORES','LIMA','LIMA',051,'PERU',980154870);
insert into CLIENTE values(15,'PAOLO','MONTALVAN','CHOSICA','LIMA','LIMA',051,'PERU',972001248);
insert into CLIENTE values(16,'JOAQUIN','PARIONA','ALTO LARAN','CHINCHA','ICA',051,'PERU',956067849);
insert into CLIENTE values(17,'ANA','SANCHEZ','LA TINGUIÑA','ICA','ICA',051,'PERU',956998420);
insert into CLIENTE values(18,'JACOBO','MELENDEZ','PARACAS','PISCO','ICA',051,'PERU',945115478);
insert into CLIENTE values(19,'CELESTE','JUAREZ','MARCONA','NAZCA','ICA',051,'PERU',972356478);
insert into CLIENTE values(20,'MICHAEL','MARCOS','GROCIO PRADO','CHINCHA','ICA',051,'PERU',940487529);
SELECT *FROM CLIENTE;

--INSERTANDO DATOS EN CATEGORIA
insert into CATEGORIA values(21,'CARNES Y EMBUTIDOS','CATEGORIA COMPUESTA POR UNA GRAN VARIEDAD DE CARNES');
insert into CATEGORIA values(22,'FRUTAS Y VERDURAS','FRUTAS FRESCAS DE IMPORTACION');
insert into CATEGORIA values(23,'PAN Y DULCES','CON UNA GRAN VARIEDAD DE PAN ');
insert into CATEGORIA values(24,'LACTEOS','DE BUENA CALIDAD');
insert into CATEGORIA values(25,'PASTAS','DE ALTA CALIDAD');
insert into CATEGORIA values(26,'COMIDAS PREPARADAS','SE NECESITA PONER EN  MICROONDAS');
insert into CATEGORIA values(27,'BEBIDAS','DE MARCAS RECONOCIDAS');
insert into CATEGORIA values(28,'APERITIVOS','EXQUISITOS ');
insert into CATEGORIA values(29,'LIMPIEZA','PARA LA CASA');
insert into CATEGORIA values(30,'COSMETICA','PARA DAMAS');
select*from CATEGORIA;

--INSERTANDO DATOS EN PRODUCTOS
insert into PRODUCTOS values(31,'CARNE DE CERDO',15,100,15,'SI') ;
insert into PRODUCTOS values(32,'CARNE DE OVEJA',20,120,50,'SI') ;
insert into PRODUCTOS values(33,'PLATANO',1,60,14,'Si') ;
insert into PRODUCTOS values(34,'MANZANA',2,70,13,'SI') ;
insert into PRODUCTOS values(35,'PAN FRANCES',1,45,15,'SI'); 
insert into PRODUCTOS values(36,'PAN DE MOLDE',2,35,25,'SI'); 
insert into PRODUCTOS values(37,'LECHE',3,200,34,'SI') ;
insert into PRODUCTOS values(38,'YOGURT',6,100,15,'SI') ;
insert into PRODUCTOS values(39,'PASTA FUSILLI',5,200,34,'SI'); 
insert into PRODUCTOS values(40,'PASTARIGATONI',6,140,40,'SI') ;
insert into PRODUCTOS values(41,'SANDWICH',5,50,9,'SI') ;
insert into PRODUCTOS values(42,'POLLO AL CURRY',8,50,13,'SI'); 
insert into PRODUCTOS values(43,'GASEOSAS',3,200,40,'SI') ;
insert into PRODUCTOS values(44,'AGUA MINERAL',2,230,40,'SI'); 
insert into PRODUCTOS values(45,'CALABAZIN  RELLENO DE JAMO',5,200,56,'SI'); 
insert into PRODUCTOS values(46,'PATATAS A LA VINAGRETA',5,120,45,'SI') ;
insert into PRODUCTOS values(47,'POET',4,130,34,'SI');
insert into PRODUCTOS values(48,'LIMPIA VIDRIOS',10,50,45,'SI');
insert into PRODUCTOS values(49,'LABIAL',12,50,21,'SI');
insert into PRODUCTOS values(50,'PINTA UÑAS',15,56,21,'SI');
select*From productos;

--INSERTANDO DATOS EN  PRODUCTOS_CATEGORIA
insert into PRODUCTO_CATEGORIA values(21,31);
insert into PRODUCTO_CATEGORIA values(21,32);
insert into PRODUCTO_CATEGORIA values(22,33);
insert into PRODUCTO_CATEGORIA values(22,34);
insert into PRODUCTO_CATEGORIA values(23,35);
insert into PRODUCTO_CATEGORIA values(23,36);
insert into PRODUCTO_CATEGORIA values(24,37);
insert into PRODUCTO_CATEGORIA values(24,38);
insert into PRODUCTO_CATEGORIA values(25,39);
insert into PRODUCTO_CATEGORIA values(25,40);
insert into PRODUCTO_CATEGORIA values(26,41);
insert into PRODUCTO_CATEGORIA values(26,42);
insert into PRODUCTO_CATEGORIA values(27,43);
insert into PRODUCTO_CATEGORIA values(27,44);
insert into PRODUCTO_CATEGORIA values(28,45);
insert into PRODUCTO_CATEGORIA values(28,46);
insert into PRODUCTO_CATEGORIA values(29,47);
insert into PRODUCTO_CATEGORIA values(29,48);
insert into PRODUCTO_CATEGORIA values(30,49);
insert into PRODUCTO_CATEGORIA values(30,50);
select*from PRODUCTO_CATEGORIA;

--INSERTANDO DATOS EN PROVEEDORES
insert into PROVEEDORES values(51,'JOAQUIN','JQUIN','RECEPCION','MIRAFLORES','CALLE TACNA','ACTIVO',051,262574);
insert into PROVEEDORES values(52,'MARIA','MARI','RECEPCION',' URB PALMA','PARQUE PALMA','ACTIVO',051,252421);
insert into PROVEEDORES values(53,'PEDRO','PEDR','RECEPCION','SAN ISIDRO','SANTO TORIBIO','ACTIVO',051,262425);
insert into PROVEEDORES values(54,'NICOLAS','NIC','RECEPCION','MIRAFLORES','ALAMEDA RICARDO PALMA','ACTIVO',051,287454);
insert into PROVEEDORES values(55,'ANA','ANA','RECEPCION','LA VICTORIA','MEXICO','ACTIVO',051,542125);
insert into PROVEEDORES values(56,'MICHAEL','MICH','RECEPCION','SAN MIGUEL','LA MAR','ACTIVO',051,285964);
insert into PROVEEDORES values(57,'JORDAN','JORD','RECEPCION','SAN LUIS','ALAVA','ACTIVO',051,292824);
insert into PROVEEDORES values(58,'JOSEFINA','JOSEFF','RECEPCION','MAGDALENA DEL MAR','JIRON BOLIVAR','ACTIVO',051,242525);
insert into PROVEEDORES values(59,'HUGO','HUG','RECEPCION','SURQUILLO','ANGAMOS','ACTIVO',051,322536);
insert into PROVEEDORES values(60,'KEVIN','KEV','RECEPCION','CHORRILLOS','SAN FELIPE','ACTIVO',051,452521);
select*from PROVEEDORES;

--INSERTANDO DATOS EN PROVEEDORES PRODUCTOS
insert into PRODUCTOS_PROVEEDORES values(31,51);
insert into PRODUCTOS_PROVEEDORES values(32,51);
insert into PRODUCTOS_PROVEEDORES values(33,52);
insert into PRODUCTOS_PROVEEDORES values(34,52);
insert into PRODUCTOS_PROVEEDORES values(35,53);
insert into PRODUCTOS_PROVEEDORES values(36,53);
insert into PRODUCTOS_PROVEEDORES values(37,54);
insert into PRODUCTOS_PROVEEDORES values(38,54);
insert into PRODUCTOS_PROVEEDORES values(39,55);
insert into PRODUCTOS_PROVEEDORES values(40,55);
insert into PRODUCTOS_PROVEEDORES values(41,56);
insert into PRODUCTOS_PROVEEDORES values(42,56);
insert into PRODUCTOS_PROVEEDORES values(43,57);
insert into PRODUCTOS_PROVEEDORES values(44,57);
insert into PRODUCTOS_PROVEEDORES values(45,58);
insert into PRODUCTOS_PROVEEDORES values(46,58);
insert into PRODUCTOS_PROVEEDORES values(47,59);
insert into PRODUCTOS_PROVEEDORES values(48,59);
insert into PRODUCTOS_PROVEEDORES values(49,60);
insert into PRODUCTOS_PROVEEDORES values(50,60);

--INSERTANDO DATOS EN EMPLEADOS

insert into EMPLEADOS values(61,'RAMIRO','JUAREZ','VENDEDOR','CHINCHA','AV CENTENARIO','DISPONIBLE',051,252325,TO_DATE('13/10/1993','DD/MM/YYYY'),TO_DATE('12/11/2000','DD/MM/YYYY'));
insert into EMPLEADOS values(62,'CAMILA','MORGAN','VENDEDOR','CHINCHA','PUEBLO NUEVO','DISPONIBLE',051,253454,TO_DATE('8/12/1990','DD/MM/YYYY'),TO_DATE('24/11/2001','DD/MM/YYYY'));
insert into EMPLEADOS values(63,'ESTRELLA','ALBORAN','VENDEDOR','ICA','','LA TINGUIÑA',051,275674,TO_DATE('09/08/1995','DD/MM/YYYY'),TO_DATE('23/08/2003','DD/MM/YYYY'));
insert into EMPLEADOS values(64,'JOEL','AROSTEGUI','VENDEDOR','ICA','LA PALMA','DISPONIBLE',051,349989,TO_DATE('11/10/1990','DD/MM/YYYY'),TO_DATE('11/04/1999','DD/MM/YYYY'));
insert into EMPLEADOS values(65,'THALIA','MENDEZ','VENDEDOR','LIMA','MIRAFLORES','DISPONIBLE',051,323243,TO_DATE('15/02/1997','DD/MM/YYYY'),TO_DATE('17/02/2008','DD/MM/YYYY'));
insert into EMPLEADOS values(66,'JULIO','ARTEAGA','VENDEDOR','LIMA','SURCO','DISPONIBLE',051,375687,TO_DATE('30/09/1993','DD/MM/YYYY'),TO_DATE('16/07/2010','DD/MM/YYYY'));
insert into EMPLEADOS values(67,'RAMON','PACHECO','VENDEDOR','CHINCHA','GROCIO PRADO','DISPONIBLE',051,459858,TO_daTE('27/02/1991','DD/MM/YYYY'),TO_DATE('10/10/2010','DD/MM/YYYY'));
insert into EMPLEADOS values(68,'TATIANA','MARIN','VENDEDOR','CHINCHA','ZUNAMPE','DISPONIBLE',051,252558,TO_DATE('23/09/1992','DD/MM/YYYY'),TO_DATE('15/06/2001','DD/MM/YYYY'));
insert into EMPLEADOS values(69,'MARCIA','MOSCAYZA','VENDEDOR','LIMA','RIMAC','DISPONIBLE',051,267577,TO_DATE('12/12/1990','DD/MM/YYYY'),TO_DATE('19/06/2008','DD/MM/YYYY'));
insert into EMPLEADOS values(70,'PABLO','BASTIDAS','VENDEDOR','ICA','SIMON BOLIVAR','DISPONIBLE',051,299888,TO_DATE('11/12/1990','DD/MM/YYYY'),TO_DATE('11/11/2011','DD/MM/YYYY'));

--INSERTANDO DATOS EN TRANSPORTISTAS

insert into TRANSPORTISTAS values(71,'BUS MOTOR','TRANSORTISTA','CENTENARIO','CHINCHA','DISPONIBLE',051,242435);
insert into TRANSPORTISTAS values(72,'MOTOR CAR','TRANSORTISTA','RIMAC','LIMA','DISPONIBLE',051,245656);
insert into TRANSPORTISTAS values(73,'CARS','TRANSORTISTA','OCUCAJE','ICA','DISPONIBLE',051,234456);
insert into TRANSPORTISTAS values(74,'METROCAR','TRANSORTISTA','PARACAS','PISCO','DISPONIBLE',051,322334);
insert into TRANSPORTISTAS values(75,'CORCAR','TRANSORTISTA','LA VICTORIA','LIMA','DISPONIBLE',051,433567);
insert into TRANSPORTISTAS values(76,'BUS FLASH','TRANSORTISTA','TINGUIÑA','ICA','DISPONIBLE',051,343436);
insert into TRANSPORTISTAS values(77,'BUS MOTOR','TRANSORTISTA','ZUNAMPE','CHINCHA','DISPONIBLE',051,546557);
insert into TRANSPORTISTAS values(78,'MOTORS','TRANSORTISTA','SAN MARTIN','LIMA','DISPONIBLE',051,436535);
insert into TRANSPORTISTAS values(79,'BUS MOTOR','TRANSORTISTA','SAN JUAN DE LURIGANCHO','LIMA','DISPONIBLE',051,265443);
insert into TRANSPORTISTAS values(80,'BUS MOTOR','TRANSORTISTA','SAN JUAN LURIGANCHO','LIMA','DISPONIBLE',051,321220);

--INSERTANDO DATOS EN PEDIDOS

insert into PEDIDOS values(81,11,61,TO_DATE('12/03/2017','DD/MM/YYYY'),TO_DATE('12/04/2017','DD/MM/YYYY'),'CHINCHA',TO_DATE('12/05/2017','DD/MM/YYYY'),71);
insert into PEDIDOS values(82,12,62,TO_DATE('7/02/2019','DD/MM/YYYY'),TO_DATE('7/03/2019','DD/MM/YYYY'),'CHINCHA',TO_DATE('7/04/2019','DD/MM/YYYY'),72);
insert into PEDIDOS values(83,13,63,TO_DATE('10/01/2019','DD/MM/YYYY'),TO_DATE('10/02/2019','DD/MM/YYYY'),'ICA',TO_DATE('12/03/2019','DD/MM/YYYY'),73);
insert into PEDIDOS values(84,14,64,TO_DATE('14/11/2018','DD/MM/YYYY'),TO_DATE('14/12/2018','DD/MM/YYYY'),'ICA',TO_DATE('14/01/2019','DD/MM/YYYY'),74);
insert into PEDIDOS values(85,15,65,TO_DATE('20/09/2016','DD/MM/YYYY'),TO_DATE('20/10/2016','DD/MM/YYYY'),'LIMA',TO_DATE('20/11/2016','DD/MM/YYYY'),75);
insert into PEDIDOS values(86,16,66,TO_DATE('12/11/2017','DD/MM/YYYY'),TO_DATE('12/04/2017','DD/MM/YYYY'),'LIMA',TO_DATE('12/05/2017','DD/MM/YYYY'),76);
insert into PEDIDOS values(87,17,67,TO_DATE('23/12/2018','DD/MM/YYYY'),TO_DATE('23/04/2018','DD/MM/YYYY'),'CHINCHA',TO_DATE('23/05/2018','DD/MM/YYYY'),77);
insert into PEDIDOS values(88,18,68,TO_DATE('27/04/2014','DD/MM/YYYY'),TO_DATE('27/04/2014','DD/MM/YYYY'),'CHINCHA',TO_DATE('27/05/2014','DD/MM/YYYY'),78);
insert into PEDIDOS values(89,19,69,TO_DATE('30/07/2015','DD/MM/YYYY'),TO_DATE('30/04/2015','DD/MM/YYYY'),'LIMA',TO_DATE('30/05/2015','DD/MM/YYYY'),79);
insert into PEDIDOS values(90,20,70,TO_DATE('10/10/2010','DD/MM/YYYY'),TO_DATE('10/04/2010','DD/MM/YYYY'),'ICA',TO_DATE('10/05/2010','DD/MM/YYYY'),80);

--INSERTANDO DATOS EN DETALLE_PRODUCTO

insert into DETALLE_PRODUCTO values(91,4,20,81,31);
insert into DETALLE_PRODUCTO values(92,7,20,81,32);
insert into DETALLE_PRODUCTO values(93,8,20,82,33);
insert into DETALLE_PRODUCTO values(94,9,20,82,34);
insert into DETALLE_PRODUCTO values(95,3,20,83,35);
insert into DETALLE_PRODUCTO values(96,12,20,83,36);
insert into DETALLE_PRODUCTO values(97,11,20,84,37);
insert into DETALLE_PRODUCTO values(98,6,20,84,38);
insert into DETALLE_PRODUCTO values(99,20,20,85,39);
insert into DETALLE_PRODUCTO values(100,12,20,85,40);
insert into DETALLE_PRODUCTO values(101,4,20,86,41);
insert into DETALLE_PRODUCTO values(102,4,20,86,42);
insert into DETALLE_PRODUCTO values(103,4,20,87,43);
insert into DETALLE_PRODUCTO values(104,4,20,87,44);
insert into DETALLE_PRODUCTO values(105,4,20,88,45);
insert into DETALLE_PRODUCTO values(106,4,20,88,46);
insert into DETALLE_PRODUCTO values(107,4,20,89,47);
insert into DETALLE_PRODUCTO values(108,4,20,89,48);
insert into DETALLE_PRODUCTO values(109,4,20,90,49);
insert into DETALLE_PRODUCTO values(110,4,20,90,50);








