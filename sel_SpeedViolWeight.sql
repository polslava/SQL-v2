/*
выборка превышений гружённых самосвалов
19.02.2022
*/

/*
для отчёта 21.1
GMap_SpeedViolHistory_20220219.xml
*/

select  
			sd.VEHID as DoID,
			to_char(sd.VIOLTIME,'dd.mm.yy hh24.mi.ss') RecTime,
			sd.VIOLTIME DoTime,
			sd.X DoX, sd.Y DoY,5 DoObjType,
			sd.VehID || '*' || 'Превышения скорости ' || sd.MAXSPEED || ' км./ч.' || ' Разрешённая скорость ' || sd.MAXRAZRESHSPEED || ' км./ч.' DoInfo,
			'Превышения скорости '  || sd.MAXSPEED || ' км./ч.' || ' Разрешённая скорость ' || sd.MAXRAZRESHSPEED || ' км./ч.'  EventDescr,
			'Превышения скорости' EventGroupStr
            , (case when v.weight is null then 0 else v.weight end) as weight
			from
			SPEEDVIOLATIONS sd
            left join vehtrips v
                on sd.vehid = v.vehid and
                    sd.VIOLTIME between v.timeload and v.timeunload
                    
			where sd.VIOLTIME between  to_date('01.02.2022 08:00','dd.mm.yyyy hh24:mi') and to_date('19.02.2022 20:00','dd.mm.yyyy hh24:mi')
            /*GetPredefinedTimeFrom('за указанную смену', :ParamShift, :ParamDate) and GetPredefinedTimeTo('за указанную смену', :ParamShift, :ParamDate)*/
			order by sd.vehid, sd.VIOLTIME;