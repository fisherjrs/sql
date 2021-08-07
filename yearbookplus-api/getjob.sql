SELECT
    jds.job_numberid job_number,
    jds.job_yearid job_year,
    jyh.customer_name school_name,
    jyh.customer_city city,
    jyh.customer_state state,
    jyh.customer_zip postal_code,
    jds.customer_country country,
    jds.current_salesrep sales_rep_id,
    NVL(yhr.ybplus_enrolled_flag, 'N') ybplus_enrolled_flag,
    yc.contact_first_name adviser_first_name,
    yc.contact_last_name adviser_last_name,
    yc.contact_email adviser_email
FROM
    jyba.jyba_design_sources jds,
    jyba.jrs_yrbk_headers jyh,
    jyba.yt_home_registration yhr,
    jyba.yt_contact yc
WHERE
    jds.job_numberid = 48 --#{jobNumber}
AND jds.job_numberid = jyh.job_numberid
AND jds.job_yearid = jyh.job_yearid
AND jds.job_numberid = yhr.job_numberid
AND jds.job_yearid = yhr.job_yearid
AND jds.job_numberid = yc.job_numberid(+)
AND jds.job_yearid = yc.job_yearid(+)
AND yc.contact_type (+) = 'ADVISER'