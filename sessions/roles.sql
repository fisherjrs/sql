select * from JYBA.jyba_sessions s
where s.creation_date > sysdate - 2/24;


select * from jyba.jyba_roles r;

select * from jyba.jyba_roles r
where r.role_id = 3;

select * from jyba.jyba_roles r
where r.role_id = 4;
