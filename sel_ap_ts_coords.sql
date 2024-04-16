select eoa.* 
    , ata.ap_name
    from v_eventout_advanced eoa
    inner join ap_ts_assign ata
        on ata.vehid = eoa.vehid and ata.vehtype= eoa.vehtype;

BEGIN         
update dispatcher.routers r
    set (x , y) = (select eoa.x , eoa.y
                    from v_eventout_advanced eoa
                        inner join ap_ts_assign ata
                            on ata.vehid = eoa.vehid and ata.vehtype= eoa.vehtype
                    where ata.ap_name  = r.name) 
    where exists (select 1 from ap_ts_assign ata where ata.ap_name = r.name);
end;