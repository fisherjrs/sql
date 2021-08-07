DECLARE
	v_updated_rows		NUMBER;
	v_expected_rows		NUMBER;

    CURSOR c_record IS
        select * from fishej2.ybplusjobstoenroll;
BEGIN
    FOR r_record IN c_record
    LOOP
        DBMS_OUTPUT.ENABLE(100000);
        DBMS_OUTPUT.PUT_LINE('process job number ' || r_record.job_number || ' job year ' || r_record.job_year);
    END LOOP; 
END;
/