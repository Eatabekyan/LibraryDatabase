CREATE OR REPLACE FUNCTION libr.rental_rent_date() RETURNS TRIGGER AS $$
BEGIN
  NEW.rent_date := CURRENT_DATE;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER rental_rent_date_trigger
BEFORE INSERT ON libr.rental
FOR EACH ROW
EXECUTE FUNCTION libr.rental_rent_date();


--Пример Использования--
-- Вставка новой аренды без указания даты взятия
INSERT INTO libr.rental(reader_id, book_id)
VALUES(4, 33);