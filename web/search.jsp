<%-- 
    Document   : search
    Created on : Jun 28, 2026, 10:56:32 PM
    Author     : Safuanhsm
--%>
<%@page import="java.sql.*"%>
<%@page import="database.DBConnection"%>

<!DOCTYPE html>
<html>
<body>

<link rel="stylesheet" href="style.css">

<div class="container">

<h2>Search Profile</h2>

<form method="post">
    <input type="text" name="keyword" placeholder="Enter name">
    <input type="submit" value="Search">
</form>

<br>

<%
String keyword = request.getParameter("keyword");

if(keyword != null && !keyword.trim().equals("")) {

    Connection con = DBConnection.getConnection();

    String sql = "SELECT * FROM profiles WHERE name LIKE ?";

    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, "%" + keyword + "%");

    ResultSet rs = ps.executeQuery();
%>

<table border="1">

<tr>
<th>Name</th>
<th>ID</th>
<th>Program</th>
<th>Email</th>
<th>Hobby</th>
</tr>

<%
while(rs.next()) {
%>

<tr>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("studentID")%></td>
<td><%=rs.getString("program")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("hobby")%></td>
</tr>

<%
}
%>

</table>

<%
}
%>

<br>

<a href="viewProfiles.jsp">Back</a>

</div>

</body>
</html>