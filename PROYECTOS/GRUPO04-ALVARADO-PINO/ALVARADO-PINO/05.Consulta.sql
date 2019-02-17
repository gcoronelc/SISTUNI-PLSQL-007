

--- Total de facturas generadas--

Select b.NomSucursal Sucursal ,a.NumDoc Factura,a.totimporte Importe,e.sigla Moneda,c.nomcliente Cliente,
       c.ruc Ruc,d.nompersonal Vendedor,a.fecregven Fecha_Venta 
         from Ventas a
left join sucursal b on a.idsucursal=b.idsucursal
left join cliente c on a.idcliente=c.idcliente
left join personal d on d.idpersonal=a.idpersonal
left join Moneda e on e.idmon=a.idmon
where a.idsucursal in(a.idsucursal) and a.fecregven>='31/01/2019' and d.idpersonal in(d.idpersonal)
order by a.NumDoc asc;


-- El vendedor que mas facturo --

Select i.vendedor,i.total_vendido, case when i.orden=1  then '***Vendedor del Mes***' else 'Vendedor Regular' end Tipo_Vendedor  from(
select  ROWNUM orden,x.vendedor,x.total_vendido   from (
Select  a.nompersonal Vendedor,Sum(b.totimporte) Total_Vendido    
from personal a
left join Ventas b on a.idpersonal=b.idpersonal
group by a.nompersonal
order by Total_Vendido desc) x ) i 

