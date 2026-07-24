<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.bellevue.beans.MovieBean" %>
<%@ page import="edu.bellevue.beans.MovieDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
    /*
     * Read the submitted form values.
     */
    String title = request.getParameter("title");
    String genre = request.getParameter("genre");
    String director = request.getParameter("director");
    String releaseYearValue =
            request.getParameter("releaseYear");

    String message;
    boolean successful = false;

    /*
     * Validate the submitted values and insert the new record.
     */
    if (title == null || title.trim().isEmpty()
            || genre == null || genre.trim().isEmpty()
            || director == null || director.trim().isEmpty()
            || releaseYearValue == null
            || releaseYearValue.trim().isEmpty()) {

        message = "All fields are required.";

    } else {

        try {

            int releaseYear =
                    Integer.parseInt(releaseYearValue);

            MovieBean movie = new MovieBean();

            movie.setTitle(title.trim());
            movie.setGenre(genre.trim());
            movie.setDirector(director.trim());
            movie.setReleaseYear(releaseYear);

            MovieDAO dao = new MovieDAO();
            successful = dao.addMovie(movie);

            if (successful) {
                message = "The movie was added successfully.";
            } else {
                message = "The movie could not be added.";
            }

        } catch (NumberFormatException e) {
            message = "The release year must be a valid number.";
        }
    }

    /*
     * Retrieve all records for the results table.
     */
    MovieDAO listDAO = new MovieDAO();
    ArrayList<MovieBean> movies =
            listDAO.getAllMovies();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <title>Create Movie Result</title>

    <style>
        body {
            margin: 0;
            padding: 30px;
            background-color: #eef2f7;
            font-family: Arial, Helvetica, sans-serif;
            color: #1f2937;
        }

        .container {
            width: 94%;
            max-width: 1100px;
            margin: 0 auto;
        }

        header,
        .card {
            background-color: white;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 24px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.10);
        }

        header {
            background-color: #17365d;
            color: white;
            text-align: center;
        }

        .success {
            background-color: #e8f7ed;
            color: #166534;
            border-left: 6px solid #16a34a;
            padding: 15px;
            border-radius: 6px;
        }

        .error {
            background-color: #feecec;
            color: #991b1b;
            border-left: 6px solid #dc2626;
            padding: 15px;
            border-radius: 6px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th {
            background-color: #17365d;
            color: white;
            padding: 12px;
            border: 1px solid #cbd5e1;
        }

        td {
            padding: 11px;
            border: 1px solid #cbd5e1;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f3f6fa;
        }

        a {
            display: inline-block;
            padding: 11px 18px;
            background-color: #17365d;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            margin-right: 10px;
        }

        a:hover {
            background-color: #28558a;
        }
    </style>
</head>

<body>

<div class="container">

    <header>
        <h1>CSD430 Movie Database</h1>
        <p>Movie Creation Result</p>
    </header>

    <section class="card">

        <% if (successful) { %>

            <div class="success">
                <strong><%= message %></strong>
            </div>

        <% } else { %>

            <div class="error">
                <strong><%= message %></strong>
            </div>

        <% } %>

        <h2>All Movie Records</h2>

        <table>

            <thead>
            <tr>
                <th>Movie ID<br>INTEGER</th>
                <th>Title<br>VARCHAR</th>
                <th>Genre<br>VARCHAR</th>
                <th>Director<br>VARCHAR</th>
                <th>Release Year<br>INTEGER</th>
            </tr>
            </thead>

            <tbody>

            <% if (movies.isEmpty()) { %>

                <tr>
                    <td colspan="5">
                        No movie records were found.
                    </td>
                </tr>

            <% } else { %>

                <% for (MovieBean movie : movies) { %>

                    <tr>
                        <td><%= movie.getMovieID() %></td>
                        <td><%= movie.getTitle() %></td>
                        <td><%= movie.getGenre() %></td>
                        <td><%= movie.getDirector() %></td>
                        <td><%= movie.getReleaseYear() %></td>
                    </tr>

                <% } %>

            <% } %>

            </tbody>

        </table>

        <br>

        <a href="index.jsp">Return to Main Page</a>

    </section>

</div>

</body>
</html>