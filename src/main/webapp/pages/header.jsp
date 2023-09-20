<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/index.css" />
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
            <form action="projectprovisionlogin.jsp">
              <button type="submit" class="login-btn">LogIn</button>&emsp;
            </form>
          </div>
          <div>
            <form action="projectprovisionregister.jsp">
              <button type="submit" class="signup-btn">SignUp</button>
            </form>
          </div>
        </div>
      </nav>
    </header>
</body>
</html>