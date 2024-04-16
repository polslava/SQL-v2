/*
выборка простоев за смену
используется в отчёте 19.4
*/
	  select s.*
      , (case when s.StoppagesTime<3 then '<3мин' else '>3мин' end) as longest
      from(
    Select  st.VehID,
               
               
               TO_CHAR(ss.TIMESTOP,'hh24'||chr(58)||'mi') as TIMESTOP,
               TO_CHAR(ss.TIMEGO,'hh24'||chr(58)||'mi') as TIMEGO,
               
               round((ss.TIMEGO-ss.TIMESTOP)*24*60,1) As StoppagesTime,
               round(NVL(ss.ENGINEWORKTIME,0)*60,1) as TimeWorkMotor,
               ust.NAME as stop_reason
               ,usc.name as stop_reason_category
            ,(case 
            when cast(to_char(ss.TIMESTOP, 'hh24') as number) /*&lt;*/< 8
            then to_char(ss.TIMESTOP-1, 'DD.mm.yyyy')
            else to_char(ss.TIMESTOP, 'DD.mm.yyyy') 
            end) as date_shift,
    (case 
            when cast(to_char(ss.TIMESTOP, 'hh24') as number)>7 and cast(to_char(ss.TIMESTOP, 'hh24') as number) /*&lt;*/< 20
            then 1
            else 2
            end) as shift
    from
     SHIFTSTOPPAGES ss
    left join ShiftTasks st on (st.VehID = ss.VehID
    AND st.Shift= ss.ShiftNum
    AND ss.SHIFTDATE=st.TaskDate)
    left join Dumptrucks d on d.VEHID = ss.VehID   
    left join UserStoppageTypes ust on ss.IDLESTOPTYPE=ust.CODE 
     /*join Constcodes cc on (cc.CODE = ust.STOPPAGESOWN
        AND cc.TABLENAME = 'StoppagesOwn')*/
	left join userstoppagecategories usc on ust.categoryid = usc.id
    
    Where timestop between :ParamDateBegin
         
            and :ParamDateEnd
    
    
    ) s
  
    ORDER BY s.Date_shift, s.shift, s.VehID, s.timestop;
