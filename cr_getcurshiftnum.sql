create or replace FUNCTION     getcurshiftnum
(
    p_ShiftFromCurShift IN NUMBER,
    p_Date IN DATE DEFAULT SYSDATE,
    p_PredifinateShiftLen IN NUMBER DEFAULT 12
 ) 
    RETURN  NUMBER  --varchar2
AS

    v_CurDate DATE;
    v_PureCurDate DATE;

BEGIN

 /*переход с 01.04.2024 на новую сменность*/
    if p_Date<=TO_date('31.03.2024 19:59:00','dd.mm.yyyy hh24:mi:ss') then
    if (p_Date-TO_DATE(TO_CHAR(p_Date,'dd.mm.yyyy'),'dd.mm.yyyy'))>=1/3 and (p_Date-TO_DATE(TO_CHAR(p_Date,'dd.mm.yyyy'),'dd.mm.yyyy'))<5/6 
        then return 1-- ||' от '||TO_CHAR(p_Date,'dd.mm.yyyy')
        ;
        else return 2 -- ||' от '||TO_CHAR(p_Date,'dd.mm.yyyy')
        ;
    end if;
    else
    if cast(TO_CHAR(p_Date,'hh24') as number) between 8 and 19 
        then return 2 --||' от '||TO_CHAR(p_Date,'dd.mm.yyyy')
        ;
        else return 1 -- ||' от '||TO_CHAR(p_Date,'dd.mm.yyyy')
        ;
    end if;
    end if;     
      
END;