 /*выборка простоев бурстанков за завершённые смены*/
 /*
 моя разработка Ступин В.С. 20240328
 */
 
 /*
 моя доработка Ступин В.С. 20240328
 доработатка: 
 1) для схемы UGH
 2) для сортировки ПТО
 */
 select s.rigID, 
 s.rigname,
s.reportorder_pto,
 s.TIMESTOP_time,
 s.TIMESTOP, s.TIMEGO, s.StoppagesTime, s.TimeWorkMotor
 , 
s.stop_reason 
 ,
s.stop_reason_category 
 , s.date_shift, s.shift
      , (case when s.StoppagesTime < /*&lt;*/ 3 then 'менее 3мин' else 'более 3мин' end) as longest
, round(s.StoppagesTime/60,7) as StoppagesTime_hour
      from(
    Select  st.rigID,
               --r.rigname,
                av.tsname as rigname,
                ev.reportorder_pto,
               ss.TIMESTOP as TIMESTOP_time,
               TO_CHAR(ss.TIMESTOP,'hh24'||chr(58)||'mi'||chr(58)||'ss') as TIMESTOP,
               TO_CHAR(ss.TIMEGO,'hh24'||chr(58)||'mi'||chr(58)||'ss') as TIMEGO,
               
               round((ss.TIMEGO-ss.TIMESTOP)*24*60,1) As StoppagesTime,
               round(NVL(ss.ENGINEWORKTIME,0)*60,1) as TimeWorkMotor,
               ust.NAME as stop_reason
               ,usc.name as stop_reason_category
            ,(case 
            when cast(to_char(ss.TIMESTOP, 'hh24') as number) < /*&lt;*/ 8
            then to_char(ss.TIMESTOP-1, 'DD.mm.yyyy')
            else to_char(ss.TIMESTOP, 'DD.mm.yyyy') 
            end) as date_shift,
    (case 
            when cast(to_char(ss.TIMESTOP, 'hh24') as number)>7 and cast(to_char(ss.TIMESTOP, 'hh24') as number) < /*&lt;*/ 20
            then 1
            else 2
            end) as shift
    from
     rigs.SHIFTSTOPPAGES ss
    left join rigs.ShiftTasks_v2 st on (st.rigID = ss.VehID
    AND st.Shift= ss.ShiftNum
    AND ss.SHIFTDATE=st.Task_Date)
    left join rigs.rigs r on r.rigid = ss.VehID   
    left join rigs.UserStoppageTypes ust on ss.IDLESTOPTYPE=ust.CODE 
  
	left join rigs.userstoppagecategories usc on ust.categoryid = usc.id
    left join ugh.ALLVEHICLES_TS@pitev2 av on r.rigname = av.vehid and av.vehtype='Бурстанок'
    left join ugh.enterprise_veh@pitev2 ev on r.rigname = ev.vehid and ev.vehtype='Бурстанок'
    Where timestop between /*:ParamDateBegin
         
            and :ParamDateEnd*/
    
                ugh.getpredefinedtimefrom('за указанную смену',ugh.Getcurshiftnum(0,timestop+8/24,12),ugh.Getcurshiftdate(0,timestop+8/24,12)) 
            and
                ugh.getpredefinedtimeTo('за указанную смену',ugh.Getcurshiftnum(0,timego+8/24,12),ugh.Getcurshiftdate(0,timego+8/24,12))
    ) s
  
    ORDER BY s.timestop_time desc, s.Date_shift, s.shift, s.rigID ;      
