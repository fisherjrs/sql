 select * from jyba.jyba_person_merges jm
 where 1 = 1
 and jm.source_person_id = jm.target_person_id
 and jm.design_id = 5000585155
 order by jm.design_id;

 select * from jyba.jyba_person_merges jm
 where 1 = 1
 and jm.source_person_id = jm.target_person_id
 and jm.design_id in (
    select 
        d.design_id
    from jyba.jyba_design_sources ds
    join jyba.jyba_designs d on d.source_reference = ds.source_reference 
        and d.source_system_name = ds.source_system_name
    where
        ds.job_numberid = 3393
        and ds.job_yearid = 2021
 )
 order by jm.design_id;

 
select count(*) from jyba.jyba_person_merges jm
 where jm.source_person_id = jm.target_person_id
 order by jm.design_id;
 
 select * from jyba.jyba_persons p
 where 1 = 1
 and p.design_id in (
    select 
        d.design_id
    from jyba.jyba_design_sources ds
    join jyba.jyba_designs d on d.source_reference = ds.source_reference 
        and d.source_system_name = ds.source_system_name
    where
        ds.job_numberid = 2720
        and ds.job_yearid = 2022
 )
 ;
 
