<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
</head>
<body>
    <h1>Registration Page</h1>
    <form action="register" method="post">
        <label>Email:</label>
        <input type="email" name="email" placeholder="Enter email" required>
        <br>
        <label>Password:</label>
        <input type="password" name="password" placeholder="Enter password" required>
        <br>
        <button type="submit">Register</button>
    </form>
    
    <!-- Display error message if there are registration validation errors -->
    <c:if test="${not empty errorMessage}">
        <p style="color: red">${errorMessage}</p>
    </c:if>
</body>
</html>
