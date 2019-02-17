CREATE OR REPLACE PROCEDURE prd_muestra_reporte(v_policy number)
as
  v_clientname varchar2(200) := ''; 
  v_sclient char(14) := '';
  v_direccion char(100) := '';
  v_vehiculo varchar(200) := '';
  v_marca varchar2(50) := '';
  v_modelo varchar2(50) := '';
  v_año number(5) := 0;
  v_prima number(18,6) := 0;
  v_inivigencia date := null;
  v_finvigencia date := null;
  v_existepoliza integer := 0;
  v_existeclienteinaddress integer := 0;    
  v_existepolizainauto integer := 0; 
begin  


  select 
  count(*) 
  into v_existepoliza
  from policy
  where npolicy = v_policy;
  
  if(v_existepoliza > 0)then
     begin
        select trim(c.scliename), c.sclient 
        into v_clientname, v_sclient
        from policy p
        inner join client c on p.sclient = c.sclient 
        where npolicy = v_policy;
     end;
  end if;
      
  select 
  count(*) 
  into v_existeclienteinaddress
  from address
  where sclient = v_sclient;
  
  if(v_existeclienteinaddress > 0) then
     begin
        select trim(a.sstreet) 
        into v_direccion
        from address a
        inner join client c on a.sclient = c.sclient 
        where a.sclient = v_sclient;
     end;                              
  end if;
  
  select 
  count(*) 
  into v_existepolizainauto
  from auto a
  inner join policy p on a.npolicy = p.npolicy
  where a.npolicy = v_policy;
  
  if(v_existepolizainauto > 0) then
     begin
        select ma.sdescript || ' ' || mo.sdescript || ' DEL ' || a.nyear, ma.sdescript, mo.sdescript, a.nyear, p.npremium, p.dstartdate, p.dexpirdat
        into v_vehiculo, v_marca, v_modelo, v_año, v_prima, v_inivigencia, v_finvigencia
        from auto a
        inner join policy p on a.npolicy = p.npolicy
        inner join pv_model_auto mo on a.nvehmodel = mo.nvehmodel
        inner join pv_brand_auto ma on mo.nvehbrand = ma.nvehbrand
        where a.npolicy = v_policy;
     end;                              
  end if;
  
  dbms_output.put_line  
  (  
            format.align('SOAT N�' || floor(dbms_random.value(1, 10000)), 'CENTER', 100) ||
            chr(13)||chr(10) ||
            chr(13)||chr(10) ||
            format.align('DATOS DEL CLIENTE', 'LEFT', 100) ||
            chr(13)||chr(10) ||
            chr(13)||chr(10) ||
            format.align('Cliente: ' || v_clientname, 'LEFT', 100) ||
            chr(13)||chr(10) || 
            format.align('Dirección: ' || v_direccion, 'LEFT', 100)           
  );   
  dbms_output.put_line  
  (  
            format.repeat('________________________________________', 100) || 
            chr(13)||chr(10) 
  );   
  dbms_output.put_line  
  (  
            format.align('DATOS DE LA PÓ    LIZA', 'LEFT', 100) ||
            chr(13)||chr(10) ||
            chr(13)||chr(10) ||
            format.align('Póliza: ' || v_policy, 'LEFT', 100) ||
            chr(13)||chr(10) || 
            format.align('Prima: ' || v_prima, 'LEFT', 100) ||
            chr(13)||chr(10) || 
            format.align('Inicio Vigencia: ' || v_inivigencia, 'LEFT', 100) ||
            chr(13)||chr(10) || 
            format.align('Fin Vigencia: ' || v_finvigencia, 'LEFT', 100)          
  );    
  dbms_output.put_line  
  (  
            format.repeat('________________________________________', 100) || 
            chr(13)||chr(10) 
  );   
  dbms_output.put_line  
  (  
            format.align('DATOS DEL VEHICULO', 'LEFT', 100) ||
            chr(13)||chr(10) || chr(13)||chr(10) ||
            format.align('Vehiculo: ' || v_vehiculo, 'LEFT', 100) ||
            chr(13)||chr(10) ||
            format.align('Marca: ' || v_marca, 'LEFT', 50) || ' ' || 
            format.align('Modelo: ' || v_modelo, 'RIGHT', 50) || 
            chr(13)||chr(10) ||
            format.align('Año: ' || v_año, 'LEFT', 100) 
  ); 
end prd_muestra_reporte;   


