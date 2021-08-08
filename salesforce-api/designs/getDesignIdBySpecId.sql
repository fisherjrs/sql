SELECT /*+ ${hint} */ /* ${queryName} */
    jd.design_id
FROM
    jyba.jyba_designs jd
WHERE
    jd.vault_spec_id = 5985705 --#{specId}
;

SELECT /*+ ${hint} */ /* ${queryName} */
    jd.*
FROM
    jyba.jyba_designs jd
WHERE
    jd.vault_spec_id = 5985705 --#{specId}
; 