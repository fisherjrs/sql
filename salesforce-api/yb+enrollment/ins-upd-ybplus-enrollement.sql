
MERGE INTO jyba.yt_home_registration dest
USING (
    SELECT 1 FROM DUAL
)
ON (
    dest.job_numberid = 48 --#{ybPlusEnrollment.jobNumber}
    AND dest.job_yearid = 2022 --#{ybPlusEnrollment.jobYear}
)
WHEN MATCHED THEN UPDATE
    SET
        ybplus_enrolled_flag = 'Y', --#{ybPlusEnrollment.ybPlusEnrollmentFlag},
        last_updated_by = 'SFAPI',
        last_update_date = sysdate,
        ybplus_last_update_date = sysdate
    WHERE
        dest.job_numberid = 48 --#{ybPlusEnrollment.jobNumber}
    AND dest.job_yearid = 2022 --#{ybPlusEnrollment.jobYear}
WHEN NOT MATCHED THEN INSERT
    (
        registration_id,
        created_by,
        creation_date,
        last_updated_by,
        last_update_date,
        job_numberid,
        job_yearid,
        ybplus_enrolled_flag,
        ybplus_last_update_date,
        status_code
    )
    VALUES (
        jyba.yt_home_registration_s.nextval,
        'SFAPI',
        sysdate,
        'SFAPI',
        sysdate,
        48, --#{ybPlusEnrollment.jobNumber},
        2022, --#{ybPlusEnrollment.jobYear},
        'Y', --#{ybPlusEnrollment.ybPlusEnrollmentFlag},
        sysdate,
        '0'
    )