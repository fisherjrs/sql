
select * from jyba.jyba_pages p
join jyba.jyba_designs d on d.design_id = p.design_id
join jyba.jyba_design_sources ds on ds.source_system_name = d.source_system_name
    and ds.source_reference = d.source_reference
where 1 = 1
and ds.job_numberid = 561
and ds.job_yearid = 2021
and p.page_type = 'PAGE'
order by p.page_number
;

select * from jyba.jyba_pages p
join jyba.jyba_designs d on d.design_id = p.design_id
where 1 = 1
and d.design_id = 5000583888
and p.page_type = 'PAGE'
order by p.page_number
;