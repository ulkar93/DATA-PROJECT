--Review Data Structure in Dynamic SQL
DECLARE
    CURSOR table_cursor IS
        SELECT table_name
        FROM user_tables;

    table_name VARCHAR2(30);
    sql_stmt   VARCHAR2(1000);
BEGIN
    FOR table_rec IN table_cursor LOOP
        table_name := table_rec.table_name;

        sql_stmt := 'SELECT ''' || table_name || ''' AS table_name, column_name, data_type '
                 || 'FROM all_tab_columns '
                 || 'WHERE table_name = ''' || table_name || '''';

        EXECUTE IMMEDIATE sql_stmt;
    END LOOP;
END;
/