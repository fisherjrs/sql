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
    jds.job_numberid = 48 --#{jobNumber}
AND jds.job_yearid = 2022 --#{jobYear}
AND jd.source_reference = jds.source_reference
AND jd.source_system_name = jds.source_system_name
AND jd.design_id = jp.design_id
AND jp.person_id = jf.person_id
AND ji.image_id = jf.image_id
AND ji.category_id = jc.category_id
AND jc.category_type = 'PORTRAIT'
;