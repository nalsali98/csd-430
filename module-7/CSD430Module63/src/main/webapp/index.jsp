<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.bellevue.beans.MovieDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
    // Create the DAO object and retrieve all existing movie IDs.
    MovieDAO dao = new MovieDAO();
    ArrayList<Integer> ids = dao.getMovieIDs();
%>

<!DOCTYPE html>
<html>
<head>
    <title>CSD430 Module 7 - Movie Database</title>
</head>

<body>

<h1>CSD430 Movie Database</h1>

<h2>Project Part 2 - Create Movie Record</h2>

<p>
    Use the form below to add a new movie record to the CSD430 database.
    The movie ID will be generated automatically by the database.
</p>

<form action="createMovie.jsp" method="post">

    <label for="title">Movie Title:</label><br>
    <input type="text" id="title" name="title" required>

    <br><br>

    <label for="genre">Genre:</label><br>
    <input type="text" id="genre" name="genre" required>

    <br><br>

    <label for="director">Director:</label><br>
    <input type="text" id="director" name="director" required>

    <br><br>

    <label for="releaseYear">Release Year:</label><br>
    <input type="number"
           id="releaseYear"
           name="releaseYear"
           min="1888"
           max="2100"
           required>

    <br><br>

    <input type="submit" value="Add Movie">

</form>

<hr>

<h2>Display an Existing Movie</h2>

<p>Select a Movie ID:</p>

<form action="display.jsp" method="get">

    <select name="movieID">

        <% for (Integer id : ids) { %>

            <option value="<%= id %>"><%= id %></option>

        <% } %>

    </select>

    <br><br>

    <input type="submit" value="Display Movie">

</form>

</body>
</html>