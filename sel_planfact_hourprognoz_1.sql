select sel1.*,
    sel1.prognoz_percent*100 as prognoz_percent100
from (
select pf1.*, pf1.plan_hour as prognoz_volume
    , round(pf1.fact_volume/pf1.plan_hour,2)/* *100*/ as prognoz_percent
    from ugh.v_planfact_hour_volume pf1
    where pf1.shifthour = 1
union

select pf1.*, sel1.prognoz_volume 
    , round(pf1.fact_volume/sel1.prognoz_volume ,2)/* *100*/ as prognoz_percent
    from ugh.v_planfact_hour_volume pf1
    left join 
        (select sum(pf2.fact_volume)/2 as prognoz_volume, pf2.shovid from  ugh.v_planfact_hour_volume pf2
            where pf2.shifthour between 1 and 2
            group by pf2.shovid) sel1
        on pf1.shovid = sel1.shovid
    where pf1.shifthour = 2
union
select pf1.* , sel1.prognoz_volume
    , round(pf1.fact_volume/sel1.prognoz_volume ,2)/* *100*/ as prognoz_percent
        from ugh.v_planfact_hour_volume pf1
    left join 
        (select sum(pf2.fact_volume)/2 as prognoz_volume, pf2.shovid from  ugh.v_planfact_hour_volume pf2
            where pf2.shifthour between 2 and 3
            group by pf2.shovid) sel1
        on pf1.shovid = sel1.shovid
    where pf1.shifthour = 3
union
select pf1.* , sel1.prognoz_volume
    , round(pf1.fact_volume/sel1.prognoz_volume ,2)/* *100*/ as prognoz_percent
    from ugh.v_planfact_hour_volume pf1
    left join 
        (select sum(pf2.fact_volume)/2 as prognoz_volume, pf2.shovid from  ugh.v_planfact_hour_volume pf2
            where pf2.shifthour between 3 and 4
            group by pf2.shovid) sel1
        on pf1.shovid = sel1.shovid
    where pf1.shifthour = 4
union
select pf1.* , sel1.prognoz_volume
    , round(pf1.fact_volume/sel1.prognoz_volume ,2)/* *100*/ as prognoz_percent
    from ugh.v_planfact_hour_volume pf1
    left join 
        (select sum(pf2.fact_volume)/2 as prognoz_volume, pf2.shovid from  ugh.v_planfact_hour_volume pf2
            where pf2.shifthour between 4 and 5
            group by pf2.shovid) sel1
        on pf1.shovid = sel1.shovid
    where pf1.shifthour = 5
union
select pf1.* , sel1.prognoz_volume
    , round(pf1.fact_volume/sel1.prognoz_volume ,2)/* *100*/ as prognoz_percent
    from ugh.v_planfact_hour_volume pf1
    left join 
        (select sum(pf2.fact_volume)/2 as prognoz_volume, pf2.shovid from  ugh.v_planfact_hour_volume pf2
            where pf2.shifthour between 5 and 6
            group by pf2.shovid) sel1
        on pf1.shovid = sel1.shovid
    where pf1.shifthour = 6
union
select pf1.* , sel1.prognoz_volume
    , round(pf1.fact_volume/sel1.prognoz_volume ,2)/* *100*/ as prognoz_percent
    from ugh.v_planfact_hour_volume pf1
    left join 
        (select sum(pf2.fact_volume)/2 as prognoz_volume, pf2.shovid from  ugh.v_planfact_hour_volume pf2
            where pf2.shifthour between 6 and 7
            group by pf2.shovid) sel1
        on pf1.shovid = sel1.shovid
    where pf1.shifthour = 7
union
select pf1.* , sel1.prognoz_volume
    , round(pf1.fact_volume/sel1.prognoz_volume ,2)/* *100*/ as prognoz_percent
    from ugh.v_planfact_hour_volume pf1
    left join 
        (select sum(pf2.fact_volume)/2 as prognoz_volume, pf2.shovid from  ugh.v_planfact_hour_volume pf2
            where pf2.shifthour between 7 and 8
            group by pf2.shovid) sel1
        on pf1.shovid = sel1.shovid
    where pf1.shifthour = 8
union
select pf1.* , sel1.prognoz_volume
    , round(pf1.fact_volume/sel1.prognoz_volume ,2)/* *100*/ as prognoz_percent
    from ugh.v_planfact_hour_volume pf1
    left join 
        (select sum(pf2.fact_volume)/2 as prognoz_volume, pf2.shovid from  ugh.v_planfact_hour_volume pf2
            where pf2.shifthour between 8 and 9
            group by pf2.shovid) sel1
        on pf1.shovid = sel1.shovid
    where pf1.shifthour = 9
union
select pf1.* , sel1.prognoz_volume
    , round(pf1.fact_volume/sel1.prognoz_volume ,2)/* *100*/ as prognoz_percent
    from ugh.v_planfact_hour_volume pf1
    left join 
        (select sum(pf2.fact_volume)/2 as prognoz_volume, pf2.shovid from  ugh.v_planfact_hour_volume pf2
            where pf2.shifthour between 9 and 10
            group by pf2.shovid) sel1
        on pf1.shovid = sel1.shovid
    where pf1.shifthour = 10
union
select pf1.* , sel1.prognoz_volume
    , round(pf1.fact_volume/sel1.prognoz_volume ,2)/* *100*/ as prognoz_percent
    from ugh.v_planfact_hour_volume pf1
    left join 
        (select sum(pf2.fact_volume)/2 as prognoz_volume, pf2.shovid from  ugh.v_planfact_hour_volume pf2
            where pf2.shifthour between 10 and 11
            group by pf2.shovid) sel1
        on pf1.shovid = sel1.shovid
    where pf1.shifthour = 11
union
select pf1.* , sel1.prognoz_volume
    , round(pf1.fact_volume/sel1.prognoz_volume ,2)/* *100*/ as prognoz_percent
    from ugh.v_planfact_hour_volume pf1
    left join 
        (select sum(pf2.fact_volume)/2 as prognoz_volume, pf2.shovid from  ugh.v_planfact_hour_volume pf2
            where pf2.shifthour between 11 and 12
            group by pf2.shovid) sel1
        on pf1.shovid = sel1.shovid
    where pf1.shifthour = 12
) sel1