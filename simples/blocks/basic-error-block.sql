DECLARE
	v_updated_rows		NUMBER;
	v_expected_rows		NUMBER;

BEGIN
	DBMS_OUTPUT.ENABLE(100000);
	DBMS_OUTPUT.PUT_LINE('run it.');

	v_updated_rows := 0;
    v_expected_rows := 1;

	IF v_updated_rows <> v_expected_rows THEN
		RAISE_APPLICATION_ERROR(-20003, 'Error: creating io_numbers for ad_orders. Updated ' || v_updated_rows || '. Expected: ' || v_expected_rows);
	END IF;
	
	DBMS_OUTPUT.PUT_LINE('Successfully generated io_numbers for ' || v_updated_rows || ' transferred business ads.');
END;
/