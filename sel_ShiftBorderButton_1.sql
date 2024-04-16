/*
20221206 ������� ������� ������ "������/����� �����" ������ �� ������� �����
*/
			select sel1.*, TO_CHAR(time,'dd.mm.yyyy hh24.mi.ss') as TimeStr
			from
			(
			select  EVENTSTATEARCHIVE.VEHID,  EVENTSTATEARCHIVE.TIME,  decode(EVENTSTATEARCHIVE.EVENTTYPE,11,'������ �����',14,'��������� �����') as ShiftDescr, '��������' as VehType
			from eventstatearchive
			where ((EVENTSTATEARCHIVE.TIME between --GetPredefinedTimeFrom ( :ParamDataFrom , :ParamShift , :ParamDate ) - 1/24 and  GetPredefinedTimeFrom ( :ParamDataFrom , :ParamShift , :ParamDate ) + 1/24)
                dispatcher.GetPredefinedTimeFrom (  '�� ������� �����' , 1 , SYSDATE,  to_date(to_char(sysdate,'dd.mm.yyyy')||' 00:00:00','dd.mm.yyyy hh24:mi:ss')) - 1/24
                    AND dispatcher.GetPredefinedTimeTo (  '�� ������� �����' , 1 , SYSDATE,  sysdate)+ 1/24)
			--or  (EVENTSTATEARCHIVE.TIME between GetPredefinedTimeTo ( :ParamDataFrom , :ParamShift , :ParamDate ) - 1/24 and  GetPredefinedTimeTo ( :ParamDataFrom , :ParamShift , :ParamDate ) + 1/24))
              
                    )
			and EVENTSTATEARCHIVE.EVENTTYPE In (11,14)
			union
			select  SHOVEVENTSTATEARCHIVE.SHOVID as VEHID,  SHOVEVENTSTATEARCHIVE.TIME,  decode(SHOVEVENTSTATEARCHIVE.EVENTTYPE,11,'������ �����',14,'��������� �����') as ShiftDescr, '����������' as VehType
			from SHOVEVENTSTATEARCHIVE
			where ((SHOVEVENTSTATEARCHIVE.TIME between --GetPredefinedTimeFrom ( :ParamDataFrom , :ParamShift , :ParamDate ) - 1/24 and  GetPredefinedTimeFrom ( :ParamDataFrom , :ParamShift , :ParamDate ) + 1/24)
                    dispatcher.GetPredefinedTimeFrom (  '�� ������� �����' , 1 , SYSDATE,  to_date(to_char(sysdate,'dd.mm.yyyy')||' 00:00:00','dd.mm.yyyy hh24:mi:ss')) - 1/24
                    AND dispatcher.GetPredefinedTimeTo (  '�� ������� �����' , 1 , SYSDATE,  sysdate)+ 1/24)
			--or  (SHOVEVENTSTATEARCHIVE.TIME between GetPredefinedTimeTo ( :ParamDataFrom , :ParamShift , :ParamDate ) - 1/24 and  GetPredefinedTimeTo ( :ParamDataFrom , :ParamShift , :ParamDate ) + 1/24)
            )
			and SHOVEVENTSTATEARCHIVE.EVENTTYPE In (11,14)
			union
			select  AUXEVENTARCHIVE.AUXID as VEHID,  AUXEVENTARCHIVE.TIME,  decode(AUXEVENTARCHIVE.EVENTTYPE,11,'������ �����',14,'��������� �����') as ShiftDescr, '���������' as VehType
			from AUXEVENTARCHIVE
			where ((AUXEVENTARCHIVE.TIME between --GetPredefinedTimeFrom ( :ParamDataFrom , :ParamShift , :ParamDate ) - 1/24 and  GetPredefinedTimeFrom ( :ParamDataFrom , :ParamShift , :ParamDate ) + 1/24)
                     dispatcher.GetPredefinedTimeFrom (  '�� ������� �����' , 1 , SYSDATE,  to_date(to_char(sysdate,'dd.mm.yyyy')||' 00:00:00','dd.mm.yyyy hh24:mi:ss')) - 1/24
                    AND dispatcher.GetPredefinedTimeTo (  '�� ������� �����' , 1 , SYSDATE,  sysdate)+ 1/24)
			--or  (AUXEVENTARCHIVE.TIME between GetPredefinedTimeTo ( :ParamDataFrom , :ParamShift , :ParamDate ) - 1/24 and  GetPredefinedTimeTo ( :ParamDataFrom , :ParamShift , :ParamDate ) + 1/24)
            )
			and AUXEVENTARCHIVE.EVENTTYPE In (11,14)
			) sel1
			order by VehType, vehid, time;