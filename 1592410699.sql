-- name: upgrade-1592410699
/**
  creates the `migration_data` table 
*/


CREATE TABLE IF NOT EXISTS public.migration_data (revision VARCHAR (15) NOT NULL PRIMARY KEY);
INSERT INTO public.migration_data (revision) VALUES ('1592410699') ON CONFLICT ( revision ) DO NOTHING;


-- name: downgrade-1592410699
/**
  drops the `migration_data` table
*/

DROP TABLE IF EXISTS public.migration_data;
