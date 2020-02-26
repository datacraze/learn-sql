DO $atw$
DECLARE
    counter INTEGER :=0;
    object_tc TEXT;
    db_name TEXT := 'trainings';
 BEGIN
    LOOP 
      EXIT WHEN counter = 51; 
      object_tc := 'learn_sql_'||counter;
      counter := counter + 1 ;
     
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


