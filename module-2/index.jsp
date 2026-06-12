<%--
    Name: Noor El-din Al Salihi
    Course: CSD430-340A Server Side Development (2267-DD)
    Assignment: Module 2.2 Programming Assignment
    Date: June 2026
    Description: This JSP page uses Java Scriptlets to store and display data
    about places in Iraq in an HTML table.
--%>

<%
    String pageTitle = "Places I Enjoyed Visiting in Iraq";
    String description = "This page displays a list of places in Iraq with a short description and category.";

    String[][] places = {
        {"Baghdad", "Capital City", "Known for history, culture, markets, and the Tigris River."},
        {"Erbil", "Historic City", "Famous for the Erbil Citadel and Kurdish culture."},
        {"Najaf", "Religious City", "An important religious and historical city visited by many people."},
        {"Basra", "Port City", "Known for its rivers, palm trees, and southern Iraqi culture."},
        {"Mosul", "Historic City", "A city with deep history and important cultural landmarks."}
    };
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= pageTitle %></title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
    <h1><%= pageTitle %></h1>

    <p class="description">
        <%= description %>
    </p>

    <h2>Record Description</h2>
    <p>
        Each record in the table represents one place I enjoyed visiting or learning about in Iraq.
        The table includes the place name, category, and a short description.
    </p>

    <table>
        <thead>
            <tr>
                <th>Place Name</th>
                <th>Category</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (int i = 0; i < places.length; i++) {
            %>
            <tr>
                <td><%= places[i][0] %></td>
                <td><%= places[i][1] %></td>
                <td><%= places[i][2] %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>