

DECLARE
    CURSOR table_cursor IS
        SELECT table_name
        FROM user_tables;
        
    table_name    VARCHAR2(30);
    column_name   VARCHAR2(30);
    column_type   VARCHAR2(30);
    sql_stmt      VARCHAR2(4000);
BEGIN
    FOR table_rec IN table_cursor LOOP
        table_name := table_rec.table_name;

        -- Handle Missing Values: Identify missing values
        sql_stmt := 'SELECT ''' || table_name || ''' AS table_name, column_name, COUNT(*) AS missing_values '
                 || 'FROM ' || table_name 
                 || ' WHERE ' || column_name || ' IS NULL '
                 || 'GROUP BY column_name';
        EXECUTE IMMEDIATE sql_stmt;

        -- Remove Duplicates: Check for and remove duplicate rows
        sql_stmt := 'DELETE FROM ' || table_name 
                 || ' WHERE rowid NOT IN (SELECT MIN(rowid) FROM ' || table_name 
                 || ' GROUP BY ' || column_name || ')';
        EXECUTE IMMEDIATE sql_stmt;

        -- Correct Errors: Identify and correct typos and inconsistencies
        -- Assuming Gender and Date columns for example purpose
        IF column_name = 'Gender' THEN
            sql_stmt := 'UPDATE ' || table_name 
                     || ' SET Gender = CASE WHEN Gender = ''Male'' THEN ''M'' WHEN Gender = ''Female'' THEN ''F'' ELSE Gender END';
            EXECUTE IMMEDIATE sql_stmt;
        ELSIF column_type LIKE 'DATE%' THEN
            sql_stmt := 'UPDATE ' || table_name 
                     || ' SET ' || column_name || ' = TO_DATE(' || column_name || ', ''YYYY-MM-DD'')';
            EXECUTE IMMEDIATE sql_stmt;
        END IF;

        -- Standardize Data: Convert data to consistent formats (e.g., dates, currencies)
        IF column_type LIKE 'VARCHAR2%' THEN
            sql_stmt := 'UPDATE ' || table_name 
                     || ' SET ' || column_name || ' = UPPER(' || column_name || ')';
            EXECUTE IMMEDIATE sql_stmt;
        ELSIF column_type LIKE 'NUMBER%' THEN
            sql_stmt := 'UPDATE ' || table_name 
                     || ' SET ' || column_name || ' = ROUND(' || column_name || ', 2)';
            EXECUTE IMMEDIATE sql_stmt;
        END IF;

        -- Handle Outliers: Identify outliers using IQR method
        sql_stmt := 'SELECT PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY ' || column_name || ') AS Q1, '
                 || 'PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY ' || column_name || ') AS Q3 '
                 || 'FROM ' || table_name;
        EXECUTE IMMEDIATE sql_stmt INTO v_Q1, v_Q3;

        sql_stmt := 'DELETE FROM ' || table_name 
                 || ' WHERE ' || column_name || ' < :v_Q1 OR ' || column_name || ' > :v_Q3';
        EXECUTE IMMEDIATE sql_stmt USING v_Q1, v_Q3;

        -- Validate Data: Ensure data types are correct and validate against known constraints
        sql_stmt := 'SELECT COUNT(*) FROM ' || table_name 
                 || ' WHERE ' || column_name || ' IS NOT NULL AND ' || column_name || ' NOT LIKE :constraint';
        EXECUTE IMMEDIATE sql_stmt INTO v_count USING constraint_value;

        DBMS_OUTPUT.PUT_LINE('Table: ' || table_name || ', Column: ' || column_name || ', Invalid Count: ' || v_count);
    END LOOP;
END;
/
