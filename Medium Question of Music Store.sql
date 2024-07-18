--Q1. Write query to return the email, first name, last name, & Genre of all Rock Music 
--listeners. Return your list ordered alphabetically by email starting with A?

Select distinct c.email, c.first_name, c.last_name from customer c join
invoice i on c.customer_id=i.customer_id join
invoice_line il on il.invoice_id=i.invoice_id
	where il.track_id in (
	Select t.track_id from track t 
	join genre g on t.genre_id=g.genre_id
	where g.name like 'Rock'
	)
order by c.email
	
--Q 2. Lets invite the artist who have written  the most rock music in  our dataset. Write a 
--query that returns the Artist name and total track count of the top 10 rock bands 

Select ar.artist_id, ar.name, count(ar.artist_id) as number_of_songs
from track t
join album a on t.album_id=a.album_id
join artist ar on ar.artist_id=a.artist_id
join genre g on g.genre_id=t.genre_id
where g.name like 'Rock'
	group by ar.artist_id
order by number_of_songs desc 
	limit 10


--3. Return all the track names that have a song length longer than the average song length. 
--Return the Name and Milliseconds for each track. Order by the song length with the 
--longest songs listed first
Select name, milliseconds from track 
where milliseconds>(
	Select avg(milliseconds) as avg_track_length from track)
order by milliseconds desc;
)

