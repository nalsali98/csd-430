<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.bellevue.beans.MovieDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
    MovieDAO dao = new MovieDAO();
    ArrayList<Integer> ids = dao.getMovieIDs();
%>

<!DOCTYPE html>
<html>
<head>
    <title>CSD430 Module 6 - Movie Database</title>
</head>
<body>

<h1>Movie Database</h1>

<p>Select a Movie ID:</p>

<form action="display.jsp" method="get">

    <select name="movieID">

        <% for(Integer id : ids){ %>

        <option value="<%=id%>"><%=id%></option>

        <% } %>

    </select>

    <br><br>

    <input type="submit" value="Display Movie">

</form>

</body>
</html>