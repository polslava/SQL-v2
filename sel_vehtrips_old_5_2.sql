/*
sel_vehtrips_old_5_1.sql

выборка автоматических рейсов самосвалов
*/

/*
20211229 - добавление параметров
20211230 - переработка дня смены в дату смены, так как день бывает равен 0, а дата - нет
*/

select * from
(select 
    vehid, /*Имя самосвала*/
    tripnum, /*номер рейса в периоде*/
    shovid, /*Имя экскаватора*/
    to_char(
        nvl((select max(timestop) from shiftstoppages st where st.vehid = v1.vehid and st.timestop < v1.timestop and st.timestop > prevtimeload_1 and st.idlestoptype = 155), v1.timestop)
        , 'DD.mm.yyyy hh24:mi:ss')
        as TimeIdle_Load, /*начало простоя в ожидании погрузки*/
    TimeArriveToLoad, /*начало ожидания под погрузкой */
    timeload, /*начало погрузки*/
    timeloading, /*продолжительность погрузки*/
    length, /*пробег гружённым*/
    factweight, /*вес факт*/
    normweight, /*вес норма*/
    worktype, /*вид работ*/
    unloadid, /*пукнт разгрузки*/
    timeunload, /*начало разгрузки*/
    timeunloading, /*продолжительность разгрузки*/
    fuelload, /*топливо на начало рейса*/
    fuelunload, /*топливо на конец рейса*/
    tripcounter /*номер рейса в БД*/
    ,UNLOADLENGTH /*пробег порожним*/
    ,LOADTYPE /*вид груза*/
    ,MOVETIME /*время на рейсе*/
    ,LOADHEIGHT /*горизонт погрузки, пока часто 0*/
    ,UNLOADHEIGHT /*горизонт разгрузки*/
    , avspeed /*Средняя скорость за рейс*/
    , GroosRoute  /*Грузооборот*/
    , VolumeFact  /*Объём факт*/
    , VolumeNorm  /*Объём норма*/

    ,date_shift
    ,shift

from
(  
 select
      v.tripcounter, 
      v.VEHID as VehID,  
      sum(1) over (partition by v.vehid order by v.timeload) as tripnum,         
      v.shovid as  ShovID,
      
      /*to_char(v.timeload, 'DD.mm.yyyy hh24:mi:ss') as TimeArriveToLoad, *//*проверить точность определения: --есть постановка под ковш*/
      to_char(v.TimeLoad, 'DD.mm.yyyy hh24:mi:ss') as TimeLoad,
      cast(to_char(v.TimeLoad, 'DD') as number) as day_trip,
      cast(to_char(v.TimeLoad, 'hh24') as number) as hour_trip,
      (case 
            when cast(to_char(v.TimeLoad, 'hh24') as number)<8
            then to_char(v.TimeLoad-1, 'DD.mm.yyyy')
            else to_char(v.TimeLoad, 'DD.mm.yyyy') 
            end) as date_shift,
    (case 
            when cast(to_char(v.TimeLoad, 'hh24') as number)>7 and cast(to_char(v.TimeLoad, 'hh24') as number)<20
            then 1
            else 2
            end) as shift,
            
      to_char(lag(v.timeload) over (partition by v.vehid order by V.TIMELOAD), 'DD.mm.yyyy hh24:mi:ss')  as PrevTimeLoad,   
      lag(v.timeload) over (partition by v.vehid order by V.TIMELOAD) as PrevTimeLoad_1,
      --KEM_HOURSTOTIMESTRING((st1.timego - st1.timestop)*24) as TimeLoading, /*переделать во время*/
        nvl(round((st1.timego - st1.timestop)*24*60,2),0) as TimeLoading,
      v.Length, /*пробег гружённым*/

      Weight as FactWeight, 
      NORMS.TRIP_WEIGHT(v.shovid, v.vehid, v.worktype, v.unloadid, V.LENGTH, v.timeload) as NormWeight,
      WorkType as WorkType,/*вид работ*/
      unloadid as UnloadID, /*пункт разгрузки*/
      to_char(v.TimeUnload, 'DD.mm.yyyy hh24:mi:ss') as TimeUnload,
      /*KEM_HOURSTOTIMESTRING((st2.timego - st2.timestop)*24) as TimeUnLoading,*/  /*проверить точность определения*/
      nvl(round((st2.timego - st2.timestop)*24*60,2),0) as TimeUnLoading,
      to_char(cast(st2.timego as timestamp)- cast(st2.timestop as timestamp), 'hh24:mi:ss')  as TimeUnLoading_1,  
      FuelLoad,
      FuelUnload,
    v.loadtype, /*вид груза*/
     
      v.unloadLength, /*длина пробега порожним*/
      v.avspeed,
      v.loadheight, v.unloadheight, /*горизонты погрузки и разгрузки*/
      to_char(st1.timestop, 'DD.mm.yyyy hh24:mi:ss') as TimeArriveToLoad /*постановка под ковш*/


        ,st1.timestop
        ,to_char(st1.timestop, 'DD.mm.yyyy hh24:mi:ss') as st1_timestop
         ,to_char(st2.timego, 'DD.mm.yyyy hh24:mi:ss') as st2_timego
        ,to_char(st2.timestop, 'DD.mm.yyyy hh24:mi:ss') as st2_timestop
        ,to_char(v.movetime, 'hh24:mi:ss') as movetime
        , v.weight*length as GroosRoute
        , round(v.weight/2.7,1) as VolumeFact
        , round((NORMS.TRIP_WEIGHT(v.shovid, v.vehid, v.worktype, v.unloadid, V.LENGTH, v.timeload)/2.7),1) as VolumeNorm
        

    from vehtrips v
   
    left join (select VEHID,timego, timestop from shiftstoppages where timestop between /*:ParamDateBegin-1*/
            to_date('25.12.2021 08:00:00', 'DD.mm.yyyy hh24:mi:ss')
            and /*:ParamDateEnd+1*/ 
            to_date('26.12.2021 20:00:00', 'DD.mm.yyyy hh24:mi:ss')
            ) st1 on ST1.VEHID = V.VEHID and v.timeload -5/(60*60*24) /*-5с для отсечения двойных остановок при разгрузке, часто попадались*/
                between st1.timestop and st1.timego
    left join (select  VEHID,timego, timestop from shiftstoppages where timestop between 
        /*:ParamDateBegin-1*/
        to_date('25.12.2021 08:00:00', 'DD.mm.yyyy hh24:mi:ss')
            and /*:ParamDateEnd+1*/
            to_date('26.12.2021 20:00:00', 'DD.mm.yyyy hh24:mi:ss')
            ) st2 on ST2.VEHID = V.VEHID and v.timeunload-5/(60*60*24) /*-5с для отсечения двойных остановок при разгрузке, часто попадались*/
                between st2.timestop and st2.timego    


		where 
        /*v.vehid like decode(:ParamVehID, 'Все', '%', :ParamVehID)
        and*/ V.TIMELOAD between
            /*:ParamDateBegin*/   
            to_date('25.12.2021 08:00:00', 'DD.mm.yyyy hh24:mi:ss')
            and /*:ParamDateEnd */
            to_date('26.12.2021 20:00:00', 'DD.mm.yyyy hh24:mi:ss')
)v1)
group by
tripcounter,
vehid,
    tripnum,
    shovid,
    TimeIdle_Load,
    TimeArriveToLoad,
    timeload,
    timeloading,
    length,
    factweight,
    normweight,
    worktype,
    unloadid,
    timeunload,
    timeunloading,
    fuelload,
    fuelunload
    
    ,UNLOADLENGTH
    ,LOADTYPE
    ,MOVETIME
    ,LOADHEIGHT
    ,UNLOADHEIGHT
    ,avspeed
     , GroosRoute
    , VolumeFact
    , VolumeNorm
    ,date_shift
    ,shift
    
