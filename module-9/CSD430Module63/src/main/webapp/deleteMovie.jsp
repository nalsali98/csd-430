<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.bellevue.beans.MovieDAO" %>
<%@ page import="edu.bellevue.beans.MovieBean" %>
<%@ page import="java.util.ArrayList" %>

<%
    /*
     * Create the DAO used for all database operations
     * required by the delete page.
     */
    MovieDAO dao = new MovieDAO();

    /*
     * This message is displayed after the user attempts
     * to delete a movie record.
     */
    String message = "";

    /*
     * Read the selected movie ID from the submitted form.
     * The parameter is available only after a deletion
     * request has been submitted.
     */
    String movieIDParameter =
            request.getParameter("movieID");

    /*
     * Attempt to delete the selected record only when
     * the movieID parameter is present and not empty.
     */
    if (movieIDParameter != null &&
            !movieIDParameter.trim().isEmpty()) {

        try {

            int movieID =
                    Integer.parseInt(movieIDParameter);

            boolean deleted =
                    dao.deleteMovie(movieID);

            if (deleted) {

                message =
                        "Movie ID " + movieID +
                        " was deleted successfully.";

            } else {

                message =
                        "Movie ID " + movieID +
                        " could not be deleted. " +
                        "The record may no longer exist.";
            }

        } catch (NumberFormatException e) {

            message =
                    "The selected movie ID was not valid.";
        }
    }

    /*
     * Retrieve the remaining movie records after the
     * selected deletion has been processed.
     */
    ArrayList<MovieBean> movies =
            dao.getAllMovies();

    /*
     * Retrieve the remaining primary keys for the
     * updated delete dropdown.
     */
    ArrayList<Integer> movieIDs =
            dao.getMovieIDs();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <title>Delete Movie Records</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 30px;
            background-color: #eef2f7;
            font-family: Arial, Helvetica, sans-serif;
            color: #1f2937;
        }

        .container {
            width: 95%;
            max-width: 1200px;
            margin: 0 auto;
        }

        header {
            background-color: #8b1e1e;
            color: white;
            padding: 30px;
            border-radius: 12px;
            text-align: center;
            margin-bottom: 25px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        header h1 {
            margin: 0 0 10px;
        }

        header p {
            margin: 5px 0;
        }

        .card {
            background-color: white;
            padding: 28px;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.10);
        }

        .card h2 {
            color: #8b1e1e;
            margin-top: 0;
            border-bottom: 2px solid #f1c7c7;
            padding-bottom: 10px;
        }

        .description {
            background-color: #fff4f4;
            border-left: 5px solid #8b1e1e;
            padding: 14px;
            margin-bottom: 20px;
            line-height: 1.6;
        }

        .success-message {
            background-color: #ecfdf3;
            border-left: 5px solid #027a48;
            color: #05603a;
            padding: 14px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .empty-message {
            background-color: #fff8e6;
            border-left: 5px solid #b7791f;
            padding: 14px;
            margin: 15px 0;
            font-weight: bold;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 18px;
        }

        thead {
            background-color: #8b1e1e;
            color: white;
        }

        th,
        td {
            border: 1px solid #cbd5e1;
            padding: 12px;
            text-align: left;
        }

        tbody tr:nth-child(even) {
            background-color: #f8fafc;
        }

        tbody tr:hover {
            background-color: #fff4f4;
        }

        label {
            display: block;
            font-weight: bold;
            margin-top: 15px;
            margin-bottom: 7px;
        }

        select {
            width: 100%;
            padding: 11px;
            border: 1px solid #9ca3af;
            border-radius: 6px;
            font-size: 16px;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 12px 22px;
            border: none;
            border-radius: 6px;
            background-color: #b42318;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #d92d20;
        }

        input[type="submit"]:disabled {
            background-color: #9ca3af;
            cursor: not-allowed;
        }

        .back-link {
            display: inline-block;
            margin-top: 10px;
            padding: 11px 18px;
            border-radius: 6px;
            background-color: #17365d;
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link:hover {
            background-color: #28558a;
        }

        footer {
            text-align: center;
            padding: 15px;
            color: #4b5563;
        }
    </style>
</head>

<body>

<div class="container">

    <header>
        <h1>Delete Movie Records</h1>
        <p>Noor El-din Al salihi</p>
        <p>CSD430 Module 9.2</p>
        <p>CRUD-DELETE &amp; JavaBeans — Project Part 4</p>
    </header>

    <section class="card">

        <h2>Movie Database Records</h2>

        <div class="description">
            The table below displays all records currently stored in the
            movie database. Each movie contains five displayed fields:
            Movie ID, Title, Genre, Director, and Release Year.
        </div>

        <% if (!message.isEmpty()) { %>

            <div class="success-message">
                <%= message %>
            </div>

        <% } %>

        <% if (movies.isEmpty()) { %>

            <div class="empty-message">
                All movie records have been deleted. The table header
                remains visible as required by the assignment.
            </div>

        <% } %>

        <table>

            <thead>
            <tr>
                <th>Movie ID</th>
                <th>Movie Title</th>
                <th>Genre</th>
                <th>Director</th>
                <th>Release Year</th>
            </tr>
            </thead>

            <tbody>

            <% for (MovieBean movie : movies) { %>

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

    </section>

    <section class="card">

        <h2>Select Another Record to Delete</h2>

        <div class="description">
            Select a remaining movie ID from the dropdown and submit the
            form. The selected record will be deleted, and this page will
            reload with the updated table and remaining primary keys.
        </div>

        <form action="deleteMovie.jsp" method="post">

            <label for="movieID">Remaining Movie Keys</label>

            <select
                    id="movieID"
                    name="movieID"
                    required
            >

                <% if (movieIDs.isEmpty()) { %>

                    <option value="">
                        No movie keys remain
                    </option>

                <% } else { %>

                    <% for (Integer movieID : movieIDs) { %>

                        <option value="<%= movieID %>">
                            Movie ID <%= movieID %>
                        </option>

                    <% } %>

                <% } %>

            </select>

            <input
                    type="submit"
                    value="Delete Selected Movie"
                    <%= movieIDs.isEmpty() ? "disabled" : "" %>
            >

        </form>

        <a class="back-link" href="index.jsp">
            Return to Main Page
        </a>

    </section>

    <footer>
        Bellevue University — CSD430 Server Side Development
    </footer>

</div>

</body>
</html>