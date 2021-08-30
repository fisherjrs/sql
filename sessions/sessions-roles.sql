select * from jyba.jyba_sessions s
where s.session_key = '1jogmplotlknjistunropomghsprshimluqiknfjotsjrtiojigmujgolkopkmhgi';

select * from jyba.jyba_roles r
join jyba.jyba_sessions s on s.role_id = r.role_id
where s.session_key = '1jogmplotlknjistunropomghsprshimluqiknfjotsjrtiojigmujgolkopkmhgi'
;

