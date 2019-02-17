create or replace package body format  
as  
  function align(p_str in varchar2, p_justify varchar2, p_size integer)  
  return varchar2  
  is  
    l_str    varchar2(4000);  
    l_temp   number;  
    l_temp_1 number;  
    l_left   number;  
    l_right  number;  
  begin  
    case p_justify  
      when 'RIGHT' then  
        l_str := lpad(p_str, p_size);  
      when 'LEFT' then  
        l_str := rpad(p_str, p_size);  
      when 'CENTER' then  
        l_temp   := p_size - length(p_str);  
        l_temp_1 := l_temp/2;  
        l_left   := floor(l_temp_1);  
        l_right  := ceil (l_temp_1);  
  
        l_str := lpad(' ', l_left) || p_str || rpad(' ', l_right);  
      else  
        raise_application_error(-20001, 'Invalid parameter for p_justify specified -- ' || p_justify);  
    end case;  
  
    return l_str;  
  end;  
  
  function repeat(p_str in varchar2, p_size integer)   
  return varchar2  
  is  
  begin  
    return rpad(p_str, p_size, p_str);  
  end;  
end;    

  