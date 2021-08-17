
select * from JYBA.jyba_owner_properties op
where op.owner_name = 'GLOBAL';

SELECT /*+ $hint$ */ /* $queryName$ */
    property_value
FROM
    jyba.jyba_owner_properties p
WHERE
    LOWER(owner_name) = LOWER('GLOBAL')
AND LOWER(property_name) = LOWER('OrderServiceUrl');


select * from JYBA.jyba_owner_properties op
where op.owner_name = 'GLOBAL'
and op.property_name like '%node%'
;