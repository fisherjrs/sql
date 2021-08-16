
select * from jyba.yt_home_registration hr
where hr.job_yearid = 2022
and hr.ybplus_enrolled_flag = 'Y';

select * from fishej2.ybplusenrollment;

select * from jyba.yt_home_registration hr
left outer join fishej2.ybplusenrollment e on e.jobnumber = hr.job_numberid
where hr.job_yearid = 2022
and hr.ybplus_enrolled_flag = 'Y'
;