This project analyzes IMDb movie data using MySQL.
The raw dataset was cleaned, normalized, and transformed into a relational database, followed by advanced SQL queries to extract insights about movies, actors, directors, and genres.
The objective of this project is to demonstrate strong SQL fundamentals, database design, and analytical querying skills.

Tech Stack
Database: MySQL
Language: SQL
Tools: MySQL Workbench
Data Source: IMDb Movies Dataset (CSV)

Dataset Description
The dataset contains information such as:
Movie title
Release year
Runtime
IMDb rating
Director
Actors (Star1–Star4)
Genres

The raw CSV file was imported into MySQL and then transformed into normalized tables.

 Database Schema (Normalized)
Tables Created
movies – Stores movie details and IMDb ratings
actors – Stores unique actor names
movie_actors – Junction table handling the many-to-many relationship between movies and actors
genres – Stores unique genre names
movie_genres – Junction table mapping movies to genres

✔ Implemented primary key and foreign key constraints

✔Used composite primary keys in junction tables


Data Cleaning & Transformation
Converted runtime values from text ("142 min") to integers
Fixed character encoding issues (UTF-8)
Removed duplicate records using INSERT IGNORE
Normalized multi-valued columns (actors and genres) using UNION ALL

Key SQL Analyses

Top 10 movies by IMDb rating

 Top actors by average IMDb rating

 Ranking movies within each release year using window functions

 Highest-rated directors

SQL Concepts Demonstrated
Database normalization (1NF–3NF)
Many-to-many relationships
INNER JOINs
Aggregate functions (AVG, COUNT)
HAVING clause
Window functions (RANK, ROW_NUMBER)
Data cleaning and transformation
Error handling and debugging

 Key Insights
Identified consistently high-performing actors and directors
Ranked movies within each release year
Analyzed genre distribution across movies
Built a scalable and reusable relational database schema

Why This Project Matters
This project reflects real-world SQL usage, including:
Working with messy raw data
Designing normalized relational schemas
Writing analytical SQL queries
Debugging SQL errors professionally
