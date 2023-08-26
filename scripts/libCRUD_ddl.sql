

--1. INSERT запрос для добавления нового автора:--

INSERT INTO libr.author (author_name, author_surname, birth_date, death_date)
VALUES ('J.K.', 'Rowling', '1965-07-31', NULL);


-- 2. SELECT запрос для выборки всех книг, изданных в определенном году:

SELECT * FROM libr.book WHERE published_year = 2022;


-- 3. UPDATE запрос для изменения названия книги:

UPDATE libr.book SET title = 'The Great Gatsby' WHERE id = 1;


-- 4. DELETE запрос для удаления издательства:

DELETE FROM libr.publisher WHERE id = 3;


-- 5. SELECT запрос для выборки всех книг, написанных определенным автором:


SELECT book.title FROM libr.book_author
JOIN libr.book ON libr.book_author.book_id = libr.book.id
JOIN libr.author ON libr.book_author.author_id = libr.author.id
WHERE author.author_surname = 'Tolkien';


-- 6. INSERT запрос для добавления нового издательства:

INSERT INTO libr.publisher (publisher_name, founding_year, country)
VALUES ('Penguin Random House', 1925, 'USA');


-- 7. UPDATE запрос для изменения даты выдачи книги:

UPDATE libr.rental SET rent_date = '2023-05-01' WHERE id = 2;
UPDATE libr.rental SET return_date = Null WHERE id = 4;



-- 8. DELETE запрос для удаления читателя:

DELETE FROM libr.reader WHERE id = 5;


-- 9. SELECT запрос для выборки всех авторов, родившихся в определенном году:


SELECT * FROM libr.author WHERE birth_date = '1980-01-01';


-- 10. INSERT запрос для добавления новой аренды:

INSERT INTO libr.rental (reader_id, book_id, rent_date, return_date)
VALUES (2, 33, '2023-05-02', NULL);

-- 7. UPDATE запрос для изменения даты возврата книги:

UPDATE libr.rental SET return_date = '2023-05-10' WHERE id = 4;