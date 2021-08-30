
SELECT  
    *
    --count(*)
FROM
    jyba.jyba_design_sources ds,
    jyba.jyba_ad_price_headers aph
WHERE 1 = 1
    --and ds.CUSTOMER_NUMBER = #{customerNumber}
    AND ds.IDMS_ORDER_NUMBER = aph.IDMS_ORDER_NUMBER
    AND aph.STATUS_CODE = 'A'
    AND aph.AD_TYPE = 'P'
    AND aph.ECOMMERCE_START_DATE < sysdate
    AND aph.ECOMMERCE_END_DATE >= trunc(sysdate)
    and ds.customer_name like '%Bryant%'
    ;