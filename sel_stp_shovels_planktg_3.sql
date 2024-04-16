/*выборка план-факт КТГ по экскаваторам*/

/*select 
taskday,replace(case when avg(ktg) between  0 and 1 then 
'0'||cast(avg(ktg) as varchar(4)) else cast(avg(ktg) as varchar(4)) end,',','.') as ktg,
 replace(case when avg(planktg) between  0 and 1  then 
 '0'||cast(avg(planktg) as varchar(4)) else cast(avg(planktg) as varchar(4)) end,',','.') as planktg,
  replace(case when avg(diff_ktg) between  0 and 1  then 
  '0'||cast(avg(diff_ktg) as varchar(4)) else cast(avg(diff_ktg) as varchar(4)) end,',','.') as diff_ktg
from (*/
select sel1.taskday, round(avg(sel1.ktg),0) as ktg, round(avg(sel1.planktg),0) as planktg,round(avg(sel1.diff_ktg),0) as diff_ktg
from(
select round(avg(ktg)*100,0) as ktg
, round(avg(planktg)*100,0) as planktg
, round(round(avg(planktg)-avg(ktg),2)*100,0) as diff_ktg 
, cast(to_char(stp.taskdate,'dd') as number) as taskday
from UGH.v_stp_shovel_planfact_1m stp
where vehid in ('PC-2000 №1', 'PC-2000 №2', 'PC-2000 №3', 'САТ-992K')
group by stp.taskdate
/*)
group by taskday
order by taskday*/
) sel1
group by taskday