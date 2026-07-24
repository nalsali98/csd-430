<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.bellevue.beans.MovieBean" %>
<%@ page import="edu.bellevue.beans.MovieDAO" %>

<%
    /*
     * Read the submitted update form values.
     */
    String movieIDValue =
            request.getParameter("movieID");

    String title =
            request.getParameter("title");

    String genre =
            request.getParameter("genre");

    String director =
            request.getParameter("director");

    String releaseYearValue =
            request.getParameter("releaseYear");

    boolean successful = false;
    String message;
    MovieBean updatedMovie = null;

    /*
     * Validate the form data before updating the database.
     */
    if (movieIDValue == null
            || movieIDValue.trim().isEmpty()
            || title == null
            || title.trim().isEmpty()
            || genre == null
            || genre.trim().isEmpty()
            || director == null
            || director.trim().isEmpty()
            || releaseYearValue == null
            || releaseYearValue.trim().isEmpty()) {

        message = "All movie fields are required.";

    } else {

        try {

            int movieID =
                    Integer.parseInt(movieIDValue);

            int releaseYear =
                    Integer.parseInt(releaseYearValue);

            MovieBean movie = new MovieBean();

            movie.setMovieID(movieID);
            movie.setTitle(title.trim());
            movie.setGenre(genre.trim());
            movie.setDirector(director.trim());
            movie.setReleaseYear(releaseYear);

            MovieDAO dao = new MovieDAO();

            successful = dao.updateMovie(movie);

            if (successful) {

                message =
                        "The movie record was updated successfully.";

                /*
                 * Retrieve the record again so the page displays
                 * the saved database values.
                 */
                updatedMovie =
                        dao.getMovieByID(movieID);

            } else {

                message =
                        "The movie record could not be updated.";
            }

        } catch (NumberFormatException e) {

            message =
                    "The movie ID and release year must be valid numbers.";
        }
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <title>Updated Movie Record</title>

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
            max-width: 1050px;
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
            margin-top: 22px;
        }

        th {
            background-color: #17365d;
            color: white;
            padding: 12px;
            border: 1px solid #cbd5e1;
        }

        td {
            padding: 12px;
            border: 1px solid #cbd5e1;
            text-align: center;
        }

        a {
            display: inline-block;
            padding: 11px 18px;
            background-color: #17365d;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            margin-top: 20px;
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
        <p>Updated Movie Record</p>
    </header>

    <section class="card">

        <% if (successful && updatedMovie != null) { %>

            <div class="success">
                <strong><%= message %></strong>
            </div>

            <h2>Updated Record</h2>

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
                <tr>
                    <td>
                        <%= updatedMovie.getMovieID() %>
                    </td>

                    <td>
                        <%= updatedMovie.getTitle() %>
                    </td>

                    <td>
                        <%= updatedMovie.getGenre() %>
                    </td>

                    <td>
                        <%= updatedMovie.getDirector() %>
                    </td>

                    <td>
                        <%= updatedMovie.getReleaseYear() %>
                    </td>
                </tr>
                </tbody>

            </table>

            <a href="index.jsp">
                Return to Main Page
            </a>

            <a href="updateMovie.jsp?movieID=<%= updatedMovie.getMovieID() %>">
                Update This Movie Again
            </a>

        <% } else { %>

            <div class="error">
                <strong><%= message %></strong>
            </div>

            <a href="index.jsp">
                Return to Main Page
            </a>

        <% } %>

    </section>

</div>

</body>
</html>