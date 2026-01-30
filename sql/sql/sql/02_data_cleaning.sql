-- Clean runtime column(text-integer)--
insert into movies(title, release_year, runtime, director)
select distinct
Series_Title,
Released_Year,
cast(replace(runtime,'min','') as unsigned),
Director
from`movies.csv`;
-- Fix UTF-8 encoding issues in actor names--
update actors
set actor_name =
convert(
cast(actor_name as binary)
using utf8mb4
)
where actor_id in (
select actor_id
from (select actor_id
from actors
where actor_name like '%Ã%'
) t
);
--insert rating into rating tabel--
insert into ratings (movie_id, imdb_rating, votes)
select
m.movie_id,
r.IMDB_Rating,
cast(replace(r.No_of_Votes, ',', '') as unsigned)
from `movies.csv` r
join movies m
on r.Series_Title = m.title;
--Normalize actors--
insert into actors(actor_name)
select distinct star1 from `movies.csv`
union
select distinct star2 from `movies.csv`
union
select distinct star3 from `movies.csv`
union
select distinct star4 from `movies.csv`;
select * from actors

-- Map movies to actors--
insert ignore into movie_actors (movie_id, actor_id)
select m.movie_id, a.actor_id
from `movies.csv` r
join movies m on r.series_title = m.title
join actors a on a.actor_name = r.star1

UNION ALL

select m.movie_id, a.actor_id
from `movies.csv` r
join movies m on r.series_title = m.title
join actors a on a.actor_name = r.star2

UNION ALL

select m.movie_id, a.actor_id
from `movies.csv` r
join movies m on r.series_title = m.title
join actors a on a.actor_name = r.star3

UNION ALL

Select m.movie_id, a.actor_id
from `movies.csv` r
join movies m on r.series_title = m.title
join actors a on a.actor_name = r.star4;

-- Insert unique genres--
insert into genres ( genre_name)
select distinct trim(substring_index(substring_index(genre,',',n.n),',',-1))
from `movies.csv`
join(
select 1 n union select 2 union select 3 union select 4)n
where n.n<=1+length(genre)-length(replace(genre,',',''));
-- Map movies to genres--
insert into movie_genres(movie_id,genre_id)
select m.movie_id,g.genre_id
from`movies.csv` r
join movies m on r.series_title=m.title
join genres g 
on find_in_set(g.genre_name,r.genre)>0;






































































