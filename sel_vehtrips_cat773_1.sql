/*выборка рейсов по CAT-773*/

SELECT
    vt.shovid, vt.timeload, vt.vehid
FROM vehtrips vt
where vehid in 
    (select dt.vehid from dumptrucks dt where dt.model in 
        (select dtm.name from dumptruckmodels dtm where dtm.name = 'CAT 773'))
    and vt.timeload >= to_date('15.12.2021 08:00:00', 'dd.mm.yyyy HH:mi:ss')
    and vt.shovid ='WA-600 7'
group by vt.shovid, vt.timeload, vt.vehid
order by vt.shovid, vt.timeload, vt.vehid