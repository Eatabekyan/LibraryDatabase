CREATE OR REPLACE FUNCTION insert_book(
  title_ text,
  author_name_ text,
  author_surname_ text,
  publisher_name_ text,
  published_year_ integer,
  pages_count_ integer
) RETURNS VOID AS $$
BEGIN
  INSERT INTO libr.book (title, publisher_id, published_year, pages_count)
  VALUES (title_, get_publisher_id(publisher_name_), published_year_, pages_count_);
  
  INSERT INTO libr.book_author (book_id, author_id)
  VALUES (get_book_id(title_), get_author_id(author_name_,author_surname_));
END;
$$ LANGUAGE plpgsql;