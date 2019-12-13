DO $atw$
DECLARE
    counter INTEGER :=0;
    users text[] := '{learn_sql_1, learn_sql_2, learn_sql_3, learn_sql_4, learn_sql_5, 
                      learn_sql_6, learn_sql_7, learn_sql_8, learn_sql_9, learn_sql_10, 
                      learn_sql_11, learn_sql_12, learn_sql_13, learn_sql_14, learn_sql_15, 
                      learn_sql_16, learn_sql_17, learn_sql_18, learn_sql_19, learn_sql_20,
                      kbm}';
    object_tc TEXT;
    db_name TEXT := 'trainings';
 BEGIN
    LOOP 
      EXIT WHEN counter = 21 ; 
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


