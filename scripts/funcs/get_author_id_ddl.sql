CREATE OR REPLACE FUNCTION get_author_id(
    author_name text, author_surname text)
RETURNS integer AS
$$
DECLARE
    author_id integer;
BEGIN
    SELECT id INTO author_id FROM libr.author
    WHERE libr.author.author_name = get_author_id.author_name 
	AND libr.author.author_surname = get_author_id.author_surname;
    RETURN author_id;
END;
$$
LANGUAGE plpgsql;
