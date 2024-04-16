/*
выборка план-факта объЄмов с аккумул€цией по часам
*/
select sel1.*
, round(sel1.fact_volume/sel1.plan_hour,2) as planfact_percent
from (
select sum(fact_volume) as fact_volume,
    sum(plan_hour) as plan_hour, 1 as shitfhour
    from ugh.v_planfact_hour_volume
    where shifthour<=1
union
select sum(fact_volume) as fact_volume,
    sum(plan_hour) as plan_hour, 2 as shitfhour
    from ugh.v_planfact_hour_volume
    where shifthour<=2
union
select sum(fact_volume) as fact_volume,
    sum(plan_hour) as plan_hour, 3 as shitfhour
    from ugh.v_planfact_hour_volume
    where shifthour<=3
union
select sum(fact_volume) as fact_volume,
    sum(plan_hour) as plan_hour, 4 as shitfhour
    from ugh.v_planfact_hour_volume
    where shifthour<=4
union
select sum(fact_volume) as fact_volume,
    sum(plan_hour) as plan_hour, 5 as shitfhour
    from ugh.v_planfact_hour_volume
    where shifthour<=5
union
select sum(fact_volume) as fact_volume,
    sum(plan_hour) as plan_hour, 6 as shitfhour
    from ugh.v_planfact_hour_volume
    where shifthour<=6
union
select sum(fact_volume) as fact_volume,
    sum(plan_hour) as plan_hour, 7 as shitfhour
    from ugh.v_planfact_hour_volume
    where shifthour<=7
union
select sum(fact_volume) as fact_volume,
    sum(plan_hour) as plan_hour, 8 as shitfhour
    from ugh.v_planfact_hour_volume
    where shifthour<=8
union
select sum(fact_volume) as fact_volume,
    sum(plan_hour) as plan_hour, 9 as shitfhour
    from ugh.v_planfact_hour_volume
    where shifthour<=9
union
select sum(fact_volume) as fact_volume,
    sum(plan_hour) as plan_hour, 10 as shitfhour
    from ugh.v_planfact_hour_volume
    where shifthour<=10
union
select sum(fact_volume) as fact_volume,
    sum(plan_hour) as plan_hour, 11 as shitfhour
    from ugh.v_planfact_hour_volume
    where shifthour<=11
union
select sum(fact_volume) as fact_volume,
    sum(plan_hour) as plan_hour, 12 as shitfhour
    from ugh.v_planfact_hour_volume
    where shifthour<=12
) sel1
    where sel1.shitfhour <= ugh.f_get_shifthour(sysdate)