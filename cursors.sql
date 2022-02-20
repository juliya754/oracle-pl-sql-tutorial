--implicit cursor

DECLARE
    dep_cur departments%ROWTYPE;
BEGIN
    SELECT *
    INTO dep_cur
    FROM departments
    WHERE depid = 1;
    
    IF SQL%FOUND
    THEN
        DBMS_OUTPUT.put_line(SQL%rowcount);
    END IF;
END;

--explicit cursor

BEGIN
    FOR i IN (SELECT depid,name
        FROM departments
        WHERE depid=3)
    LOOP
        DBMS_OUTPUT.put_line('Department id ' || i.depid || ', Department name ' || i.name);
    END LOOP;
END;


DECLARE
    v_id departments.depid%TYPE;
    v_name departments.name%TYPE;

    CURSOR get_dep
    IS
        SELECT depid,name
        FROM departments
        WHERE depid=3;
BEGIN
    OPEN get_dep;
    FETCH get_dep INTO v_id, v_name;
    
    WHILE get_dep%FOUND
    LOOP
        DBMS_OUTPUT.put_line('Department id ' || v_id || ', Department name ' || v_name);
        FETCH get_dep INTO v_id, v_name;
    END LOOP;
    CLOSE get_dep;
END;
