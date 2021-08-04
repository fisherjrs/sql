

select * from jyba.jyba_designs d
where d.source_reference = '5980155';

select * from jyba.jyba_design_sources ds
join jyba.jyba_designs d on d.source_reference = ds.source_reference
and d.source_system_name = ds.source_system_name
where ds.job_yearid = 2022
and ds.source_reference = 5980155
;

