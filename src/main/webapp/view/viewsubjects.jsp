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
<form action="viewsubjects" method="post">
		<a href="viewstudents">STUDENTS</a>
		     ID<input type="text" name="s_id"> 
		      SUBJECT<input type="text" name="subject"> 
		      <input type="submit" value="Save">

		<input type="reset" value="reset">

	</form>
	<center>
		<h1>SUBJECT DETAILS</h1>
	</center>

	<table class="table">
		<tr>
			<th>ID</th>
			<th>SUBJECT NAME</th>
		</tr>
		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrollmentsystem", "root",
					"root");
			PreparedStatement ps = connection.prepareStatement("select * from Subject");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				out.println("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><tr>");
			}
		%>
	</table>
</body>
</html>