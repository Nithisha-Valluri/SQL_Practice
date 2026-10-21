--Question 1 :
-- Display the film title, rental rate, and rating of films  whose rental rate is either 0.99 or 2.99
-- AND rating is not ‘PG-13’. Rename columns as Movie, Rate, and Certificate.      

SELECT title as Movie, rental_rate as Rate, rating as Certificate 
FROM film
WHERE (rental_rate BETWEEN 0.99 AND 2.99) AND rating <> 'PG-13';

--Question 2 :
-- Display the title in uppercase and the length of the title 
-- for all films that contain the word ‘Love’(case insensitive) in their description.  
SELECT UPPER(title) as Title, LENGTH(title) as length_of_title
FROM film
WHERE description ILIKE '%love%';

--Question 3 :
--Write an SQL query to extract the first word from the title column in the film table, 
--add the ‘>’ character in front of it to a total width of 20 characters, and display. 	         	      (2)                       
--Sample output :  “>>>>>>>>>>>>>>first_word_of_title”    
SELECT LPAD(SPLIT_PART(title,' ',1),20,'>')
FROM film;


--Question 4 :
-- Display the top 5 customers whose full names (first name + last name) have the maximum total length.
-- Customer's full name in uppercase and
-- Length of the full name          
-- Rename the columns as Customer_Name and Name_Length.                            
SELECT UPPER(first_name ||' '|| last_name) AS customer_name, LENGTH(first_name ||' '|| last_name) AS name_length
FROM customer
ORDER BY name_length DESC
LIMIT 5;

--Question 5 :
--Display the film title and its length for all films whose title length is greater than 10 characters
--and whose description contains the word “Drama” (case-insensitive).         
SELECT title, LENGTH(title) as title_length
FROM film
WHERE (LENGTH(title) > 10) AND (description ILIKE '%drama%');


--Question 6 : 
--Insert a new actor into the actor table such that:
--The first name is converted to uppercase
--The last name is converted to lowercase
--The actor name should be derived from a single string 'Rajesh Khanna'. 

INSERT INTO actor(first_name, last_name) VALUES(UPPER(SPLIT_PART('Rajesh Khanna',' ',1)), LOWER(SPLIT_PART('Rajesh Khanna',' ',2)));
SELECT* FROM actor;

--Question 7 :
--Delete all films from the film table whose title starts with the letter ‘Z’.
DELETE FROM film
WHERE title ILIKE 'z%';


--Question 8 :
--Display the full name of customers by concatenating their first name and last name in the format:
--FirstName LastName
--Rename the column as Customer_Name.                                                               
SELECT first_name ||' '|| last_name as Customer_name
FROM customer;
