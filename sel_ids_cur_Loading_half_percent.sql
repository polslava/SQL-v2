/*
Выборка план-факт простоя Погрузка по получасам
*/
select sel1.*
, round(sel1.stop_time_hour/sel1.stop_loading_norm,2) as stop_loading_percent
from (
select ids_load.*
    , vtl.stop_loading as stop_loading_norm
    
    from ugh.v_ids_cur_loading_half ids_load
    left join ugh.v_vehtrips_loading_half vtl
        on vtl.shifthour_half_t = ids_load.shifthour_half_t
    ) sel1