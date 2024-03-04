use moviesdb;
select* from movies;
--#Retrieve movies released in a  year 2021 :
select * from movies where release_year=2021;
--#Retrieve movies with a rating above 7:
select * from movies where imdb_rating>7;
--#Retrieve movies where the title contains a specific keyword (partial match):
select * from  movies where title like "%thor%";
--#Retrieve the number of movies released each year:
select release_year,count(*) as moviescount  from movies  group by release_year order by moviescount desc ;

select*from actors;
--#Retrieve actors born between two years:
select * from actors where birth_year between 1986 and 1990;
--#Retrieve actors age:
select *,year(curdate())-birth_year as age from actors ;
--#Retrieve actors age between 30 to 50:
select * from actors where age between 30 and 50;
--#Retrieve actors ordered by name alphabetically:
select *from actors order by name;
---#Retrieve all movies and their associated actors:
select a.name,m.title
from movies m join movie_actor ma
on m.movie_id=ma.movie_id
JOIN actors a ON ma.actor_id = a.actor_id;
---#Retrieve all movies along with their budget and revenue:
select m.movie_id,m.title,f.budget,f.revenue
from movies m join financials f on m.movie_id=f.movie_id;

--#Retrieve movies with profit:
select*,(revenue-budget)as profit from financials;
--#convert usd into inr:
select*,If(currency="USD",revenue*82,revenue) as revenue_inr from financials;
--#Retrieve movies where the revenue exceeds the budget:
select m.movie_id,m.title,f.budget,f.revenue
from movies m join financials f on m.movie_id=f.movie_id
 where revenue>budget;
 
 ---#Find the movies with the highest IMDB rating:
select *from movies where imdb_rating=(select max(imdb_rating)from movies);
--#Find the actors who have appeared in the most movies:
Select actor_id ,name from actors where actor_id= (select actor_id from movie_actor group by actor_id order by count(movie_id)   desc limit 1);

--#doubt#Find the actors who were born in the same year as the actor with the highest number of appearances in movies:
SELECT actor_id, name
FROM actors
WHERE birth_year = (
    SELECT birth_year
    FROM actors
    WHERE actor_id = (
        SELECT actor_id
        FROM movie_actor
        GROUP BY actor_id
        ORDER BY COUNT(movie_id) DESC
        LIMIT 1
    )
);



