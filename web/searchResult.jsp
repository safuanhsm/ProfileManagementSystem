<%-- 
    Document   : searchResult
    Created on : Jun 28, 2026, 10:57:47 PM
    Author     : Safuanhsm
--%>

<%@ page import="java.sql.*" %>
<%@ page import="database.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Search Result</title>
</head>

<body>

<h2>Search Result</h2>

<%
    String name = request.getParameter("name");

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM profiles WHERE name LIKE ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, "%" + name + "%");

        ResultSet rs = ps.executeQuery();

        boolean found = false;

%>

<table border="1" cellpadding="5">

<tr>
    <th>Name</th>
    <th>Student ID</th>
    <th>Program</th>
    <th>Email</th>
    <th>Hobby</th>
    <th>Intro</th>
</tr>

<%
        while(rs.next()) {
            found = true;
%>

<tr>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("studentID") %></td>
    <td><%= rs.getString("program") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("hobby") %></td>
    <td><%= rs.getString("intro") %></td>
</tr>

<%
        }

        if(!found) {
            out.println("<h3>No record found</h3>");
        }

    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

</table>

<br>

<a href="search.jsp">Back</a>

</body>
</html>