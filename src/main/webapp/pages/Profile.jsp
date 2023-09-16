<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.fssa.projectprovision.model.User" %><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
</head>
<body>
    <h1>User Profile</h1>
        <p>User not found.</p>
   
        <form action="ProfileServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${user.name}"><br><br>
            
            <label for="mobileNumber">Mobile Number:</label>
            <input type="text" id="mobileNumber" name="mobileNumber" value="${user.mobileNumber}"><br><br>
            
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="${user.address}"><br><br>
            
            <label for="aboutMe">About Me:</label>
            <textarea id="aboutMe" name="aboutMe">${user.aboutMe}</textarea><br><br>
            
            <input type="submit" value="Update Profile">
        </form>
  
</body>
</html>
