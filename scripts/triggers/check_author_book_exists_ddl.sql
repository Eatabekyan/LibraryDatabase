--проверяет наличие автора и книги перед добавлением записи в таблицу "libr.book_author".
-- В случае, если один из них не существует, триггер генерирует исключение.


CREATE OR REPLACE FUNCTION check_author_book_exists()
RETURNS TRIGGER AS $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM libr.author WHERE id = NEW.author_id) THEN
    RAISE EXCEPTION 'Author with id % does not exist', NEW.author_id;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM libr.book WHERE id = NEW.book_id) THEN
    RAISE EXCEPTION 'Book with id % does not exist', NEW.book_id;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_author_book_exists_trigger
BEFORE INSERT ON libr.book_author
FOR EACH ROW
EXECUTE FUNCTION check_author_book_exists();