SELECT
    jd.design_id,
    jd.trim_code,
    jd.binding_code,
    jd.yeartech_online_system_code
FROM
    jyba.jyba_designs jd,
    jyba.jyba_design_sources jds
WHERE
    jd.source_reference = jds.source_reference
AND jd.source_system_name = jds.source_system_name
AND jds.job_numberid = 60124 --#{jobNumber}
AND jds.job_yearid = 2022 --#{jobYear}
;