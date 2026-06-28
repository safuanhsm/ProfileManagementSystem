<%@page import="java.sql.*"%>
<%@page import="database.DBConnection"%>

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM profiles WHERE id=?");
ps.setInt(1, id);

ResultSet rs = ps.executeQuery();
rs.next();
%>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="style.css">
    <title>Edit Profile</title>
</head>

<body>

<div class="container">

<h2>Edit Profile</h2>

<form action="updateProfile" method="post">

<input type="hidden" name="id" value="<%=rs.getInt("id")%>">

<label>Name</label>
<input type="text" name="name" value="<%=rs.getString("name")%>">

<label>Student ID</label>
<input type="text" name="studentID" value="<%=rs.getString("studentID")%>">

<label>Program</label>
<input type="text" name="program" value="<%=rs.getString("program")%>">

<label>Email</label>
<input type="text" name="email" value="<%=rs.getString("email")%>">

<label>Hobby</label>
<input type="text" name="hobby" value="<%=rs.getString("hobby")%>">

<label>Intro</label>
<input type="text" name="intro" value="<%=rs.getString("intro")%>">

<br><br>

<input type="submit" value="Update Profile">

</form>

<br>

<div class="nav">
    <a href="viewProfiles.jsp">Back</a>
</div>

</div>

</body>
</html>