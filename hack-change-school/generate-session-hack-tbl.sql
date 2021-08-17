create table fishej2.sessions_hack2 as (
select * from jyba.jyba_sessions s
where s.creation_date > sysdate - 1
);

create table fishej2.sessions_hack3 as (
select * from fishej2.sessions_hack union select * from fishej2.sessions_hack2
);

select count(*) from fishej2.sessions_hack3;

select count(*) from jyba.jyba_sessions s
where s.creation_date > sysdate - 4/24s.creation_date > sysdate - 4/24;

select * from fishej2.sessions_hack3
;
select session_id from fishej2.sessions_hack2;

select
	ds.job_yearid,
	ds.job_numberid,
	s.*
--	count(*)
from fishej2.sessions_hack s,
	jyba.jyba_designs d,
	jyba.jyba_design_sources ds
where 1=1
--and s.creation_date > sysdate - 1
and s.creation_date between to_date('2021-08-17','YYYY-MM-DD') and to_date('2021-08-18','YYYY-MM-DD')
and s.login_name like '%@jostens'
and not exists (
	select 1 from jyba.jyba_staff s1
	where s1.design_id = s.design_id
	and s1.login_name = s.login_name
	union
	select 1 from jyba.jyba_staff s1
	where s1.design_id = 35
	and s1.login_name = s.login_name
)
and s.design_id = d.design_id
and d.source_reference = ds.source_reference
order by s.creation_date desc;