/*
sel_stoppages.sql -- выборка простоев по результатам смены
*/

/*
20211230 - исправление запроса
*/
      Select  ShiftTasks.VehID,
               
               /*SHIFTSTOPPAGES.SHOVIDAUTO as SHOVID, */
               TO_CHAR(TIMESTOP,'hh24.mi') as TIMESTOP,
               TO_CHAR(TIMEGO,'hh24.mi') as TIMEGO,
               /*KEM_HOURSTOTIMESTRING((TIMEGO-TIMESTOP)*24) As StoppagesTime,*/
               round((TIMEGO-TIMESTOP)*24*60,1) As StoppagesTime,
               round(NVL(ENGINEWORKTIME,0)*60,1) as TimeWorkMotor,
               NAME
               /*,
               Constcodes.VALUE as StoppagesOwn*/
               
            ,(case 
            when cast(to_char(TIMESTOP, 'hh24') as number)<8
            then to_char(TIMESTOP-1, 'DD.mm.yyyy')
            else to_char(TIMESTOP, 'DD.mm.yyyy') 
            end) as date_shift,
    (case 
            when cast(to_char(TIMESTOP, 'hh24') as number)>7 and cast(to_char(TIMESTOP, 'hh24') as number)<20
            then 1
            else 2
            end) as shift
    from
         /* (
           SELECT :ParamDate AS SDate, 
                  :ParamShift AS SShift,
              :ParamDataFrom as SPredefinedType 
           FROM Dual
     ),*/
        ShiftTasks,SHIFTSTOPPAGES,UserStoppageTypes,Dumptrucks,Constcodes
    Where 
    
    /*ShiftTasks.Shift= DECODE( SPredefinedType, 
            'за текущую смену' , GetCurShiftNum (0),
            'за предыдущую смену' , GetCurShiftNum (-1) ,
            SShift )
    AND ShiftTasks.TaskDate = DECODE( SPredefinedType , 
            'за текущую смену', GetCurShiftDate (0) ,
            'за предыдущую смену', GetCurShiftDate (-1) ,
            SDate )*/
            timestop between :ParamDateBegin
            /*to_date('25.12.2021 08:00:00', 'DD.mm.yyyy hh24:mi:ss')*/
            and :ParamDateEnd
            /*to_date('26.12.2021 20:00:00', 'DD.mm.yyyy hh24:mi:ss')*/
            
    
    AND ShiftTasks.VehID = SHIFTSTOPPAGES.VehID
    AND ShiftTasks.Shift= SHIFTSTOPPAGES.ShiftNum
    AND Dumptrucks.VEHID = SHIFTSTOPPAGES.VehID    
    AND SHIFTSTOPPAGES.IDLESTOPTYPE=UserStoppageTypes.CODE (+)
    AND SHIFTSTOPPAGES.SHIFTDATE=ShiftTasks.TaskDate
    AND Constcodes.TABLENAME(+) = 'StoppagesOwn'
    AND Constcodes.CODE(+) = STOPPAGESOWN
  
    ORDER BY ShiftTasks.VehID,
        shiftstoppages.timestop;
