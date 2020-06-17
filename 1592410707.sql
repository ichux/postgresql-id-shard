-- name: upgrade-1592410707
/**
  Add your comments here.
  Do remember to adjust the sql statements to taste.
*/
CREATE FUNCTION public.next_id(sequence_name TEXT, OUT RESULT BIGINT) AS $$
DECLARE
	epoch_2020_ms  BIGINT := 1577836800000; -- 2020-01-01 00:00:00
	sequence_id     BIGINT;
	epoch_now_ms BIGINT;
BEGIN
	SELECT nextval(sequence_name) % 1024 INTO sequence_id;
	SELECT FLOOR(EXTRACT(EPOCH FROM clock_timestamp()) * 1000) INTO epoch_now_ms;

	result := ((epoch_now_ms - epoch_2020_ms) << 10) | sequence_id;
END;
$$ LANGUAGE PLPGSQL;


INSERT INTO public.migration_data (revision)
VALUES ('1592410707');

-- name: downgrade-1592410707
/**
  Add your comments here.
  Do remember to adjust the sql statements to taste.
*/
DROP FUNCTION IF EXISTS public.next_id;

DELETE
FROM public.migration_data
WHERE revision='1592410707';

