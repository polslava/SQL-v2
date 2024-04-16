/*выборка паспортов для CAT-773, 
для которых установлен норматив в 90тн, должно быть 55те*/

select sln.*, swc.* , swd.*
    from shov_loadingnorms_to_vehicle sln
    left join shov_working_cond swc on swc.internal_id = sln.parent_id
    left join shov_working_date swd on swd.id = swc.parent_id
    where vehicle_model_code in 
        (select dtm.internalcode from dumptruckmodels dtm where dtm.name = 'CAT 773')
        and sln.weight = 90