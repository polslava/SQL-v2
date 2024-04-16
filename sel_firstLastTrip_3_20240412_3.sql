select sel2.*
, round((sel2.FirstLoad-GetShiftStartTime(getpredefinedtimefrom('за указанную смену',sel2.shiftnum,sel2.shiftdate), 12))*24*60,1) as dif_FirstLoad
, round((ugh.GetShiftFinishTime_shovel(sel2.LastLoad, 12)-sel2.LastLoad)*24*60,1) as dif_LastLoad
from(
	SELECT sel1.shovid, sel1.shiftnum, sel1.shiftdate
    ,MIN(sel1.TIMELOAD) as FirstLoad,
 	MAX(sel1.TIMELOAD)+(5/60)/24 as LastLoad,
  	sum(1) as Trips
	from (
    SELECT v.SHOVID,
    v.TIMELOAD,
    ugh.getcurshiftnum_shovel(0, v.TIMELOAD) as shiftnum
    , to_char(ugh.getcurshiftdate_shovel(0, v.TIMELOAD),'dd.mm.yyyy') as shiftdate
 	, getpredefinedtimefrom('за указанную смену',:ParamShiftBegin,:ParamDateBegin)
    ,ugh.GetShiftFinishTime_shovel('за указанную смену',:ParamShiftEnd,:ParamDateEnd)
 	FROM ugh.V_VEHTRIPS_MOTH_3M v

	WHERE v.TIMELOAD BETWEEN 
        getpredefinedtimefrom('за указанную смену',:ParamShiftBegin,:ParamDateBegin)
	AND getpredefinedtimeto('за указанную смену',:ParamShiftEnd,:ParamDateEnd)-(1/24)
	group by v.SHOVID, v.TIMELOAD
	order by LENGTH(v.SHOVID),v.SHOVID
	)sel1
    group by sel1.shovid, sel1.shiftnum, sel1.shiftdate
    )sel2
    ;
