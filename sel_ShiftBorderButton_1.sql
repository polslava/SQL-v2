/*
20221206 выборка нажатий кнопок "Начало/Конец смены" только за текущую смену
*/
			select sel1.*, TO_CHAR(time,'dd.mm.yyyy hh24.mi.ss') as TimeStr
			from
			(
			select  EVENTSTATEARCHIVE.VEHID,  EVENTSTATEARCHIVE.TIME,  decode(EVENTSTATEARCHIVE.EVENTTYPE,11,'Начало смены',14,'Окончание смены') as ShiftDescr, 'Самосвал' as VehType
			from eventstatearchive
			where ((EVENTSTATEARCHIVE.TIME between --GetPredefinedTimeFrom ( :ParamDataFrom , :ParamShift , :ParamDate ) - 1/24 and  GetPredefinedTimeFrom ( :ParamDataFrom , :ParamShift , :ParamDate ) + 1/24)
                dispatcher.GetPredefinedTimeFrom (  'за текущую смену' , 1 , SYSDATE,  to_date(to_char(sysdate,'dd.mm.yyyy')||' 00:00:00','dd.mm.yyyy hh24:mi:ss')) - 1/24
                    AND dispatcher.GetPredefinedTimeTo (  'за текущую смену' , 1 , SYSDATE,  sysdate)+ 1/24)
			--or  (EVENTSTATEARCHIVE.TIME between GetPredefinedTimeTo ( :ParamDataFrom , :ParamShift , :ParamDate ) - 1/24 and  GetPredefinedTimeTo ( :ParamDataFrom , :ParamShift , :ParamDate ) + 1/24))
              
                    )
			and EVENTSTATEARCHIVE.EVENTTYPE In (11,14)
			union
			select  SHOVEVENTSTATEARCHIVE.SHOVID as VEHID,  SHOVEVENTSTATEARCHIVE.TIME,  decode(SHOVEVENTSTATEARCHIVE.EVENTTYPE,11,'Начало смены',14,'Окончание смены') as ShiftDescr, 'Экскаватор' as VehType
			from SHOVEVENTSTATEARCHIVE
			where ((SHOVEVENTSTATEARCHIVE.TIME between --GetPredefinedTimeFrom ( :ParamDataFrom , :ParamShift , :ParamDate ) - 1/24 and  GetPredefinedTimeFrom ( :ParamDataFrom , :ParamShift , :ParamDate ) + 1/24)
                    dispatcher.GetPredefinedTimeFrom (  'за текущую смену' , 1 , SYSDATE,  to_date(to_char(sysdate,'dd.mm.yyyy')||' 00:00:00','dd.mm.yyyy hh24:mi:ss')) - 1/24
                    AND dispatcher.GetPredefinedTimeTo (  'за текущую смену' , 1 , SYSDATE,  sysdate)+ 1/24)
			--or  (SHOVEVENTSTATEARCHIVE.TIME between GetPredefinedTimeTo ( :ParamDataFrom , :ParamShift , :ParamDate ) - 1/24 and  GetPredefinedTimeTo ( :ParamDataFrom , :ParamShift , :ParamDate ) + 1/24)
            )
			and SHOVEVENTSTATEARCHIVE.EVENTTYPE In (11,14)
			union
			select  AUXEVENTARCHIVE.AUXID as VEHID,  AUXEVENTARCHIVE.TIME,  decode(AUXEVENTARCHIVE.EVENTTYPE,11,'Начало смены',14,'Окончание смены') as ShiftDescr, 'Бульдозер' as VehType
			from AUXEVENTARCHIVE
			where ((AUXEVENTARCHIVE.TIME between --GetPredefinedTimeFrom ( :ParamDataFrom , :ParamShift , :ParamDate ) - 1/24 and  GetPredefinedTimeFrom ( :ParamDataFrom , :ParamShift , :ParamDate ) + 1/24)
                     dispatcher.GetPredefinedTimeFrom (  'за текущую смену' , 1 , SYSDATE,  to_date(to_char(sysdate,'dd.mm.yyyy')||' 00:00:00','dd.mm.yyyy hh24:mi:ss')) - 1/24
                    AND dispatcher.GetPredefinedTimeTo (  'за текущую смену' , 1 , SYSDATE,  sysdate)+ 1/24)
			--or  (AUXEVENTARCHIVE.TIME between GetPredefinedTimeTo ( :ParamDataFrom , :ParamShift , :ParamDate ) - 1/24 and  GetPredefinedTimeTo ( :ParamDataFrom , :ParamShift , :ParamDate ) + 1/24)
            )
			and AUXEVENTARCHIVE.EVENTTYPE In (11,14)
			) sel1
			order by VehType, vehid, time;