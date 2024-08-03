<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
}

.table {
	width: 60%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
</head>
<body>
<form action="Saveuser" method="post">
		<a href="viewsubjects">Subjects</a>
		     Username<input type="text" name="username"> 
		      Address<input type="text" name="address"> 
		      <input type="submit" value="Save">

		<input type="reset" value="reset">

	</form>
	<center>
		<h1>USER DETAILS</h1>
	</center>

	<table class="table">
		<tr>
			<th>ADDRESS</th>
			<th>USER NAME</th>
		</tr>
		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrollmentsystem", "root",
					"root");
			PreparedStatement ps = connection.prepareStatement("select * from Student");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				out.println("<tr><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><tr>");
			}
		%>
	</table>
</body>
</html>