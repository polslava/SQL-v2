   select sel_1.*
,substr(sel_1.TIMELOAD,12,2) as Hours
, av.tsname, av.model  /*20221219*/
   from
(select 
    vehid, /*Имя самосвала*/
    tripnum, /*номер рейса в периоде*/
    shovid, /*Имя экскаватора*/
	area, /*Блок погрузки*/
    to_char(
        nvl((select max(timestop) from shiftstoppages st where st.vehid = v1.vehid and st.timestop /*&lt;*/< v1.timestop and st.timestop > prevtimeload_1 and st.idlestoptype = 155), v1.timestop)
        , 'DD.mm.yyyy hh24'||chr(58)||'mi'||chr(58)||'ss')
        as TimeIdle_Load, /*начало простоя в ожидании погрузки*/
    TimeArriveToLoad, /*начало ожидания под погрузкой */
    timeload, /*начало погрузки*/
    timeloading, /*продолжительность погрузки*/
    length, /*пробег гружённым*/
    factweight, /*вес факт*/
    normweight, /*вес норма*/
    worktype, /*вид работ*/
    unloadid, /*пукнт разгрузки*/
    timeunload, /*конец разгрузки*/
    timeunloading, /*продолжительность разгрузки*/
    fuelload, /*топливо на начало рейса*/
    fuelunload, /*топливо на конец рейса*/
    tripcounter /*номер рейса в БД*/
	,avspeed /*средняя скорость рейса*/
    ,UNLOADLENGTH /*пробег порожним*/
    ,LOADTYPE /*вид груза*/
    ,MOVETIME /*время на рейсе*/
    ,LOADHEIGHT /*горизонт погрузки, пока часто 0*/
    ,UNLOADHEIGHT /*горизонт разгрузки*/

    , GroosRoute  /*Грузооборот*/
    , VolumeFact  /*Объём факт*/

    , VolumeNorm  /*Объём норма*/
    ,date_shift
	     /*дата смены*/
    ,shift /*смена*/
    
    ,st2_timestop as TimeUnloadBegin/*начало разгрузки*/ /*20221219*/
    ,TimeLoadEnd  /*конец погрузки*/ /*20221219*/
    
from
(  
 select
      v.tripcounter, 
      v.VEHID as VehID,  
      sum(1) over (partition by v.vehid order by v.timeload) as tripnum,         
      v.shovid as  ShovID,
      v.area,
      /*to_char(v.timeload, 'dd.mm.yyyy hh24'||chr(58)||'mi'||chr(58)||'ss') as TimeArriveToLoad, *//*проверить точность определения: --есть постановка под ковш*/
      to_char(v.TimeLoad, 'dd.mm.yyyy hh24'||chr(58)||'mi'||chr(58)||'ss') as TimeLoad,
	  cast(to_char(v.TimeLoad, 'DD') as number) as day_trip,
      cast(to_char(v.TimeLoad, 'hh24') as number) as hour_trip,
      (case 
            when cast(to_char(v.TimeLoad, 'hh24') as number) /*&lt;*/ <8
            then to_char(v.TimeLoad-1, 'DD.mm.yyyy')
            else to_char(v.TimeLoad, 'DD.mm.yyyy') 

            end) as date_shift,
    (case 
            when cast(to_char(v.TimeLoad, 'hh24') as number)>7 and cast(to_char(v.TimeLoad, 'hh24') as number) /* &lt;*/ <20
            then 1
            else 2
            end) as shift,
	  
      to_char(lag(v.timeload) over (partition by v.vehid order by V.TIMELOAD), 'dd.mm.yyyy hh24'||chr(58)||'mi'||chr(58)||'ss')  as PrevTimeLoad,   
      lag(v.timeload) over (partition by v.vehid order by V.TIMELOAD) as PrevTimeLoad_1,
      /*KEM_HOURSTOTIMESTRING((st1.timego - st1.timestop)*24) as TimeLoading,*/ /*переделать во время*/
        nvl(round((st1.timego - st1.timestop)*24*60,2),0) as TimeLoading,
      v.Length, /*пробег гружённым*/

      Weight as FactWeight, 
      NORMS.TRIP_WEIGHT(v.shovid, v.vehid, v.worktype, v.unloadid, V.LENGTH, v.timeload) as NormWeight,
      WorkType as WorkType,/*вид работ*/
      unloadid as UnloadID, /*пункт разгрузки*/
      to_char(v.TimeUnload, 'dd.mm.yyyy hh24'||chr(58)||'mi'||chr(58)||'ss') as TimeUnload,
      /*KEM_HOURSTOTIMESTRING((st2.timego - st2.timestop)*24) as TimeUnLoading,*/  /*проверить точность определения*/
      nvl(round((st2.timego - st2.timestop)*24*60,2),0) as TimeUnLoading, /*продолжительность разгрузки*/
      to_char(cast(st2.timego as timestamp)- cast(st2.timestop as timestamp), 'hh24'||chr(58)||'mi'||chr(58)||'ss')  as TimeUnLoading_1,  
      FuelLoad,
      FuelUnload,
    v.loadtype, /*вид груза*/
     
      v.unloadLength, /*длина пробега порожним*/
      v.avspeed,
      v.loadheight, v.unloadheight, /*горизонты погрузки и разгрузки*/
      to_char(st1.timestop, 'dd.mm.yyyy hh24'||chr(58)||'mi'||chr(58)||'ss') as TimeArriveToLoad /*постановка под ковш*/
      
        ,st1.timestop
        ,to_char(st1.timestop,'dd.mm.yyyy hh24'||chr(58)||'mi'||chr(58)||'ss') as st1_timestop 
         ,to_char(st2.timego,'dd.mm.yyyy hh24'||chr(58)||'mi'||chr(58)||'ss') as st2_timego /*начало разгрузки*/
        ,to_char(st2.timestop,'dd.mm.yyyy hh24'||chr(58)||'mi'||chr(58)||'ss') as st2_timestop /*конец разгрузки*/
        ,to_char(v.movetime, 'hh24'||chr(58)||'mi'||chr(58)||'ss') as movetime
		
		, v.weight*length as GroosRoute
        , round(v.weight/2.7,1) as VolumeFact
        , round((NORMS.TRIP_WEIGHT(v.shovid, v.vehid, v.worktype, v.unloadid, V.LENGTH, v.timeload)/2.7),1) as VolumeNorm
		
        /*,st1.timestop*/
        ,st1.timego as TimeLoadEnd /*конец погрузки*/
    from vehtrips v
   
    left join (select VEHID,timego, timestop from shiftstoppages where timestop between 
			to_date('18.12.2022 08:00:00','dd.mm.yyyy hh24:mi:ss')
            --:ParamDateBegin-1
            
            and 
            --:ParamDateEnd+1 
            to_date('18.12.2022 20:00:00','dd.mm.yyyy hh24:mi:ss')
            
            ) st1 on ST1.VEHID = V.VEHID and v.timeload -5/(60*60*24) /*-5с для отсечения двойных остановок при разгрузке, часто попадались*/
                between st1.timestop and st1.timego
    left join (select  VEHID,timego, timestop from shiftstoppages where timestop between 
        --:ParamDateBegin-1
        to_date('18.12.2022 08:00:00','dd.mm.yyyy hh24:mi:ss')
        
            and
            --:ParamDateEnd+1
            to_date('18.12.2022 20:00:00','dd.mm.yyyy hh24:mi:ss')
            
            ) st2 on ST2.VEHID = V.VEHID and v.timeunload-5/(60*60*24) /*-5с для отсечения двойных остановок при разгрузке, часто попадались*/
                between st2.timestop and st2.timego    
    
		where 
        v.vehid like decode(:ParamVehID, 'Все', '%', :ParamVehID)
        and V.TIMELOAD between
            --:ParamDateBegin
            to_date('18.12.2022 08:00:00','dd.mm.yyyy hh24:mi:ss')
            
            and 
            --:ParamDateEnd 
            to_date('18.12.2022 20:00:00','dd.mm.yyyy hh24:mi:ss')
            
)v1)sel_1
left join UGH."ALLVEHICLES_ts" av on (av.vehid = sel_1.vehid and av.vehtype='Самосвал')  /*20221219*/
group by
tripcounter,
sel_1.vehid,
    tripnum,
    shovid,
	area,
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
    , avspeed
    ,UNLOADLENGTH
    ,LOADTYPE
    ,MOVETIME
    ,LOADHEIGHT
    ,UNLOADHEIGHT
	
     , GroosRoute
    , VolumeFact
    , VolumeNorm
    ,date_shift
    ,shift
    ,TimeUnloadBegin /*20221219*/
	, av.tsname, av.model /*20221219*/
    ,TimeLoadEnd  /*20221219*/
order by 
	date_shift
    ,shift
	, av.model /*20221219*/
    , av.tsname /*20221219*/
    /*,length(sel_1.vehid), sel_1.vehid*/  /*20221219*/
    ,timeload