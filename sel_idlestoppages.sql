/*
выборка оперативных простоев за текущую смену для PowerBI

"UGH"."V_IDLESTOPPAGES_CUR"
*/

select sel1.* 
, ust.name as stoppage_type
, usc.name as stoppage_category

, F_GET_HOURFROMDATE_T(sel1.timestop) as timestop_hour_t
, F_GET_HOURFROMDATE(sel1.timestop) as timestop_hour
, F_GET_DATESHIFTHOUR(sel1.timestop) as dateshift_hour
, f_get_shifthour_t (sel1.timestop)||'_'||F_GET_HOURFROMDATE_T(sel1.timestop) as dateshift_hour_t
, f_get_shiftnum(sel1.timestop) as shiftnum
, f_get_shiftdate(sel1.timestop) as shiftdate
from
(
        select distinct 
		isp.stopcounter as ID,  
		at.vehid as VehID, 
		isp.timestop as TimeStop, 
		nvl(isp.timego,sysdate) as TimeGo, 
		nvl2(isp.timego,isp.idlestoptype ,
		nvl(isp.idlestoptype,-1)) as TypeID, 
		nvl2(timego,idlestoptypeauto,-1) as TypeAuto, 
		Equipmentid ,
		nvl2(timego,nvl(drvstoptype,idlestoptypeauto),-1) as DriverStopID, note as Description, 
		Planned 
        ,round((isp.timego - isp.timestop)*60*24,1) as stop_time_min
    ,round((isp.timego - isp.timestop)*24,5) as stop_time_hour
		from dispatcher.idlestoppages isp 
	  inner JOIN 
        (select vehid as vehname,
           tsname as vehid
         from ugh.ALLVEHICLES_TS )at
         on at.vehname=isp.vehid
	 where     
	 ( isp.timestop between 
     /*:TimeFrom+(1/(24*60*60)) and :TimeTo */
     sysdate-1 and sysdate
     or isp.timego between 
     /*:TimeFrom and :TimeTo */
     sysdate-1 and sysdate
     or isp.timego is null ) and ((isp.timego - isp.timestop) >= 3 / 24 / 60 /*or isp.idlestoptype is not null or isp.timego is null*/)	 
) sel1
left join dispatcher.USERSTOPPAGETYPES ust on ust.code = sel1.typeid
left join dispatcher.USERSTOPPAGECATEGORIES usc on usc.id = ust.categoryid
where (sel1.timestop between
ugh.GetPredefinedTimeFrom ( /*:ParamDataFrom*/ 'за текущую смену' , 1 , SYSDATE, /*:ParamBeginPeriod*/ to_date(to_char(sysdate,'dd.mm.yyyy')||' 00:00:00','dd.mm.yyyy hh24:mi:ss')) 
AND ugh.GetPredefinedTimeTo ( /*:ParamDataFrom*/ 'за текущую смену' , 1 , SYSDATE, /*:ParamEndPeriod*/ sysdate)
or sel1.timego between
ugh.GetPredefinedTimeFrom ( /*:ParamDataFrom*/ 'за текущую смену' , 1 , SYSDATE, /*:ParamBeginPeriod*/ to_date(to_char(sysdate,'dd.mm.yyyy')||' 00:00:00','dd.mm.yyyy hh24:mi:ss')) 
AND ugh.GetPredefinedTimeTo ( /*:ParamDataFrom*/ 'за текущую смену' , 1 , SYSDATE, /*:ParamEndPeriod*/ sysdate))
and sel1.vehid in (select tsname from ugh.allvehicles_ts where vehtype = 'Самосвал')