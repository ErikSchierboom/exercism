create or replace package numeral#
is
  function to_roman(input in pls_integer) return varchar2;
end numeral#;
 
create or replace package body numeral#
is
  function to_roman(input in pls_integer) return varchar2 is
  begin
    return TRIM(TO_CHAR(input, 'RN'));
  end;
end numeral#;
