CREATE SCHEMA libr;

CREATE TABLE libr.author(
	id SERIAL PRIMARY KEY,
	author_name TEXT NOT NULL,
	author_surname TEXT NOT NULL,
	birth_date DATE,
	death_date DATE
);

CREATE TABLE libr.publisher(
	id SERIAL PRIMARY KEY,
	publisher_name TEXT NOT NULL,
	founding_year SMALLINT,
	country TEXT NOT NULL
);

CREATE TABLE libr.book(
	id SERIAL PRIMARY KEY,
	title TEXT NOT NULL,
	publisher_id SERIAL NOT NULL,
	FOREIGN KEY(publisher_id) REFERENCES libr.publisher(id),
	published_year INTEGER,
	pages_count INTEGER
);



CREATE TABLE libr.book_author(
	id SERIAL PRIMARY KEY,
	book_id SERIAL NOT NULL,
	author_id SERIAL NOT NULL,
	FOREIGN KEY(book_id)  REFERENCES libr.book(id),
	FOREIGN KEY(author_id)  REFERENCES libr.author(id)
);



CREATE TABLE libr.reader(
	id SERIAL PRIMARY KEY,
	reader_name TEXT NOT NULL,
	reader_surname TEXT NOT NULL,
	birth_date SMALLINT,
	address TEXT,
	phone TEXT,
	email TEXT
);

CREATE TABLE libr.rental(
	id SERIAL PRIMARY KEY,
	reader_id SERIAL NOT NULL,
	book_id SERIAL NOT NULL,
	FOREIGN KEY (reader_id)  REFERENCES libr.reader(id),
	FOREIGN KEY (book_id)  REFERENCES libr.book(id),
	rent_date DATE,
	return_date DATE
);