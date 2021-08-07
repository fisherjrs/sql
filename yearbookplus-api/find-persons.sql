SELECT
    jp.person_id,
    jp.first_name,
    jp.last_name,
    jp.grade,
    jp.home_room,
    jp.status_code,
    jype.yearbook_plus_email,
    (SELECT target_person_id FROM
        (SELECT
            jm.design_id,
            jm.source_person_id,
            jm.target_person_id,
            ROW_NUMBER() OVER (PARTITION BY jm.source_person_id ORDER BY jm.creation_date DESC) rank
        FROM
            jyba.jyba_person_merges jm
            -- YBA-31021 Add designId to query so we hit the index instead of doing full scan 
            WHERE jm.design_id = (
                SELECT d2.design_id 
                FROM jyba.jyba_design_sources ds2, jyba.jyba_designs d2 
                WHERE ds2.job_numberid = 48 --#{jobNumber}
                AND ds2.job_yearid = 2021 --#{jobYear} 
                AND ds2.source_reference = d2.source_reference 
                AND ds2.source_system_name = d2.source_system_name
            )
        )
        WHERE rank = 1 
        AND design_id = jd.design_id 
        AND source_person_id = jp.person_id
    ) latest_target_person_id
FROM
    jyba.jyba_designs jd,
    jyba.jyba_design_sources jds,
    jyba.jyba_persons jp,
    jyba.jyba_yearbook_plus_emails jype
WHERE
    jds.job_numberid = 48 --#{jobNumber}
AND jds.job_yearid = 2021 --#{jobYear}
AND jd.source_reference = jds.source_reference
AND jd.source_system_name = jds.source_system_name
AND jd.design_id = jp.design_id
-- YBA-31021 filter out records with null email, grade, name -->
AND jype.person_id = jp.person_id
AND jp.grade IS NOT NULL
AND NOT (jp.first_name IS NULL and jp.last_name IS NULL)
;