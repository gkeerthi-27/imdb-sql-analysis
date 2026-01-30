-- Validate table row counts--
SELECT COUNT(*) AS movies_count FROM movies;
SELECT COUNT(*) AS actors_count FROM actors;
SELECT COUNT(*) AS genres_count FROM genres;
SELECT COUNT(*) AS movie_actors_count FROM movie_actors;
SELECT COUNT(*) AS movie_genres_count FROM movie_genres;

-- Check duplicate movie-actor mappings (should return zero rows)
SELECT movie_id, actor_id, COUNT(*) AS dup_count
FROM movie_actors
GROUP BY movie_id, actor_id
HAVING COUNT(*) > 1;

-- Sample movies with actors
SELECT
    m.title,
    a.actor_name
FROM movie_actors ma
JOIN movies m ON ma.movie_id = m.movie_id
JOIN actors a ON ma.actor_id = a.actor_id
LIMIT 10;

-- Sample movies with genres
SELECT
    m.title,
    g.genre_name
FROM movie_genres mg
JOIN movies m ON mg.movie_id = m.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
LIMIT 10;
