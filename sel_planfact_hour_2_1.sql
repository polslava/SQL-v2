/*
выборка план-факт объёмов экскаваторов в час смены
общая продолжительность смены 10,5 часов
*/

select sel1.*

, s1.plan_hour
, round(sel1.fact_volume/s1.plan_hour,2)*100 as fact_percent
from (
SELECT f_get_shifthour(vt.timeload) as shifthour
,f_get_hourfromdate(vt.timeload) as timeload_hour
,f_get_shifthour_t(vt.timeload) as shifthour_t
,f_get_hourfromdate_t(vt.timeload) as timeload_hour_t
,f_get_shifthour_t(vt.timeload)||'_'||f_get_hourfromdate_t(vt.timeload) as hour_t
, round(sum((vt.weight)/2.74),1) As fact_volume
    , vt.shovid
from ugh.v_vehtrips vt
group by f_get_shifthour(vt.timeload),f_get_hourfromdate(vt.timeload), vt.shovid
,f_get_shifthour_t(vt.timeload) 
,f_get_hourfromdate_t(vt.timeload)
,f_get_shifthour_t(vt.timeload)||'_'||f_get_hourfromdate_t(vt.timeload)
order by f_get_shifthour(vt.timeload)) sel1
left join (select round((s.plan_volume)/10.5,1) as plan_hour, s.shovid
from v_shovels_in_shift_planfact s
--group by s.shovid
)  s1
    on s1.shovid = sel1.shovid
