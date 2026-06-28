<%@page import="java.sql.*"%>
<%@page import="database.DBConnection"%>


<html>

<body>
<link rel="stylesheet" href="style.css">

<h2>All Student Profiles</h2>


<table border="1">


<tr>
<th>Actions</th>
<th>Name</th>
<th>ID</th>
<th>Program</th>
<th>Email</th>
<th>Hobby</th>

</tr>



<%

Connection con =
DBConnection.getConnection();


Statement st =
con.createStatement();


ResultSet rs =
st.executeQuery("SELECT * FROM profiles");


while(rs.next()){


%>


<tr>

    <td>
    <a href="editProfile.jsp?id=<%=rs.getInt("id")%>">Edit</a> |
    <a href="deleteProfile?id=<%=rs.getInt("id")%>">Delete</a>
</td>

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


</body>
</html>