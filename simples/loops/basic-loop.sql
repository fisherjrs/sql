FOR index IN lower_bound .. upper_bound
LOOP 
    statements; 
END LOOP;


BEGIN
  FOR l_counter IN 1..5
  LOOP
    DBMS_OUTPUT.PUT_LINE( l_counter );
  END LOOP;
END;

