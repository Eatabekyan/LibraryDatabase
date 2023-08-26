CREATE OR REPLACE FUNCTION get_publisher_id(
    publisher_name text)
RETURNS integer AS
$$
DECLARE
    publisher_id integer;
BEGIN
    SELECT id INTO publisher_id FROM libr.publisher
    WHERE libr.publisher.publisher_name = get_publisher_id.publisher_name;
    RETURN publisher_id;
END;
$$
LANGUAGE plpgsql;
