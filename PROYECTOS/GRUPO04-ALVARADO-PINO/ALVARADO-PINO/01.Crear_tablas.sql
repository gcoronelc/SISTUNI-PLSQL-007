
Create table sucursal (
idSucursal NUMBER primary key,
NomSucursal VARCHAR2(200)
--,fecRegSuc date
);
--select *  from sucursal;

create table personal(
idPersonal number primary key,
NomPersonal varchar2(500),
dni varchar2(8)
--,fecRegPer date
);

Create table cliente(
idCliente number primary key,
NomCliente varchar2 (500),
Ruc varchar2(11)
--,fecRegCli date
);

Create table Moneda(
idMon number primary key,
NomMoneda varchar2 (100),
sigla varchar2 (3)
--,fecRegMon date
);

--Create table igv (
--idIgv number primary key,
--Igv number(2,2)
--,fecRegIgv date
--);

Create table item (
idItem number primary key,
NomItem Varchar2 (500),
precioItem number, 
Cantidad number
--,fecRegItem date
);

--Create table Stock (
--idStock number primary key,
--idItem number,
--Cantidad number
--,fecRegStock date
--);

Create table Ventas (
idVenta number primary key,
idSucursal number,
NumDoc varchar2(15),
idCliente number,
idMon number,
totImporte number,
--Igv number(2,2),
idPersonal number,
fecRegVen date
);

Create table DtVentas(
idVenta number,
NumItem number,
idItem number,
Cantidad number,
precioUni number,
precioTot number,
--fecRegDet date,
primary key(idVenta,NumItem)
);




/*
drop table sucursal;
drop table personal;
drop table cliente;
drop table Moneda;
drop table item;
drop table Ventas;
drop table DtVentas;
*/