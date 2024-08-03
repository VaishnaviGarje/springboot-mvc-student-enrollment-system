<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
body {
    width: 100%;
    height: 100%;
    margin: 0;
    background-color: black;
    color: white;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    font-family: Arial, sans-serif;
}
body:hover{
    width: 100%;
    height: 100%;
    margin: 0;
    background-color: white;
    color: black;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    font-family: Arial, sans-serif;
}
#heading {
    margin-bottom: 20px;
}

form {
    display: flex;
    justify-content: center;
    gap: 20px;
}

button {
    padding: 25px 50px;
    background-color: #4CAF50;
    color: black;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

button:hover {
    background-color:#00ffbf;
}

button:focus {
    outline: none;
}

@media (max-width: 600px) {
    form {
        flex-direction: column;
        gap: 10px;
    }

    button {
        width: 80%;
    }
}
</style>
</head>
<body>
<div id="heading">
    <center><p style="font-size: 70px">Welcome</p></center>
</div>
<form>
    <button type="button" onclick="location.href='userlogin'">User</button>
    <button type="button" onclick="location.href='adminlogin'">Admin</button>
</form>
<script type="text/javascript"></script>
</body>
</html>
