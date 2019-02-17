create or replace package format  
as  
  function align(p_str in varchar2, p_justify varchar2, p_size integer) return varchar2;  
  function repeat(p_str in varchar2, p_size integer) return varchar2;  
end;  
 