--Top Actors by Average IMDb Rating--
select 
a.actor_name,
count(*) as movie_count,
round(avg(m.imdb_rating),2) as avg_rating
from movie_actors ma
join actors a on ma.actor_id=a.actor_id
join movies m on ma.movie_id=m.movie_id
group by a.actor_name
having count(*)>=5
order by avg_rating desc;
--Rank Movies Within Each Release Year--
select 
title,release_year,imdb_rating,
rank()over(partition by release_year order by imdb_rating desc)
as movie_rank 
from movies; 
-- Highest-Rated Directors--
select director,
count(*) as movie_count,
round(avg(imdb_rating),2) as avg_rating
from movies
group by director
having count(*)>=3
order by avg_rating desc;
