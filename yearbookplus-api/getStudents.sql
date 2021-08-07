
SELECT
    jp.person_id,
    jp.first_name,
    jp.last_name,
    jp.yearbook_plus_email,
    jp.grade,
    jp.home_room,
    jp.status_code,
    jp.latest_target_person_id,
    jf.image_id,
    jf.source_file_type,
    jf.source_colorspace,
    jf.source_alpha_channel_flag,
    jf.version_number,
    jf.folder_id,
    jf.file_id
FROM (
    -- Find all person records, fetch latest merged person id -->
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
                    WHERE ds2.job_numberid = 561 --#{jobNumber}
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
        jds.job_numberid = 561 --#{jobNumber}
    AND jds.job_yearid = 2021 --#{jobYear}
    AND jd.source_reference = jds.source_reference
    AND jd.source_system_name = jds.source_system_name
    AND jd.design_id = jp.design_id
    -- YBA-31021 filter out records with null email, grade, name -->
    AND jype.person_id = jp.person_id
    AND jp.grade IS NOT NULL
    AND NOT (jp.first_name IS NULL and jp.last_name IS NULL)
) jp
    -- 1) Find all portrait images that are used and placed on job -->
    -- 2) Join person records on portrait image set regardless if record exists or not -->
    LEFT JOIN (
        SELECT 
        jf.person_id,
        jf.image_id,
        jf.face_id,
        ji.source_file_type,
        ji.source_colorspace,
        ji.source_alpha_channel_flag,
        ji.version_number,
        ji.folder_id,
        ji.file_id
    FROM
        jyba.jyba_designs jd,
        jyba.jyba_design_sources jds,
        jyba.jyba_persons jp,
        jyba.jyba_faces jf,
        jyba.jyba_images ji,
        jyba.jyba_categories jc
    WHERE
        jds.job_numberid = 561 --#{jobNumber}
    AND jds.job_yearid = 2022 --#{jobYear}
    AND jd.source_reference = jds.source_reference
    AND jd.source_system_name = jds.source_system_name
    AND jd.design_id = jp.design_id
    AND jp.person_id = jf.person_id
    AND ji.image_id = jf.image_id
    AND ji.category_id = jc.category_id
    AND jc.category_type = 'PORTRAIT'
    -- Filter for only used / flowed portraits -->
    AND EXISTS (SELECT 1 FROM jyba.jyba_images_used WHERE image_id = ji.image_id)
) jf
ON jp.person_id = jf.person_id