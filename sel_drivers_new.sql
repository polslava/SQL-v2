/*
sel_drivers_new.sql
выборка по табельному номеру водителей, добавленных в справочники вручную, для запроса в 1С GUID
*/

select sel1.* from(
select dr.tabelnum, dr.famname || ' ' || dr.firstname || ' ' || dr.secname as FIO, 'Экскаватор' as TypeTS
    from dispatcher.shovdrivers dr
union
select dr.tabelnum, dr.famname || ' ' || dr.firstname || ' ' || dr.secname as FIO, 'Бульдозер' as TypeTS
    from dispatcher.auxdrivers dr
union
select dr.tabelnum, dr.famname || ' ' || dr.firstname || ' ' || dr.secname as FIO, 'Самосвал' as TypeTS
    from dispatcher.drivers dr
) sel1
where tabelnum in (23277, 23204,23213,23211,23201,23228,23229,23282,22970,22926)