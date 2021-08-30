select 
    d.design_id
from jyba.jyba_design_sources ds
join jyba.jyba_designs d on d.source_reference = ds.source_reference 
    and d.source_system_name = ds.source_system_name
where
    ds.job_numberid = 561
    and ds.job_yearid = 2021
;


SELECT /*+ ${hint} */ /* ${queryName} */
    jd.design_id
FROM
    jyba.jyba_design_sources jds,
    jyba.jyba_designs jd
WHERE
    jds.job_numberid = 48 --#{jobNumber}
AND jds.job_yearid = 2021 --#{jobYear}
AND jd.source_reference = jds.source_reference
AND jd.source_system_name = jds.source_system_name
;

SELECT /*+ ${hint} */ /* ${queryName} */
    jds.*,
    jd.*
FROM
    jyba.jyba_design_sources jds,
    jyba.jyba_designs jd
WHERE
    jds.job_numberid = 87 --#{jobNumber}
AND jds.job_yearid = 2021 --#{jobYear}
AND jd.source_reference = jds.source_reference
AND jd.source_system_name = jds.source_system_name
;

select ds.job_numberid, d.* from jyba.jyba_designs d
join jyba.jyba_design_sources ds on ds.source_reference = d.source_reference and ds.source_system_name = d.source_system_name
where d.design_id = 5000605145;