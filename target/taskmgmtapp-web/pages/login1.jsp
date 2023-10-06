	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="style.css">
   <style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #E4E9F7;
  }

.login-container {
    width: 300px;
    margin: 150px auto;
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    margin-bottom: 20px;
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

button {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}
 header {
    background-color: #00356F;
    color: #fff;
    padding: 20px;
  }
  
  header h1 {
    margin: 0;
  }

</style>
</head>
<body>
<header>
      <nav class="navbar">
        <div>
          <h1 class="logo-title">
            <i class="bx bx-task"></i> Project Management
          </h1>
        </div>
        <div class="btns">
          <div>
            
          </div>
          <div>
           
          </div>
        </div>
      </nav>
    </header>
    <div class="login-container">
        <h1>Login</h1>
        	<%
	String errorMessage = request.getParameter("errorMessage");
	if (errorMessage != null) {
		out.println("<p>" + errorMessage + "</p>");
	}
	%>
      <form action="<%=request.getContextPath()%>/LoginServlet1" method="post">
  <label for="email">Email:</label>
  <input type="email" id="email" name="email" placeholder="name@example.com" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Please enter a valid email address (e.g., name@example.com)" required>
  <br>
  <label for="password">Password:</label>
  <input type="password" id="password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" name="password" required>
  <button type="submit">Login</button>
</form>

    </div>
</body>
</html>