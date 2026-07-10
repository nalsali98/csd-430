<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.bellevue.beans.MovieBean" %>
<%@ page import="edu.bellevue.beans.MovieDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
    String title = request.getParameter("title");
    String genre = request.getParameter("genre");
    String director = request.getParameter("director");
    String releaseYearValue = request.getParameter("releaseYear");

    String message = "";

    try {

        MovieBean movie = new MovieBean();

        movie.setTitle(title);
        movie.setGenre(genre);
        movie.setDirector(director);
        movie.setReleaseYear(Integer.parseInt(releaseYearValue));

        MovieDAO dao = new MovieDAO();

        if (dao.addMovie(movie)) {
            message = "Movie added successfully!";
        } else {
            message = "Movie could not be added.";
        }

    } catch (Exception e) {
        message = "Error: " + e.getMessage();
    }

    MovieDAO dao = new MovieDAO();
    ArrayList<MovieBean> movies = dao.getAllMovies();
%>

<!DOCTYPE html>
<html>
<head>
    <title>CSD430 Module 7</title>
</head>

<body>

<h1>CSD430 Movie Database</h1>

<h2>Create Movie Record</h2>

<p><b><%= message %></b></p>

<h2>All Movie Records</h2>

<table border="1" cellpadding="8">

    <thead>
        <tr>
            <th>Movie ID</th>
            <th>Title</th>
            <th>Genre</th>
            <th>Director</th>
            <th>Release Year</th>
        </tr>
    </thead>

    <tbody>

    <% for(MovieBean movie : movies){ %>

        <tr>
            <td><%= movie.getMovieID() %></td>
            <td><%= movie.getTitle() %></td>
            <td><%= movie.getGenre() %></td>
            <td><%= movie.getDirector() %></td>
            <td><%= movie.getReleaseYear() %></td>
        </tr>

    <% } %>

    </tbody>

</table>

<br>

<a href="index.jsp">Add Another Movie</a>

</body>
</html>
