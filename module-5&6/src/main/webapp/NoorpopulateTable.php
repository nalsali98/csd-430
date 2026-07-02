<?php
$servername = "localhost";
$username = "student1";
$password = "pass";
$dbname = "CSD430";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO noormoviesdata (title, genre, director, releaseYear)
VALUES
('The Dark Knight','Action','Christopher Nolan',2008),
('Inception','Sci-Fi','Christopher Nolan',2010),
('Interstellar','Sci-Fi','Christopher Nolan',2014),
('Avatar','Sci-Fi','James Cameron',2009),
('Titanic','Romance','James Cameron',1997),
('The Matrix','Action','The Wachowskis',1999),
('Gladiator','Action','Ridley Scott',2000),
('Toy Story','Animation','John Lasseter',1995),
('Coco','Animation','Lee Unkrich',2017),
('Top Gun: Maverick','Action','Joseph Kosinski',2022)";

if ($conn->query($sql) === TRUE) {
    echo "10 records inserted successfully.";
} else {
    echo "Error inserting records: " . $conn->error;
}

$conn->close();
?>