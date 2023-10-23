<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.fssa.projectprovision.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
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
     <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
      rel="stylesheet"
    />

    <!-- Font Awesome -->
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
      rel="stylesheet"
    />

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/login.css" />
<style>
  header {
    background-color: #0D6EFD;
    color: #fff;
    padding: 2px;
  }
  
  header h1 {
    margin: 0;
  }
  .vh-100{
  margin-top:-69px;
  }
  form{
  margin-top:120px;
  }
  .up{
  margin-top:-50px;
  }
 </style>
</head>
<body>

<section class="vh-100">

<jsp:include page="sider.jsp" />

  <div class="container-fluid h-custom">
  
  
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
          class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
          
    <form action="<%= request.getContextPath() %>//ProfileServlet" method="post" onsubmit="return validateForm()">
        <%
	String errorMessage = request.getParameter("errorMessage");
	if (errorMessage != null) {
		out.println("<p>" + errorMessage + "</p>");
	}
	%>
              <div class="form-outline mb-4">
                <label for="name">Name:</label>
                <input type="text" id="name" class="form-control form-control-lg" value="${user.name}" name="name" required>
            </div>
             <div class="form-outline mb-4">
                <label for="gender">Gender:</label>
                <input type="text" id="gender" class="form-control form-control-lg" value="${user.gender}" name="gender" required>
            </div>
            <div class="form-outline mb-4">
                <label for="mobileNumber">Mobile Number:</label>
                <input type="text" id="mobileNumber" value="${user.mobileNumber}" class="form-control form-control-lg minlength="10" name="mobileNumber" required>
            </div>
              <div class="form-outline mb-4">
              
                <label for="dateOfBirth">Date of Birth:</label>
                <input type="date" id="dateOfBirth" class="form-control form-control-lg" value="${user.dateOfBirth}" name="dateOfBirth" required>
            </div>
            <div class="form-outline mb-4">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" class="form-control form-control-lg"  value="${user.email}"  readonly placeholder="name@example.com" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Please enter a valid email address (e.g., name@example.com)" >
            </div>
      <div class="form-outline mb-4">
                <input  type="hidden" id="password" class="form-control form-control-lg" value="${user.password}" maxlength="8" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"  name="password" required>
            </div>
            
            
      <div class="form-outline mb-4">
            <label for="password">profile_pic:</label>
                <input type="url"  class="form-control form-control-lg" id="password" value="${user.profilePic}"name="profilePic" required>
            </div>
      <div class="form-outline mb-4">
              <label for="address">Address:</label>
            <input type="text" class="form-control form-control-lg" id="address" name="address" value="${user.address}" required><br><br>
     </div>
            <div class="up">
                <input type="submit" value="Update">
            </div>
        </form>

          
          </div>

        </form>
      </div>
    </div>
  </div>

  
</section>
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