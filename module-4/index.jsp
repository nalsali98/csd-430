<%@ page import="beans.CountryBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<%
/*
 * Name: Noor El-din Al salihi
 * Date: June 25, 2026
 * Assignment: Module 4.2 Programming Assignment
 * Purpose: Display country information using JavaBeans and JSP.
 */

ArrayList<CountryBean> countries = new ArrayList<>();

countries.add(new CountryBean("Iraq", "Baghdad", "Arabic", "Dolma", "Babylon"));
countries.add(new CountryBean("United States", "Washington D.C.", "English", "Hamburger", "Grand Canyon"));
countries.add(new CountryBean("Japan", "Tokyo", "Japanese", "Sushi", "Mount Fuji"));
countries.add(new CountryBean("France", "Paris", "French", "Croissant", "Eiffel Tower"));
countries.add(new CountryBean("Italy", "Rome", "Italian", "Pizza", "Colosseum"));

// Display-only lookup: short code shown in the monogram chip next to each country name.
HashMap<String, String> countryCodes = new HashMap<>();
countryCodes.put("Iraq", "IRQ");
countryCodes.put("United States", "USA");
countryCodes.put("Japan", "JPN");
countryCodes.put("France", "FRA");
countryCodes.put("Italy", "ITA");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Country Information Display</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">

    <div class="hero">
        <div class="eyebrow">JavaBean &middot; JSP &middot; Module 4.2</div>
        <h1>Country Information Display</h1>
        <p>
            This page displays information about five countries using a JavaBean and JSP.
        </p>
    </div>

    <div class="stat-strip">
        <div class="stat"><div class="num">05</div><div class="label">Countries</div></div>
        <div class="stat"><div class="num">05</div><div class="label">Languages</div></div>
        <div class="stat"><div class="num">03</div><div class="label">Continents Spanned</div></div>
    </div>

    <div class="table-wrap">
        <table>
            <thead>
                <tr>
                    <th>Country</th>
                    <th>Capital</th>
                    <th>Language</th>
                    <th>Famous Food</th>
                    <th>Popular Attraction</th>
                </tr>
            </thead>
            <tbody>

            <%
            for (CountryBean country : countries) {
                String code = countryCodes.get(country.getCountryName());
            %>

            <tr>
                <td>
                    <div class="country-cell">
                        <span class="code-chip"><%= code %></span>
                        <span class="country-name"><%= country.getCountryName() %></span>
                    </div>
                </td>
                <td><span class="capital-pill"><%= country.getCapital() %></span></td>
                <td><%= country.getLanguage() %></td>
                <td><%= country.getFamousFood() %></td>
                <td><%= country.getAttraction() %></td>
            </tr>

            <%
            }
            %>

            </tbody>
        </table>
    </div>

</div>

<div class="colophon">CSD430-340A &middot; Server-Side Development &middot; Module 4.2 Programming Assignment</div>

</body>
</html>
