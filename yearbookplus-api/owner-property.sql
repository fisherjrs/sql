
SELECT 
    property_value
FROM
    jyba_owner_properties p
WHERE
    LOWER(owner_name) = 'global' --LOWER(#{ownerName})
AND LOWER(property_name) = 'cdn' --LOWER(#{propertyName})
;