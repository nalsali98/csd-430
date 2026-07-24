<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.bellevue.beans.MovieDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
    /*
     * Retrieve all current movie IDs from the database.
     * The IDs are displayed in the Read and Update
     * HTML select dropdown menus.
     */
    MovieDAO dao = new MovieDAO();
    ArrayList<Integer> movieIDs = dao.getMovieIDs();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <title>CSD430 Module 9 - Movie Database</title>

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
            max-width: 1050px;
            margin: 0 auto;
        }

        header {
            background-color: #17365d;
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
            color: #17365d;
            margin-top: 0;
            border-bottom: 2px solid #d9e2f3;
            padding-bottom: 10px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-top: 15px;
            margin-bottom: 6px;
        }

        input[type="text"],
        input[type="number"],
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
            background-color: #17365d;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #28558a;
        }

        .update-button {
            background-color: #8b5e00;
        }

        .update-button:hover {
            background-color: #a97300;
        }

        .delete-button {
            background-color: #b42318;
        }

        .delete-button:hover {
            background-color: #d92d20;
        }

        .message {
            padding: 12px;
            border-left: 5px solid #17365d;
            background-color: #edf4ff;
            margin-bottom: 18px;
            line-height: 1.6;
        }

        .delete-message {
            border-left-color: #b42318;
            background-color: #fff1f0;
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
        <h1>CSD430 Movie Database</h1>
        <p>Noor El-din Al salihi</p>
        <p>Module 9.2 – Working with CRUD-DELETE &amp; JavaBeans</p>
        <p>Project Part 4</p>
    </header>

    <section class="card">

        <h2>Create a New Movie Record</h2>

        <div class="message">
            Enter the movie information below. The database will
            automatically generate the movie ID.
        </div>

        <form action="createMovie.jsp" method="post">

            <label for="title">Movie Title</label>

            <input
                    type="text"
                    id="title"
                    name="title"
                    maxlength="100"
                    required
            >

            <label for="genre">Genre</label>

            <input
                    type="text"
                    id="genre"
                    name="genre"
                    maxlength="50"
                    required
            >

            <label for="director">Director</label>

            <input
                    type="text"
                    id="director"
                    name="director"
                    maxlength="100"
                    required
            >

            <label for="releaseYear">Release Year</label>

            <input
                    type="number"
                    id="releaseYear"
                    name="releaseYear"
                    min="1888"
                    max="2100"
                    required
            >

            <input type="submit" value="Add Movie">

        </form>

    </section>

    <section class="card">

        <h2>Display an Existing Movie</h2>

        <div class="message">
            Select a movie ID to display the complete movie record.
        </div>

        <form action="display.jsp" method="get">

            <label for="displayMovieID">Select Movie ID</label>

            <select
                    id="displayMovieID"
                    name="movieID"
                    required
            >

                <% if (movieIDs.isEmpty()) { %>

                    <option value="">
                        No movie records are available
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
                    value="Display Movie"
                    <%= movieIDs.isEmpty() ? "disabled" : "" %>
            >

        </form>

    </section>

    <section class="card">

        <h2>Update an Existing Movie</h2>

        <div class="message">
            Select the primary key of the movie record you want to update.
        </div>

        <form action="updateMovie.jsp" method="get">

            <label for="updateMovieID">Select Movie ID</label>

            <select
                    id="updateMovieID"
                    name="movieID"
                    required
            >

                <% if (movieIDs.isEmpty()) { %>

                    <option value="">
                        No movie records are available
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
                    class="update-button"
                    type="submit"
                    value="Select Movie to Update"
                    <%= movieIDs.isEmpty() ? "disabled" : "" %>
            >

        </form>

    </section>

    <section class="card">

        <h2>Delete an Existing Movie</h2>

        <div class="message delete-message">
            Open the Delete Records page to view all current movie records.
            That page contains a dropdown with all available primary keys
            and allows you to select the record you want to delete.
        </div>

        <form action="deleteMovie.jsp" method="get">

            <input
                    class="delete-button"
                    type="submit"
                    value="Open Delete Records Page"
            >

        </form>

    </section>

    <footer>
        Bellevue University — CSD430 Server Side Development
    </footer>

</div>

</body>
</html>