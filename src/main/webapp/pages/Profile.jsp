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
        <form action="<%= request.getContextPath() %>//ProfileServlet" method="post" onsubmit="return validateForm()">
        <%
	String errorMessage = request.getParameter("errorMessage");
	if (errorMessage != null) {
		out.println("<p>" + errorMessage + "</p>");
	}
	%>
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
    <input type="email" id="email" value="${user.email}" name="email" required readonly>
</div>

            <div class="form-group">
                <input type="hidden" id="password" value="${user.password}"name="password" required>
            </div>
            <label for="password">profile_pic:</label>
                <input type="url" id="password" value="${user.profilePic}"name="profilePic" required>
            
              <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="${user.address}" required><br><br>
     
         <div class="form-group">
                <input type="submit" value="Register">
            </div>
        </form>
    </div>
    
    
    
    <script>
        function validateForm() {
            const name = document.getElementById("name").value;
            const gender = document.getElementById("gender").value;
            const mobileNumber = document.getElementById("mobileNumber").value;
            const dateOfBirth = document.getElementById("dateOfBirth").value;
            const email = document.getElementById("email").value;
            const password = document.getElementById("password").value;

            // Validation for Name
            if (name.trim() === "") {
                alert("Name cannot be empty");
                return false;
            }

            // Validation for Gender
            if (gender.trim() !== "M" && gender.trim() !== "F") {
                alert("Invalid gender. Gender must be 'M' or 'F'");
                return false;
            }

            // Validation for Mobile Number
            if (!/^\d{10}$/.test(mobileNumber)) {
                alert("Invalid mobile number. It should be 10 digits");
                return false;
            }

            // Validation for Date of Birth (Age should be at least 10 years old)
            const dobDate = new Date(dateOfBirth);
            const currentDate = new Date();
            const minValidDate = new Date(currentDate.getFullYear() - 10, currentDate.getMonth(), currentDate.getDate());

            if (isNaN(dobDate) || dobDate > currentDate || dobDate > minValidDate) {
                alert("Invalid date of birth. Must be at least 10 years old.");
                return false;
            }

            // Validation for Email
            const emailPattern = /^[A-Za-z0-9+_.-]+@(.+)$/;
            if (!email.match(emailPattern)) {
                alert("Invalid email format");
                return false;
            }

            // Validation for Password
            if (password.length < 8) {
                alert("Password is less than the expected length of 8 characters");
                return false;
            }

            return true; // Form is valid
        }
    </script>
</body>
</html>
