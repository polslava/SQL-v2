DECLARE
coords_map varchar(10000);
   coords_map1 varchar(4000);
   coords_map2 varchar(4000);
   coords_map2_1 varchar(4000);
   coords_map2_2 varchar(4000);
   coords_map3 varchar(4000);
   coords_map4 varchar(4000);
   coords_map5 varchar(4000);
   coords_map10 varchar(4000);

   coords_map_areas1 varchar(31000);

    coords_map0 clob;
BEGIN

select LISTAGG(coords, ' ')  WITHIN GROUP (ORDER BY order_num) as coords
into coords_map1
from table (ugh.pac_coords.get_coords_ts_1());
coords_map0:=coords_map0||to_clob(coords_map1);
select LISTAGG(coords, ' ')  WITHIN GROUP (ORDER BY order_num) as coords
into coords_map2
from table (ugh.pac_coords.get_coords_ts_2());
coords_map0:=coords_map0||to_clob(coords_map2);
select LISTAGG(coords, ' ')  WITHIN GROUP (ORDER BY order_num) as coords
into coords_map2_1
from table (ugh.pac_coords.get_coords_ts_2_1());
coords_map0:=coords_map0||to_clob(coords_map2_1);
select LISTAGG(coords, ' ')  WITHIN GROUP (ORDER BY order_num) as coords
into coords_map2_2
from table (ugh.pac_coords.get_coords_ts_2_2());
coords_map0:=coords_map0||to_clob(coords_map2_2);

select LISTAGG(coords, ' ')  WITHIN GROUP (ORDER BY order_num) as coords
into coords_map3
from table (ugh.pac_coords.get_coords_ts_3());
coords_map0:=coords_map0||to_clob(coords_map3);
select LISTAGG(coords, ' ')  WITHIN GROUP (ORDER BY order_num) as coords
into coords_map4
from table (ugh.pac_coords.get_coords_ts_4());
coords_map0:=coords_map0||to_clob(coords_map4);
select LISTAGG(coords, ' ')  WITHIN GROUP (ORDER BY order_num) as coords
into coords_map5
from table (ugh.pac_coords.get_coords_ts_5());
coords_map0:=coords_map0||to_clob(coords_map5);

select LISTAGG(coords, ' ')  WITHIN GROUP (ORDER BY order_num) as coords
into coords_map_areas1
from table (ugh.pac_coords_areas.get_coords_areas_2());
coords_map0:=coords_map0||to_clob(coords_map_areas1);

select LISTAGG(coords, ' ')  WITHIN GROUP (ORDER BY order_num) as coords
into coords_map10
from table (ugh.pac_coords.get_coords_ts_10());
coords_map0:=coords_map0||to_clob(coords_map10);

htp.p(coords_map0);

END;