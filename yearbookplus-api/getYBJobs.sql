SELECT 
    hr.job_numberid
FROM 
    jyba.yt_home_registration hr
JOIN 
    jyba.yt_home_registration hr2 on hr.job_numberid = hr2.job_numberid
WHERE 
    1 = 1
    --and hr.ybplus_last_update_date BETWEEN #{fromDate} AND CURRENT_DATE
    and hr.ybplus_last_update_date BETWEEN sysdate - 300 AND CURRENT_DATE
    AND hr2.ybplus_enrolled_flag = 'Y'
GROUP BY 
    hr.job_numberid
ORDER BY 
    hr.job_numberid
;