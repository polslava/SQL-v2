/*
выборка маршрутов самосвала с 0 весом по паспорту загрузки
используется для актуализации паспорта загрузки самосвала

sel_nullweightrate.sql
*/

select * from shiftreportsadv
    where taskdate between to_date('01.03.2022', 'dd.mm.yyyy') and to_date('17.03.2022', 'dd.mm.yyyy')
        --and tripnumbermanual is null
        and weightrate = 0