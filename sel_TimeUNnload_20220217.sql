select
                decode(t.vehtype, 'Нетех.', 'Нетехнология', 'Вспомогат.', 'Бульдозер', t.vehtype) as
                vehtype,
                t.vehid as vehid,
                 t.controlid as controlid,
                  mdata, real, 
                  interval, dt,  DESCR
                  , speed, fuel, weight, z
                  from(
            SELECT  sel1.vehid vehid, controlid, MData, Real, interval, round(dt*24*60) dt, sel1.vehtype vehtype
            , speed, fuel, weight, z
            FROM (
 SELECT VEHID,
        EVENTTIME AS MDATA,
        SYSTEMTIME AS REAL,
        dispatcher.MINTOHOURMIN(GREATEST((EVENTTIME - SYSDATE) * (-24 * 60) - 0.5, 0)) AS INTERVAL,
        GREATEST((SYSDATE - EVENTTIME), 0) AS DT,
        VEHTYPE
        , speed, fuel, weight, z
   FROM dispatcher.EVENTOUT_ADVANCED
 

 )sel1
    left join dispatcher.allvehs av on av.vehid = sel1.vehid and av.vehtype = sel1.vehtype
      ) t
  left join (select vehtype, controlid, stt.name||' с '||replace(to_char(timestop,'dd.mm.yyyy hh24-mi')||' по '||to_char(timego,'dd.mm.yyyy hh24-mi'),'-',':') descr from ( 
 
select ust.name, 'Экскаватор' vehtype, sh.controlid, timestop, timego from dispatcher.manualstoppages_shov mstp
inner join dispatcher.userstoppagetypes_shovels ust on ust.code=mstp.typeid
inner join dispatcher.shovels sh on sh.shovid=mstp.vehid
 where sysdate between timestop and timego
union
select ust.name, 'Самосвал' vehtype,  dt.controlid, timestop, timego from dispatcher.manualstoppages  mstp
inner join dispatcher.userstoppagetypes ust on ust.code=mstp.typeid
inner join dispatcher.dumptrucks dt on dt.vehid=mstp.vehid
 where sysdate between timestop and timego 
union
select ust.name, 'Бульдозер' vehtype, (select controlid from dispatcher.auxtechnics where auxid=mstp.vehid) controlid, timestop, timego from dispatcher.manualstoppages_aux mstp
inner join dispatcher.userstoppagetypes_aux ust on ust.code=mstp.typeid
 where sysdate between timestop and timego 
union
select ust.name, 'Бурстанок' vehtype, (select TO_NUMBER(controlid) from rigs.rigs@rigs where rigid=vehid and 9999>rigid) vehid, timestop, timego from rigs.manualstoppages@rigs mstp
inner join rigs.userstoppagetypes@rigs ust on ust.code=mstp.typeid
 where sysdate between timestop and timego
 )stt) stopsel
on stopsel.controlid=t.controlid;  