   /*
выборка превышений гружённых самосвалов
19.02.2022
*/
/*
для отчёта 21 
SpeedViolations_20220219.xml
*/
   
   SELECT sd.VehID, sd.ViolTime, sd.Mins, sd.MaxSpeed, round(sd.mins*(sd.MaxSpeed + 35)/120, 2) as Length,  sd.Incline as Incline, sd.MAXRAZRESHSPEED
    , (case when v.weight is null then 0 else v.weight end) as weight
    FROM SpeedViolations sd
     left join vehtrips v
                on sd.vehid = v.vehid and
                    sd.VIOLTIME between v.timeload and v.timeunload
        WHERE
        sd.vehid like decode(:ParamVehID, 'Все', '%', :ParamVehID)
        and sd.VIOLTIME between
            to_date('01.02.2022 08:00','dd.mm.yyyy hh24:mi') and to_date('19.02.2022 20:00','dd.mm.yyyy hh24:mi')
            /*getpredefinedtimefrom(:ParamDataFrom, :ParamShift, :ParamDate, :ParamDateBegin)
            and getpredefinedtimeto(:ParamDataFrom, :ParamShift, :ParamDate, :ParamDateEnd)*/
        ORDER BY LENGTH(sd.VehID), sd.VehID, sd.ViolTime;