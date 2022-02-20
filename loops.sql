--sudo docker run --name oracleDB -p 3333:1521 -p 3334:5500 88c9188a7643

declare
    dep_name departments.name%type;
begin
    select name
    into dep_name
    from departments
    where depid = 1;
    
    dbms_output.put_line('dep_name '||dep_name);
end;




DECLARE
    i INTEGER := 0;
BEGIN
    LOOP
        i := i+1;
        DBMS_OUTPUT.put_line('i='||i);
        EXIT WHEN i>=10;
    END LOOP;
END;


DECLARE
    i INTEGER := 0;
BEGIN
	WHILE i < 10;
    LOOP
        i := i+1;
        DBMS_OUTPUT.put_line('i='||i);
    END LOOP;
END;



BEGIN
FOR i IN 1..10
    LOOP
        DBMS_OUTPUT.put_line('i='||i);
    END LOOP;
END;
