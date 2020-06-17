-- name: upgrade-1592411740
/**
  Add your comments here.
  Do remember to adjust the sql statements to taste.
*/
CREATE SEQUENCE public.author_pk_seq AS BIGINT;
CREATE TABLE public.author (pk BIGINT NOT NULL UNIQUE DEFAULT public.next_id('author_pk_seq'),
                                                              fullname VARCHAR(150) NOT NULL);


INSERT INTO public.migration_data (revision)
VALUES ('1592411740');

-- name: downgrade-1592411740
/**
  Add your comments here.
  Do remember to adjust the sql statements to taste.
*/
DROP SEQUENCE IF EXISTS public.author_pk_seq;
DROP TABLE IF EXISTS public.author;

DELETE
FROM public.migration_data
WHERE revision='1592411740';

