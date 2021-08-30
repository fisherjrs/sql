
select * from JYBA.jyba_privileges p
join jyba.jyba_role_privs rp on rp.privilege_id = p.privilege_id
where 1 = 1
and rp.role_id = 5000000181
-- and rp.role_id = 161
;



select * from JYBA.jyba_privileges p
join jyba.jyba_role_privs rp on rp.privilege_id = p.privilege_id
join jyba.jyba_roles r on r.role_id = rp.role_id
join jyba.jyba_sessions s on s.role_id = r.role_id
where 1 = 1
and s.session_key = '1jogmplotlknjistunropomghsprshimluqiknfjotsjrtiojigmujgolkopkmhgi';


select * from JYBA.jyba_privileges p
where p.name = 'VIEW_PERSONALLY_IDENTIFIABLE_INFORMATION';

