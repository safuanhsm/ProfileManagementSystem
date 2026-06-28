
<%@page import="model.ProfileBean"%>

<html>

<body>
<link rel="stylesheet" href="style.css">

<h2>Profile Saved Successfully</h2>


<%

ProfileBean p =
(ProfileBean)request.getAttribute("profile");

%>


Name:
<%=p.getName()%><br>


Student ID:
<%=p.getStudentID()%><br>


Program:
<%=p.getProgram()%><br>


Email:
<%=p.getEmail()%><br>


Hobby:
<%=p.getHobby()%><br>


Introduction:
<%=p.getIntro()%>



<br><br>

<a href="viewProfiles.jsp">
View All Profiles
</a>


</body>

</html>