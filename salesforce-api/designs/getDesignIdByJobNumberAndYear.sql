
SELECT /*+ ${hint} */ /* ${queryName} */
    jd.design_id
FROM
    jyba.jyba_design_sources jds,
    jyba.jyba_designs jd
WHERE
    jds.job_numberid = 41006 --#{jobNumber}
AND jds.job_yearid = 2022 --#{jobYear}
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
    jds.job_numberid = 2064 --#{jobNumber}
AND jds.job_yearid = 2022 --#{jobYear}
AND jd.source_reference = jds.source_reference
AND jd.source_system_name = jds.source_system_name
;