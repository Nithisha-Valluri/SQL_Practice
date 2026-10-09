--Lab 1 :

-- Given Schema
-- Book (bookID, title, genre, publishedYear)
-- Author (authorID, bookID, name, age)


--Question 1: Create the tables Book and Author with:
-- Appropriate data types
-- Primary keys
-- Foreign key constraint (Author.bookID → Book.bookID)
-- Domain constraints (age > 0, publishedYear > 1947, genre NOT NULL)
CREATE TABLE Book(
	bookID integer PRIMARY KEY,
	title varchar(256) NOT NULL,
	genre varchar(50) NOT NULL,
	publishedYear integer CHECK(publishedYear > 1947)
);

CREATE TABLE Author(
	authorID integer PRIMARY KEY,
	bookID integer,
	name varchar(256) NOT NULL,
	age integer CHECK(age > 0),
	FOREIGN KEY (bookID) REFERENCES Book(bookID)
);

--Question 2 : Insert the following records:
-- Book (1, '1984', 'Dystopian', 1949)
-- Author(1, 1, 'George Orwell', 46)

INSERT INTO Book VALUES(1, '1984', 'Dystopian', 1949);
INSERT INTO Author VALUES(1, 1, 'George Orwell', 46);

-- Question 3 : Insert the following records using bulk insert.
-- Book Table
-- (2, 'The Hobbit', 'Fantasy', 1937)
-- (3, 'To Kill a Mockingbird', 'Fiction', 1960)
-- (4, 'The Alchemist', 'Philosophy', 1988)
-- (5, 'Harry Potter and the Sorcerer''s Stone', 'Fantasy', 1997)
-- Author Table
-- (2, 2, 'J.R.R. Tolkien', 81)
-- (3, 3, 'Harper Lee', 89)
-- (4, 4, 'Paulo Coelho', 76)
-- (5, 5, 'J.K. Rowling', 58)
INSERT INTO Book (bookID, title, genre, publishedYear) VALUES
(2, 'The Hobbit', 'Fantasy', 1977),
(3, 'To Kill a Mockingbird', 'Fiction', 1960),
(4, 'The Alchemist', 'Philosophy', 1988),
(5, 'Harry Potter and the Sorcerer''s Stone', 'Fantasy', 1997)

INSERT INTO Author (authorID, bookID, name, age) VALUES
(2, 2, 'J.R.R. Tolkien', 81),
(3, 3, 'Harper Lee', 89),
(4, 4, 'Paulo Coelho', 76),
(5, 5, 'J.K. Rowling', 58)

-- Question 3 : Modify the Book table to add a column:
-- rating INTEGER DEFAULT 3
-- Update the ratings of the books in order:
-- (5, 4, 5, 4, 5)
ALTER TABLE Book ADD COLUMN rating INTEGER DEFAULT 3;

UPDATE Book SET rating = 5 WHERE bookID = 1;
UPDATE Book SET rating = 4 WHERE bookID = 2;
UPDATE Book SET rating = 5 WHERE bookID = 3;
UPDATE Book SET rating = 4 WHERE bookID = 4;
UPDATE Book SET rating = 5 WHERE bookID = 5;

--Question 4 : Queries
-- Display all records from the Book table.
SELECT* FROM book;
-- Display only the names and ages from the Author table.
SELECT name, age FROM Author;
-- Display names of authors who are older than 60.
SELECT name FROM Author WHERE age > 60;
-- List titles of books published after 1990.
SELECT title FROM book WHERE publishedYear > 1990;


-- Question 5 : Updation 
-- Increase the age of all authors who wrote Fantasy books by 1 year.
UPDATE Author 
SET age = age + 1 
WHERE bookID in (
	SELECT bookID 
	FROM Book 
	WHERE genre = 'Fantasy'
);
--  Display the Author table after update.
SELECT* FROM Author;