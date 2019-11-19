DO $atw$
DECLARE
    counter INTEGER :=0;
    users text[] := '{ge_sql_1, ge_sql_2, ge_sql_3, ge_sql_4, ge_sql_5, ge_sql_6, ge_sql_7, ge_sql_8, ge_sql_9, ge_sql_10}';
    object_tc TEXT;
    db_name TEXT := 'trainings';
 BEGIN
    LOOP 
      EXIT WHEN counter = 10 ; 
      counter := counter + 1 ; 

      object_tc := users[counter];
     
      IF EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_user
        WHERE  usename = object_tc) THEN
        
        EXECUTE 'DROP SCHEMA IF EXISTS ' || object_tc || ' CASCADE';
        EXECUTE 'REVOKE CONNECT ON DATABASE ' || db_name || ' FROM ' || object_tc;
        EXECUTE 'DROP USER IF EXISTS '|| object_tc ;
           
        END IF;

    END LOOP ; 

 END;
$atw$ LANGUAGE plpgsql;


