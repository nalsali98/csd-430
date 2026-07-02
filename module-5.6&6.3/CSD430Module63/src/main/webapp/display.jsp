<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.bellevue.beans.MovieDAO" %>
<%@ page import="edu.bellevue.beans.MovieBean" %>

<%
    int id = Integer.parseInt(request.getParameter("movieID"));

    MovieDAO dao = new MovieDAO();
    MovieBean movie = dao.getMovieByID(id);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Movie Details</title>
</head>
<body>

<h1>Movie Information</h1>

<table border="1">

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

    <tr>
        <td><%=movie.getMovieID()%></td>
        <td><%=movie.getTitle()%></td>
        <td><%=movie.getGenre()%></td>
        <td><%=movie.getDirector()%></td>
        <td><%=movie.getReleaseYear()%></td>
    </tr>

    </tbody>

</table>

<br>

<a href="index.jsp">Back</a>

</body>
</html>