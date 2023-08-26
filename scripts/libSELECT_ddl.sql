-- Запрос 1. Вывести название книги, количество страниц и год издания для всех книг,
--изданных позже 1800 года, отсортированных по количеству страниц по убыванию.

SELECT title, pages_count, published_year 
FROM libr.book 
WHERE published_year > 1800 
ORDER BY pages_count DESC;



-- Запрос 2. Вывести количество книг, написанных каждым автором,
-- которые были изданы после 1900 года, 
-- и отсортировать результаты по количеству книг по убыванию.

SELECT a.author_name, a.author_surname, COUNT(*) AS book_count 
FROM libr.book_author ba 
JOIN libr.book b ON ba.book_id = b.id 
JOIN libr.author a ON ba.author_id = a.id 
WHERE b.published_year > 1900 
GROUP BY a.author_name, a.author_surname 
ORDER BY book_count DESC;



-- Запрос 3. Вывести список издательств, которые издали более 1 книг,
-- и среднее количество страниц в их книгах больше 200.

SELECT p.publisher_name, COUNT(*) AS book_count, AVG(b.pages_count) AS avg_pages 
FROM libr.publisher p 
JOIN libr.book b ON b.publisher_id = p.id 
GROUP BY p.publisher_name 
HAVING COUNT(*) > 1 AND AVG(b.pages_count) > 200;



-- Запрос 4. Вывести список авторов, у которых более 3 книг в базе данных,
-- отсортированных по дате рождения по возрастанию.

SELECT a.author_name, a.author_surname, a.birth_date 
FROM libr.author a 
JOIN libr.book_author ba ON ba.author_id = a.id 
GROUP BY a.author_name, a.author_surname, a.birth_date 
HAVING COUNT(*) > 2
ORDER BY a.birth_date ASC;



-- Запрос 5. Вывести список книг, отсортированных по году издания по возрастанию, 
-- и для каждой книги вывести ее порядковый номер в списке книг с таким же годом издания.

SELECT 
   b.title, 
   b.published_year, 
   ROW_NUMBER() OVER (PARTITION BY b.published_year ORDER BY b.title ASC) AS book_number 
FROM libr.book b 
ORDER BY b.published_year ASC;


-- Запрос 6. Вывести список авторов и количество книг,
-- написанных каждым автором,
-- и для каждого автора вывести номер его места в рейтинге
-- авторов по количеству книг (от большего к меньшему).

SELECT 
   a.author_name, 
   a.author_surname, 
   COUNT(*) AS book_count, 
   RANK() OVER (ORDER BY COUNT(*) DESC) AS author_rank 
FROM libr.author a 
JOIN libr.book_author ba ON ba.author_id = a.id 
GROUP BY a.author_name, a.author_surname 
ORDER BY book_count DESC;