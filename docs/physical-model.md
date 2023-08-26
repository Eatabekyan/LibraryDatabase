# Физическая модель
___


##  Таблица `libr.author`:
| Название        | Описание              | Тип данных     | Ограничение   |
|-----------------|-----------------------|----------------|---------------|
| `id`            | Идентификатор автора   | `SERIAL`       | `PRIMARY KEY` |
| `author_name`   | Имя автора            | `TEXT`         | `NOT NULL`    |
| `author_surname`| Фамилия автора        | `TEXT`         | `NOT NULL`    |
| `birth_date`    | Дата рождения автора  | `DATE`         |               |
| `death_date`    | Дата смерти автора    | `DATE`         |               |



##  Таблица `libr.publisher`:
| Название        | Описание                 | Тип данных     | Ограничение   |
|-----------------|--------------------------|----------------|---------------|
| `id`            | Идентификатор издательства| `SERIAL`       | `PRIMARY KEY` |
| `publisher_name`| Название издательства    | `TEXT`         | `NOT NULL`    |
| `founding_year` | Год основания издательства| `SMALLINT`    |               |
| `country`       | Страна издательства      | `TEXT`         | `NOT NULL`    |



## Таблица `libr.book`:
| Название        | Описание                      | Тип данных     | Ограничение          |
|-----------------|-------------------------------|----------------|----------------------|
| `id`            | Идентификатор книги            | `SERIAL`       | `PRIMARY KEY`        |
| `title`         | Название книги                | `TEXT`         | `NOT NULL`           |
| `publisher_id`  | Идентификатор издательства    | `SERIAL`       | `NOT NULL`    `REFERENCES libr.publisher(id)  `     |
| `published_year`| Год публикации книги          | `INTEGER`      |                      |
| `pages_count`   | Количество страниц в книге    | `INTEGER`      |                      |



## Таблица `libr.reader`:
| Название        | Описание                 | Тип данных     | Ограничение   |
|-----------------|--------------------------|----------------|---------------|
| `id`            | Идентификатор читателя     | `SERIAL`       | `PRIMARY KEY` |
| `reader_name`   | Имя читателя             | `TEXT`         | `NOT NULL`    |
| `reader_surname`| Фамилия читателя         | `TEXT`         | `NOT NULL`    |
| `birth_date`    | Дата рождения читателя   | `SMALLINT`     |               |
| `address`       | Адрес читателя           | `TEXT`         |               |
| `phone`         | Телефон читателя         | `TEXT`         |               |
| `email`         | Электронная почта читателя| `TEXT`         |               |

## Таблица `libr.rental`:
| Название        | Описание                 | Тип данных     | Ограничение         |
|-----------------|--------------------------|----------------|---------------------|
| `id`            | Идентификатор аренды       | `SERIAL`       | `PRIMARY KEY`       |
| `reader_id`     | Идентификатор читателя     | `SERIAL`       | `NOT NULL`, `REFERENCES libr.reader(id)     `     |
| `book_id`       | Идентификатор книги        | `SERIAL`       | `NOT NULL`, `REFERENCES libr.book(id)`  |
| `rent_date`     | Дата начала аренды        | `DATE`         |                     |
| `return_date`   | Дата окончания аренды      | `DATE`         |                     |

## Таблица `libr.book_author`:
| Название        | Описание                 | Тип данных     | Ограничение         |
|-----------------|--------------------------|----------------|---------------------|
| `id`            | Идентификатор записи      | `SERIAL`       | `PRIMARY KEY`       |
| `book_id`       | Идентификатор книги       | `SERIAL`       | `NOT NULL`, `REFERENCES libr.book(id)` |
| `author_id`     | Идентификатор автора      | `SERIAL`       | `NOT NULL`, `REFERENCES libr.author(id)` |


## Таблица libr.book
```postgresql
CREATE TABLE libr.book(
	id SERIAL PRIMARY KEY,
	title TEXT NOT NULL,
	publisher_id SERIAL NOT NULL,
	FOREIGN KEY(publisher_id) REFERENCES libr.publisher(id),
	published_year INTEGER,
	pages_count INTEGER
);

```

## Таблица libr.author
```postgresql
CREATE TABLE libr.author(
	id SERIAL PRIMARY KEY,
	author_name TEXT NOT NULL,
	author_surname TEXT NOT NULL,
	birth_date DATE,
	death_date DATE
);
```
## Таблица libr.publisher
```postgresql
CREATE TABLE libr.publisher(
	id SERIAL PRIMARY KEY,
	publisher_name TEXT NOT NULL,
	founding_year SMALLINT,
	country TEXT NOT NULL
);

```
## Таблица libr.book_author
```postgresql
CREATE TABLE libr.book_author(
	id SERIAL PRIMARY KEY,
	book_id SERIAL NOT NULL,
	author_id SERIAL NOT NULL,
	FOREIGN KEY(book_id)  REFERENCES libr.book(id),
	FOREIGN KEY(author_id)  REFERENCES libr.author(id)
);

```
## Таблица libr.reader
```postgresql
CREATE TABLE libr.reader(
	id SERIAL PRIMARY KEY,
	reader_name TEXT NOT NULL,
	reader_surname TEXT NOT NULL,
	birth_date SMALLINT,
	address TEXT,
	phone TEXT,
	email TEXT
);
```

## Таблица libr.rental

```postgresql

CREATE TABLE libr.rental(
	id SERIAL PRIMARY KEY,
	reader_id SERIAL NOT NULL,
	book_id SERIAL NOT NULL,
	FOREIGN KEY (reader_id)  REFERENCES libr.reader(id),
	FOREIGN KEY (book_id)  REFERENCES libr.book(id),
	rent_date DATE,
	return_date DATE
);
```
