--libr.author--
CREATE INDEX author_name_idx ON libr.author (author_name);
CREATE INDEX author_surname_idx ON libr.author (author_surname);

--libr.publisher--
CREATE INDEX publisher_name_idx ON libr.publisher (publisher_name);


--libr.book--
CREATE INDEX book_publisher_id_idx ON libr.book (publisher_id);
CREATE INDEX book_published_year_idx ON libr.book (published_year);

--libr.book_author--
CREATE INDEX book_author_book_id_idx ON libr.book_author (book_id);
CREATE INDEX book_author_author_id_idx ON libr.book_author (author_id);

--libr.reader--
CREATE INDEX reader_name_idx ON libr.reader (reader_name);
CREATE INDEX reader_surname_idx ON libr.reader (reader_surname);

--libr.rental--
CREATE INDEX rental_reader_id_idx ON libr.rental (reader_id);
CREATE INDEX rental_book_id_idx ON libr.rental (book_id);
