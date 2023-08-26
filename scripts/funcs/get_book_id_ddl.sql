CREATE OR REPLACE FUNCTION get_book_id(
    title text)
RETURNS integer AS
$$
DECLARE
    book_id integer;
BEGIN
    SELECT id INTO book_id FROM libr.book
    WHERE libr.book.title = get_book_id.title;
    RETURN book_id;
END;
$$
LANGUAGE plpgsql;
