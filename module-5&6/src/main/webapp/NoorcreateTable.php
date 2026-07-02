<?php
$servername = "localhost";
$username = "student1";
$password = "pass";
$dbname = "CSD430";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "CREATE TABLE noormoviesdata (
    movieID INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    director VARCHAR(100),
    releaseYear INT
)";

if ($conn->query($sql) === TRUE) {
    echo "Table noormoviesdata created successfully.";
} else {
    echo "Error creating table: " . $conn->error;
}

$conn->close();
?>