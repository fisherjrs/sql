SELECT 
*
FROM jrs.jrs_printcover_specs jps,
    jrs.jrs_printcover_dp_codes dpc
WHERE 1=1
    AND jps.job_number_id = 60142
    AND jps.job_year_id = 2022
    AND dpc.job_number_id (+)= jps.job_number_id
    AND dpc.job_year_id (+)= jps.job_year_id