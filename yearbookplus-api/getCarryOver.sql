
SELECT
    old_job_number,
    old_job_year
FROM
    vault.vault_carryover_jobs
WHERE
1 = 1
--and new_job_number = #{jobNumber}
and new_job_number = 60124
--AND new_job_year = #{jobYear}
AND new_job_year = 2022
;