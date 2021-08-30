
--junsid is the same as customer_number on the design_sources table

select ds.customer_number from jyba.jyba_design_sources ds
join jyba.jyba_designs d on d.source_reference = ds.source_reference
and d.source_system_name = ds.source_system_name
where ds.job_yearid = 2022
and ds.job_numberid = 561
;


select
  sd.ORACLE_ACCOUNT_NUMBER, ds.CUSTOMER_NAME, ds.job_numberid, ds.job_yearid
from jyba.jrs_specs_detail sd
join jyba.jyba_design_sources ds on ds.job_numberid = sd.job_numberid
    and ds.job_yearid = sd.job_yearid
where 1 = 1
  and ds.job_yearid = 2022
  and ds.CUSTOMER_NUMBER = 4006790;