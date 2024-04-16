create or replace FUNCTION     Getpredefinedtimefrom (
    p_PredefinedType IN VARCHAR2,
    p_Shift IN NUMBER DEFAULT 1,
    p_Date IN DATE DEFAULT SYSDATE,
    p_DateTimeFrom IN DATE DEFAULT SYSDATE) RETURN DATE AS

  v_DefaultShiftLen NUMBER;
  --v_DateBegin DATE;

 -- v_CurDate DATE;
  v_PureCurDate DATE;
  v_ThisShift NUMBER;

 --  v_CurentShiftBegin DATE;
 -- v_CurentShiftEnd DATE;
 -- v_MinShiftNum NUMBER;

 /* CURSOR c_CURENTSHIFT_FORSHIFTLEN IS SELECT *
  FROM SHIFTCODES WHERE (SHIFTCODES.SHIFTEND - SHIFTCODES.SHIFTBEGIN)*24 = v_DefaultShiftLen
  ORDER BY SHIFTCODES.SHIFTBEGIN;*/

BEGIN
 -- v_DefaultShiftLen := Params.getnumparameter ('ѕродолжительность смены по умолчанию');


 -- SELECT (SHIFTCODES.SHIFTEND-SHIFTCODES.SHIFTBEGIN)*24 INTO v_DefaultShiftLen FROM SHIFTCODES WHERE SHIFTCODES.SHIFTCODE = p_Shift;
    v_DefaultShiftLen:=12;

   IF p_PredefinedType = 'за указанный интервал' THEN
 return p_DateTimeFrom;
   END IF;

   IF p_PredefinedType = 'за текущую смену' THEN
      v_PureCurDate := UGH.Getcurshiftdate(0,SYSDATE,v_DefaultShiftLen);
   v_ThisShift := UGH.Getcurshiftnum(0,SYSDATE,v_DefaultShiftLen);
   ELSIF p_PredefinedType = 'за предыдущую смену' THEN



    v_PureCurDate := UGH.Getcurshiftdate(0,SYSDATE,v_DefaultShiftLen);
     v_ThisShift := UGH.Getcurshiftnum(0,SYSDATE,v_DefaultShiftLen);

 /*  SELECT SHIFTCODES.SHIFTCODE INTO v_MinShiftNum
     FROM
       (
       SELECT MIN(SHIFTCODES.SHIFTBEGIN) AS SHBEGIN FROM SHIFTCODES WHERE (SHIFTCODES.SHIFTEND - SHIFTCODES.SHIFTBEGIN)*24 = v_DefaultShiftLen
        ) sel1, SHIFTCODES
     WHERE (SHIFTCODES.SHIFTEND - SHIFTCODES.SHIFTBEGIN)*24 = v_DefaultShiftLen
      AND SHIFTCODES.SHIFTBEGIN = sel1.SHBEGIN;*/


  v_ThisShift := v_ThisShift - 1;

  IF v_ThisShift <  1 THEN

        v_PureCurDate := v_PureCurDate-1;
        v_ThisShift:=2;
    
  end if;   

 

--  END IF;

   ELSIF p_PredefinedType = 'за указанную смену' THEN
    v_PureCurDate := TO_DATE (TO_CHAR (p_Date, 'dd.mm.yyyy'), 'dd.mm.yyyy');
    v_ThisShift := p_Shift;
   END IF;

 /*переход с 01.04.2024 на новую сменность*/
 if p_Date<=TO_date('31.03.2024 19:59:00','dd.mm.yyyy hh24:mi:ss') then
   if v_ThisShift=1 then
     v_PureCurDate:= (v_PureCurDate) + 1/3;
   else
     v_PureCurDate:= (v_PureCurDate) + 20/24;
   end if;
else
   if v_ThisShift=1 
    then
     v_PureCurDate:= (v_PureCurDate) - 4/24; --20:00 смена 1
   else
     v_PureCurDate:= (v_PureCurDate) + 8/24; --08:00 смена 2
   end if; 
end if;
  /* FOR v_gt IN c_CURENTSHIFT_FORSHIFTLEN LOOP

 -- '01.01.1900 20:00:00'

    v_CurentShiftBegin := (v_PureCurDate) +  (v_gt.SHIFTBEGIN - TO_DATE('01.01.1900','dd.mm.yyyy'));
    v_CurentShiftEnd := (v_PureCurDate) +  (v_gt.SHIFTEND - TO_DATE('01.01.1900','dd.mm.yyyy'));

    IF v_gt.SHIFTCODE = v_ThisShift   THEN
          RETURN v_CurentShiftBegin;
       END IF;

   END LOOP;*/


  RETURN  v_PureCurDate;


END;