<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.fssa.projectprovision.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f4f4f4;
        }
        .form-group {
            margin-bottom: 10px;
        }
        label {
            display: block;
            font-weight: bold;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 3px;
            padding: 10px 20px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>User Registration</h2>
        <form action="<%= request.getContextPath() %>//ProfileServlet" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name"  value="${user.name}" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <input type="text" id="gender" value="${user.gender}"  name="gender" required>
            </div>
            <div class="form-group">
                <label for="mobileNumber">Mobile Number:</label>
                <input type="text" id="mobileNumber" value="${user.mobileNumber}" name="mobileNumber" required>
            </div>
            <div class="form-group">
                <label for="dateOfBirth">Date of Birth:</label>
                <input type="date" id="dateOfBirth" value="${user.dateOfBirth}" name="dateOfBirth" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" value="${user.email}" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" value="${user.password}"name="password" required>
            </div>
            <label for="password">profile_pic:</label>
                <input type="url" id="password" value="${user.profilePic}"name="profilePic" required>
            
              <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="${user.address}"><br><br>
            
              <label for="aboutMe">About Me:</label>
            <textarea id="aboutMe" name="aboutMe">${user.aboutMe}</textarea><br><br>
            
         <div class="form-group">
                <input type="submit" value="Register">
            </div>
             <span class="task-status1"> <a href="deleteUserServlet?id=${user.getId()}">Delete</a></span>
        </form>
    </div>
</body>
</html>
