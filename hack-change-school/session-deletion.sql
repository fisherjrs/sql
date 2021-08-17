DECLARE
	v_updated_rows		NUMBER;
	v_expected_rows		NUMBER;

BEGIN
	DBMS_OUTPUT.ENABLE(100000);
	DBMS_OUTPUT.PUT_LINE('run it.');

	v_updated_rows := 0;
    v_expected_rows := 15000;

    delete from jyba.jyba_sessions s
    where s.session_id in (
        select session_id from fishej2.sessions_hack
    );

    v_updated_rows := sql%rowcount;

	IF v_updated_rows <> v_expected_rows THEN
		RAISE_APPLICATION_ERROR(-20003, 'Error:  ' || v_updated_rows || '. Expected: ' || v_expected_rows);
	END IF;
	
	DBMS_OUTPUT.PUT_LINE('Successfully generated io_numbers for ' || v_updated_rows || ' transferred business ads.');
END;
/