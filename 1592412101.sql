-- name: upgrade-1592412101
/**
  Add your comments here.
  Do remember to adjust the sql statements to taste.
*/
CREATE SEQUENCE public.book_pk_seq AS BIGINT;
CREATE TABLE public.book (pk BIGINT NOT NULL UNIQUE DEFAULT public.next_id('book_pk_seq'),
                                                            title TEXT NOT NULL,
                                                            author_pk BIGINT NOT NULL REFERENCES public.author(pk));


INSERT INTO public.migration_data (revision)
VALUES ('1592412101');

-- name: downgrade-1592412101
/**
  Add your comments here.
  Do remember to adjust the sql statements to taste.
*/
DROP SEQUENCE IF EXISTS public.book_pk_seq;
DROP TABLE IF EXISTS public.book;

DELETE
FROM public.migration_data
WHERE revision='1592412101';

