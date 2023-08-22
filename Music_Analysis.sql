-- Senior most Employee

SELECT * FROM employee
ORDER BY levels DESC

--Most Invoices by Country

Select Count(*), billing_country 
From invoice
Group By billing_country
Order By Count Desc

--  Top Three values in Total in Invoice

SELECT * FROM invoice
ORDER BY total DESC
LIMIT 3

-- Best City by Sales

SELECT SUM (total) as invoice_total, billing_city
FROM invoice
GROUP BY billing_city
ORDER BY invoice_total DESC

--Best Customer

SELECT customer.customer_id, 
customer.first_name,
customer.last_name,
SUM(total) as invoice_total 
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY invoice_total DESC
LIMIT 1

-- OUTPUT EMAIL, FIRST_NAME, LAST_NAME & GENRE where genre ROCK

-- SELECT * FROM genre

SELECT email, first_name, last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_Id
JOIN Track ON invoice_line.Track_Id = Track.Track_Id
JOIN Genre ON Track.Genre_Id = Genre.Genre_Id
WHERE Genre.Name LIKE 'Rock'
GROUP BY customer.first_name, customer.last_name, customer.email
ORDER BY email

--Artist ID with Highest Tracks

SELECT artist.name, COUNT(track.track_id) as track_count
FROM track
JOIN genre ON genre.genre_id = track.genre_id
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
WHERE genre.Name Like 'Rock'
GROUP BY artist.name
ORDER BY track_count DESC
LIMIT 10

--Longest Track

SELECT name, milliseconds FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds) FROM track)
ORDER BY track.milliseconds DESC
LIMIT 1

