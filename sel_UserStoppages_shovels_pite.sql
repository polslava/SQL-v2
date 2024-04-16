select s.VehID, s.TIMESTOP, s.TIMEGO, s.StoppagesTime, s.TimeWorkMotor
 , (case when s.stop_reason = '��������_���������' 

  or (s.stop_reason = '��������_��������' and s.StoppagesTime < /*&lt;*/ 3) /*��� ��������� 20230422*/
then null else s.stop_reason end) as stop_reason                     /*��� ��������� 20230420*/
 , (case when s.stop_reason = '��������_���������' 
  or (s.stop_reason = '��������_��������' and s.StoppagesTime < /*&lt;*/ 3) /*��� ��������� 20230422*/
then null else s.stop_reason_category end) as stop_reason_category   /*��� ��������� 20230420*/
 , s.date_shift, s.shift
      , (case when s.StoppagesTime < /*&lt;*/ 3 then '����� 3���' else '����� 3���' end) as longest
, round(s.StoppagesTime/60,7) as StoppagesTime_hour
      from(
    Select  ss.VehID,
               
               
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
     dispatcher.SHIFTSTOPPAGES ss
    /*left join dispatcher.ShiftTasks st on (st.VehID = ss.VehID
    AND st.Shift= ss.ShiftNum
    AND ss.SHIFTDATE=st.TaskDate)*/
    left join dispatcher.Dumptrucks d on d.VEHID = ss.VehID   
    left join dispatcher.UserStoppageTypes ust on ss.IDLESTOPTYPE=ust.CODE 
     /*join Constcodes cc on (cc.CODE = ust.STOPPAGESOWN
        AND cc.TABLENAME = 'StoppagesOwn')*/
	left join dispatcher.userstoppagecategories usc on ust.categoryid = usc.id
    
    Where timestop between 
    sysdate-93 and sysdate
    /*:ParamDateBegin
            and :ParamDateEnd*/
    and ss.vehid not like ('%���-725%')
    
    ) s
  
    ORDER BY s.Date_shift, s.shift, s.VehID, s.timestop;