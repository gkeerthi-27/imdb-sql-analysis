-- Movies table--
create table movies(
movie_id int primary key auto_increment,
title varchar(225),
release_year int,
runtime int,
director varchar(225)
);
-- Actors table--
create table actors(
actor_id int primary key auto_increment,
actor_name varchar(225) unique 
);
-- Movie–Actors relationship (many-to-many)--
create table movie_actors(
movie_id int,
actor_id int,
primary key (movie_id,actor_id),
foreign key (movie_id) references movies(movie_id),
foreign key (actor_id) references actors(actor_id)
); 
-- Genres table--
create table genres(
genre_id int primary key auto_increment,
genre_name varchar(225) unique
);
-- Movie–Genres relationship (many-to-many)--
create table movie_genres(
movie_id int,
genre_id int,
primary key (movie_id,genre_id),
foreign key(movie_id) references movies(movie_id),
foreign key (genre_id)references genres(genre_id)
);
