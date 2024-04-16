/*
������� �������� ���������� �� �����
����������� ��� ���
*/
  select 
    stp.vehid,
    stp.timestop,
    round((stp.timego - stp.timestop)*24, 2) as duration,
   -- dispatcher.kem_hourstotimestring((stp.timego - stp.timestop)*24) as stringduration,
    stp.timego,
    nvl(t.name, '�����.') as stoptype,
    nvl(C.NAME, '�����.') as stopcategory,
    nvl(fuelstop, 0) as fuelstop,
    nvl(fuelgo, 0) as fuelgo
from dispatcher.shiftstoppages stp
left join 
(
select vehid, timestop, timego, max(fuelstop) as fuelstop, max(fuelgo) as fuelgo from dispatcher.idlestoppages
where /*vehid like decode(:ParamVehID, '���', '%', :ParamVehID)
and */
        TIMEstop between
            /*getpredefinedtimefrom(:ParamDataFrom, :ParamShift, :ParamDate, :ParamDateBegin)
            and getpredefinedtimeto(:ParamDataFrom, :ParamShift, :ParamDate, :ParamDateEnd)*/
            to_date('01'||to_char(sysdate, 'mm.yyyy'),'dd.mm.yyyy')
            and sysdate+1
group by vehid, timestop, timego)
idl on IDL.TIMESTOP = stp.timestop and idl.timego = stp.timego and idl.vehid = stp.vehid
left join dispatcher.userstoppagetypes t on T.CODE = STP.IDLESTOPTYPE
left join dispatcher.USERSTOPPAGECATEGORIES c on C.ID = T.CATEGORYID
where 
       /* stp.vehid like decode(:ParamVehID, '���', '%', :ParamVehID)
        and */
        stp.TIMEstop between
            /*getpredefinedtimefrom(:ParamDataFrom, :ParamShift, :ParamDate, :ParamDateBegin)
            and getpredefinedtimeto(:ParamDataFrom, :ParamShift, :ParamDate, :ParamDateEnd)*/
            
            to_date('01'||to_char(sysdate, 'mm.yyyy'),'dd.mm.yyyy')
            and sysdate+1
          and dispatcher.t.code not in (913)
          and dispatcher.c.name in ('�����������')
order by timestop, length(vehid), vehid;
          
          
          
         
