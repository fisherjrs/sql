DECLARE
	v_updated_rows		NUMBER;
	v_expected_rows		NUMBER;

BEGIN
    FOR record IN (select * from fishej2.ybplusjobstoenroll)
    LOOP
        DBMS_OUTPUT.ENABLE(100000);
        DBMS_OUTPUT.PUT_LINE('process job number ' || record.job_number || ' job year ' || record.job_year);
    END LOOP; 

END;
/