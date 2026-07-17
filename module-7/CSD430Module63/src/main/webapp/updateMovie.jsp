<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.bellevue.beans.MovieDAO" %>
<%@ page import="edu.bellevue.beans.MovieBean" %>

<%
    /*
     * Read the primary key selected from the dropdown
     * and retrieve the matching movie record.
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

    <title>Update Movie Record</title>

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
            width: 92%;
            max-width: 850px;
            margin: 0 auto;
        }

        header,
        .card {
            background-color: white;
            border-radius: 12px;
            padding: 28px;
            margin-bottom: 24px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.10);
        }

        header {
            background-color: #17365d;
            color: white;
            text-align: center;
        }

        h2 {
            color: #17365d;
            border-bottom: 2px solid #d9e2f3;
            padding-bottom: 10px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-top: 16px;
            margin-bottom: 6px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 11px;
            border: 1px solid #9ca3af;
            border-radius: 6px;
            font-size: 16px;
        }

        .key-display {
            width: 100%;
            padding: 12px;
            background-color: #e5e7eb;
            border: 1px solid #9ca3af;
            border-radius: 6px;
            font-weight: bold;
        }

        input[type="submit"] {
            margin-top: 22px;
            padding: 12px 22px;
            border: none;
            border-radius: 6px;
            background-color: #8b5e00;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #a97300;
        }

        .error {
            background-color: #feecec;
            color: #991b1b;
            border-left: 6px solid #dc2626;
            padding: 15px;
            border-radius: 6px;
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
        <h1>Update Movie Record</h1>
        <p>Module 8.2 – Project Part 3</p>
    </header>

    <section class="card">

        <% if (!errorMessage.isEmpty()) { %>

            <div class="error">
                <strong><%= errorMessage %></strong>
            </div>

            <a href="index.jsp">Return to Main Page</a>

        <% } else { %>

            <h2>Edit Movie Information</h2>

            <p>
                The movie ID is the primary key and cannot be changed.
                Update the remaining fields and click the Update Movie button.
            </p>

            <form action="processUpdate.jsp" method="post">

                <label>Movie ID — Primary Key</label>

                <div class="key-display">
                    <%= movie.getMovieID() %>
                </div>

                <input
                        type="hidden"
                        name="movieID"
                        value="<%= movie.getMovieID() %>"
                >

                <label for="title">Movie Title</label>

                <input
                        type="text"
                        id="title"
                        name="title"
                        value="<%= movie.getTitle() %>"
                        maxlength="100"
                        required
                >

                <label for="genre">Genre</label>

                <input
                        type="text"
                        id="genre"
                        name="genre"
                        value="<%= movie.getGenre() %>"
                        maxlength="50"
                        required
                >

                <label for="director">Director</label>

                <input
                        type="text"
                        id="director"
                        name="director"
                        value="<%= movie.getDirector() %>"
                        maxlength="100"
                        required
                >

                <label for="releaseYear">Release Year</label>

                <input
                        type="number"
                        id="releaseYear"
                        name="releaseYear"
                        value="<%= movie.getReleaseYear() %>"
                        min="1888"
                        max="2100"
                        required
                >

                <input
                        type="submit"
                        value="Update Movie"
                >

            </form>

            <a href="index.jsp">Cancel and Return</a>

        <% } %>

    </section>

</div>

</body>
</html>