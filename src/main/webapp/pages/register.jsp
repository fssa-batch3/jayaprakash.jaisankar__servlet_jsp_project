<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
        <form action="<%= request.getContextPath() %>/register1" method="post"  onsubmit="return validateForm()">
        <%
	String errorMessage = request.getParameter("errorMessage");
	if (errorMessage != null) {
		out.println("<p>" + errorMessage + "</p>");
	}
	%>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <input type="text" id="gender" name="gender" required>
            </div>
            <div class="form-group">
                <label for="mobileNumber">Mobile Number:</label>
                <input type="text" id="mobileNumber" minlength="10" name="mobileNumber" required>
            </div>
            <div class="form-group">
                <label for="dateOfBirth">Date of Birth:</label>
                <input type="date" id="dateOfBirth" name="dateOfBirth" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="name@example.com" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Please enter a valid email address (e.g., name@example.com)" >
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" maxlength="8" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"  name="password" required>
            </div>
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