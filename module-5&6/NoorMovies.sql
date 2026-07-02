CREATE DATABASE IF NOT EXISTS CSD430;
USE CSD430;

CREATE TABLE noormoviesdata (
                                movieID INT AUTO_INCREMENT PRIMARY KEY,
                                title VARCHAR(100),
                                genre VARCHAR(50),
                                director VARCHAR(100),
                                releaseYear INT
);

INSERT INTO noormoviesdata (title, genre, director, releaseYear)
VALUES
    ('The Dark Knight', 'Action', 'Christopher Nolan', 2008),
    ('Inception', 'Sci-Fi', 'Christopher Nolan', 2010),
    ('Interstellar', 'Sci-Fi', 'Christopher Nolan', 2014),
    ('Avatar', 'Sci-Fi', 'James Cameron', 2009),
    ('Titanic', 'Romance', 'James Cameron', 1997),
    ('The Matrix', 'Action', 'The Wachowskis', 1999),
    ('Gladiator', 'Action', 'Ridley Scott', 2000),
    ('Toy Story', 'Animation', 'John Lasseter', 1995),
    ('Coco', 'Animation', 'Lee Unkrich', 2017),
    ('Top Gun: Maverick', 'Action', 'Joseph Kosinski', 2022);

SELECT * FROM noormoviesdata;