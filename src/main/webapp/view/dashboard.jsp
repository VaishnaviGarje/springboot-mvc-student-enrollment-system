<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Student Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: black;
            margin: 0;
            padding: 20px;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 0 auto;
            margin-bottom: 20px;
        }
        .header {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .details {
            margin-bottom: 10px;
        }
        .subjects-list {
            list-style-type: none;
            padding: 0;
        }
        .subjects-list li {
            background-color: #e9ecef;
            margin: 5px 0;
            padding: 8px;
            border-radius: 4px;
        }
        .enroll-form {
            display: flex;
            flex-direction: column;
            margin-top: 20px;
        }
        .enroll-form input, .enroll-form label, .enroll-form button {
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .enroll-form button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .enroll-form button:hover {
            background-color: #45a049;
        }
        .graph-container {
            margin-top: 20px;
        }
        .graph {
            background-color: #e9ecef;
            margin: 5px 0;
            padding: 10px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<%  String msg=  (String) request.getAttribute("msg");
    		if(msg!=null){
    			%>
    			<h2 style="color:white">${msg}</h2>
    
    <%
    }
   	%>
<%
    // Database connection setup
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrollmentsystem", "root", "root");

    // Query to get student details
    PreparedStatement psStudent = connection.prepareStatement("SELECT * FROM Student WHERE id =?");
    psStudent.setInt(1, 7); // Example student ID; replace with dynamic ID if needed
    ResultSet rsStudent = psStudent.executeQuery();
    if (rsStudent.next()) {
        String studentName = rsStudent.getString("name");
        int studentId = rsStudent.getInt("id");
%>
    <h1 style="color:white">Student Dashboard</h1>
    <div class="container">
        <div class="header">Welcome, <%= studentName %></div>

       
        <!-- Display graphs if the user is 'student.user' -->
        <%
            if ("student.user".equals(studentName)) {
        %>
        <div class="graph-container">
            <h2>Graphs</h2>
            <div class="graph">Graph 1: (Sample Graph Data)</div>
            <div class="graph">Graph 2: (Sample Graph Data)</div>
            <div class="graph">Graph 3: (Sample Graph Data)</div>
            <!-- Replace with actual graph elements -->
        </div>
        <%
            }
        %>

        <!-- Enrollment Form -->
        <div class="enroll-container">
            <div class="header">Enroll in New Subjects</div>
            <form class="enroll-form" action="enroll" method="post">
                <input type="text" name="name" placeholder="Your Name" required value="<%= studentName %>">
                <input type="text" name="address" placeholder="Your Address" required>
                <label for="subjects">Select Subjects:</label>
                <%
                    // Query to get all subjects
                    PreparedStatement psAllSubjects = connection.prepareStatement("SELECT * FROM Subject");
                    ResultSet rsAllSubjects = psAllSubjects.executeQuery();
                    while (rsAllSubjects.next()) {
                %>
                <label>
                    <input type="checkbox" name="subjectIds" value="<%= rsAllSubjects.getInt("s_id") %>">
                    <%= rsAllSubjects.getString("subject") %>
                </label><br>
                <%
                    }
                  
                %>
                <button type="submit">Enroll</button>
            </form>
        </div>
    </div>
    <%
    }
    connection.close();
%>
</body>
</html>