order by length(vehid), vehid, timeload


/*
"TRIPCOUNTER" NUMBER(10,0) NOT NULL ENABLE, 
	"VEHID" VARCHAR2(12 BYTE), 
	"TIMELOAD" DATE, 
	"TIMEUNLOAD" DATE, 
	"GMTTIMELOAD" DATE, 
	"GMTTIMEUNLOAD" DATE, 
	"FUELLOAD" NUMBER(5,0), 
	"FUELUNLOAD" NUMBER(5,0), 
	"WEIGHT" NUMBER(15,1), 
	"LENGTH" NUMBER(15,2), 
	"AVSPEED" NUMBER(15,3), 
	"UNLOADLENGTH" NUMBER(15,2), 
	"SHOVID" VARCHAR2(12 BYTE), 
	"UNLOADID" VARCHAR2(50 BYTE), 
	"LOADTYPE" VARCHAR2(30 BYTE), 
	"MOVETIME" DATE, 
	"XLOAD" NUMBER(17,7) DEFAULT 0, 
	"YLOAD" NUMBER(17,7) DEFAULT 0, 
	"XUNLOAD" NUMBER(17,7) DEFAULT 0, 
	"YUNLOAD" NUMBER(17,7) DEFAULT 0, 
	"WORKTYPE" VARCHAR2(35 BYTE), 
	"AREA" VARCHAR2(30 BYTE), 
	"VEHCODE" NUMBER(9,0), 
	"SHOV_ID" NUMBER(9,0), 
	"UNLOAD_ID" NUMBER(9,0), 
	"LOADTYPE_ID" NUMBER(9,0), 
	"WORKTYPE_ID" NUMBER(9,0), 
	"AREA_ID" NUMBER(9,0), 
	"HYDROSYSTEMWEIGHT" NUMBER(15,1) DEFAULT 0 NOT NULL ENABLE, 
	"TIME_INSERTING" DATE DEFAULT sysdate, 
	"UNLOADIDFORLOAD" VARCHAR2(50 CHAR), 
	"ZLOAD" NUMBER(7,3) DEFAULT 0, 
	"ZUNLOAD" NUMBER(7,3) DEFAULT 0, 
	"WRATE" NUMBER(15,2) DEFAULT 0, 
	"VRATE" NUMBER(15,2) DEFAULT 0, 
	"REDUCEDLENGTH" NUMBER(10,3) DEFAULT 0, 
	"ISAREAINTERSECT" NUMBER(3,0), 
	"BUCKETCOUNT" NUMBER(36,10), 
	"LOADHEIGHT" NUMBER(17,7), 
	"UNLOADHEIGHT" NUMBER(17,7), */