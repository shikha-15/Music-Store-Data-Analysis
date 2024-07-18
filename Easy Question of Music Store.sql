Q1: Who is the senior most employee based on job title?

Select * from Employee order by levels desc limit 1

Q2:Which countries has most invoices?
Select count(*) as total_invoice, billing_country from invoice 
group by billing_country
order by total_invoice desc 
limit 1

Q3: What are top 3 values of total invoices?
Select total from invoice
order by total desc
 limit 3

4. Which city has the best customers? We would like to throw a promotional Music 
Festival in the city we made the most money. Write a query that returns one city that 
has the highest sum of invoice totals. Return both the city name & sum of all invoice 
totals 

Select sum(total) as invoice_total, billing_city from invoice
group by billing_city
order by invoice_total desc
limit 1

5. Who is the best customer? The customer who has spent the most money will be 
declared the best customer. Write a query that returns the person who has spent the 
most money 
Select c.customer_id, c.first_name, c.last_name, sum(i.total) from customer c 
join invoice i on c.customer_id=i.customer_id
group by c.customer_id
order by sum(i.total) desc
limit 1




