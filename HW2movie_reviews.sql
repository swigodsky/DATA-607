DROP TABLE IF EXISTS moviereviewer;
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS reviewer;


CREATE TABLE movie(
	movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(100)
);

INSERT INTO movie(movie_name)
VALUES
('Wonderwoman'), ('Spiderman'), ('Fantastic Beasts'), ('Fences'), ('Zootopia'), ('The Jungle Book');


CREATE TABLE reviewer(
	reviewer_id INT AUTO_INCREMENT PRIMARY KEY,
    reviewer_name VARCHAR (100)
);

INSERT INTO reviewer(reviewer_name)
VALUES
('Sarah'), ('Dan'), ('Nadav'), ('Alon'), ('Deena'), ('David'), ('Robin');


CREATE TABLE moviereviewer(
	moviereviewer_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    reviewer_id INT,
    rating INT,
	CONSTRAINT FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE SET NULL,
	CONSTRAINT FOREIGN KEY (reviewer_id) REFERENCES reviewer(reviewer_id) ON DELETE SET NULL
);
    
INSERT INTO moviereviewer(movie_id, reviewer_id, rating)
VALUES
(1, 1, 4),
(1, 3, 3),
(1, 4, 4),
(1, 5, 5),
(1, 7, 4),
(2, 7, 2),
(2, 4, 3),
(2, 5, 4),
(3, 1, 3),
(3, 2, 3),
(3, 3, 3),
(3, 4, 3),
(3, 5, 4),
(4, 1, 5),
(4, 2, 5),
(5, 1, 5),
(5, 7, 5),
(5, 4, 4),
(6, 6, 4),
(6, 1, 5),
(6, 5, 5);

SELECT m.movie_name AS 'Movie Name', r.reviewer_name AS 'Reviewer', mr.rating AS 'Rating' FROM movie m
LEFT JOIN moviereviewer mr
ON m.movie_id = mr.movie_id 
LEFT JOIN reviewer r
ON mr.reviewer_id = r.reviewer_id
ORDER BY m.movie_name ASC;

SELECT m.movie_name AS 'Movie Name', r.reviewer_name AS 'Reviewer', mr.rating AS 'Rating'
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/moviereviewers2.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
FROM movie m
LEFT JOIN moviereviewer mr
ON m.movie_id = mr.movie_id 
LEFT JOIN reviewer r
ON mr.reviewer_id = r.reviewer_id
ORDER BY m.movie_name ASC;

#code for INTO OUTFILE and LINES TERMINATE BY came from Hands on lab export SQL to csv
#added  fields terminated by from stackeoverflow
#https://stackoverflow.com/questions/31951468/error-code-1290-the-mysql-server-is-running-with-the-secure-file-priv-option
