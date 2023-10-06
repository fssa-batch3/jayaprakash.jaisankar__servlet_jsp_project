<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
  <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
      crossorigin="anonymous"
    />

    <link
      href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
      rel="stylesheet"
    />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/login.css" />
 <style>
  header {
    background-color: #00356F;
    color: #fff;
    padding: 2px;
  }
  
  header h1 {
    margin: 0;
  }
  .vh-100{
  margin-top:-69px;
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
<section class="vh-100">

  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
          class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
        <form action="<%=request.getContextPath()%>/LoginServlet1" method="post">
          <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
            <p class="lead fw-normal mb-0 me-3">Sign in with</p>
            <button type="button" class="btn btn-primary btn-floating mx-1">
              <i class="fab fa-facebook-f"></i>
            </button>

            <button type="button" class="btn btn-primary btn-floating mx-1">
              <i class="fab fa-twitter"></i>
            </button>

            <button type="button" class="btn btn-primary btn-floating mx-1">
              <i class="fab fa-linkedin-in"></i>
            </button>
          </div>

          <div class="divider d-flex align-items-center my-4">
            <p class="text-center fw-bold mx-3 mb-0">Or</p>
          </div>
          <div>
<%
	String errorMessage = request.getParameter("errorMessage");
	if (errorMessage != null) {
		out.println("<p>" + errorMessage + "</p>");
	}
	%>
          <!-- Email input -->
          <div class="form-outline mb-4">
            <input type="email"  name="email" id="form3Example3" class="form-control form-control-lg"
              placeholder="Enter a valid email address" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Please enter a valid email address (e.g., name@example.com)" required />
            <label class="form-label" for="form3Example3">Email address</label>
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
            <input type="password"  name="password" id="form3Example4" class="form-control form-control-lg"
              placeholder="Enter password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" name="password" required/>
            <label class="form-label" for="form3Example4">Password</label>
          </div>

          <div class="d-flex justify-content-between align-items-center">
            <!-- Checkbox -->
            <div class="form-check mb-0">
              <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
              <label class="form-check-label" for="form2Example3">
                Remember me
              </label>
            </div>
            </div>
            <a href="#!" class="text-body">Forgot password?</a>
          </div>

          <div class="text-center text-lg-start mt-4 pt-2">
        <form action="<%=request.getContextPath()%>/LoginServlet1" method="POST">
  <button type="submit" class="btn btn-primary btn-lg"
          style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
</form>

            <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="<%=request.getContextPath()%>/pages/register.jsp"
                class="link-danger">Register</a></p>
          </div>

        </form>
      </div>
    </div>
  </div>
  <div
    class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
    <!-- Copyright -->
    <div class="text-white mb-3 mb-md-0">
      Copyright © 2020. All rights reserved.
    </div>
    <!-- Copyright -->

    <!-- Right -->
    <div>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-facebook-f"></i>
      </a>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-twitter"></i>
      </a>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-google"></i>
      </a>
      <a href="#!" class="text-white">
        <i class="fab fa-linkedin-in"></i>
      </a>
    </div>
    <!-- Right -->
  </div>
</section>
</body>
</html>