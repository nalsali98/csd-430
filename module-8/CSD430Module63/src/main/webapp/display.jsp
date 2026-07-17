<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.bellevue.beans.MovieDAO" %>
<%@ page import="edu.bellevue.beans.MovieBean" %>

<%
    /*
     * Read the selected primary-key value and retrieve
     * the matching database record.
     */
    String movieIDValue =
            request.getParameter("movieID");

    MovieBean movie = null;
    String errorMessage = "";

    if (movieIDValue == null
            || movieIDValue.trim().isEmpty()) {

        errorMessage = "A movie ID was not selected.";

    } else {

        try {

            int movieID =
                    Integer.parseInt(movieIDValue);

            MovieDAO dao = new MovieDAO();
            movie = dao.getMovieByID(movieID);

            if (movie == null) {
                errorMessage =
                        "The selected movie record was not found.";
            }

        } catch (NumberFormatException e) {
            errorMessage =
                    "The selected movie ID is invalid.";
        }
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <title>Movie Information</title>

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
        <p>Selected Movie Record</p>
    </header>

    <section class="card">

        <% if (!errorMessage.isEmpty()) { %>

            <div class="error">
                <strong><%= errorMessage %></strong>
            </div>

        <% } else { %>

            <h2>Movie Information</h2>

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
                    <td><%= movie.getMovieID() %></td>
                    <td><%= movie.getTitle() %></td>
                    <td><%= movie.getGenre() %></td>
                    <td><%= movie.getDirector() %></td>
                    <td><%= movie.getReleaseYear() %></td>
                </tr>
                </tbody>

            </table>

        <% } %>

        <a href="index.jsp">Return to Main Page</a>

    </section>

</div>

</body>
</html>