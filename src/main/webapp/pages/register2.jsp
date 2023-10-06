<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/register1.css" />
</head>
<body>
<section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row justify-content-center align-items-center h-100">
      <div class="col-12 col-lg-9 col-xl-7">
        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
          <div class="card-body p-4 p-md-5">
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registration Form</h3>
             <%
	String errorMessage = request.getParameter("errorMessage");
	if (errorMessage != null) {
		out.println("<p>" + errorMessage + "</p>");
	}
	%>
            <form>

              <div class="row">
                <div class="col-md-6 mb-4">

                  <div class="form-outline">
                    <input type="text" id="firstName" class="form-control form-control-lg" name="name" required/>
                    <label class="form-label" for="firstName">Name</label>
                  </div>

                </div>
                <div class="col-md-6 mb-4">

                    <div class="form-outline"> 
                    <input type="tel" id="phoneNumber" class="form-control form-control-lg" maxlength="10" name="mobileNumber" required />
                    <label class="form-label" for="phoneNumber">Phone Number</label>
                  </div>
                  
                </div>
              </div>

              <div class="row">
                <div class="col-md-6 mb-4 d-flex align-items-center">

                  <div class="form-outline datepicker w-100">
                    <input type="date" class="form-control form-control-lg" id="birthdayDate" name="dateOfBirth" required/>
                    <label for="birthdayDate" class="form-label">DOB</label>
                  </div>

                </div>
                <div class="col-md-6 mb-4">

                    <h6 class="mb-2 pb-1">Gender: </h6>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" required id="femaleGender"
                value="F" checked />
            <label class="form-check-label" for="femaleGender">F</label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" required id="maleGender"
                value="M" />
            <label class="form-check-label" for="maleGender">M</label>
        </div>

                  

                </div>
              </div>

              <div class="row">
                <div class="col-md-6 mb-4 pb-2">

                  <div class="form-outline">
                    <input type="email" id="emailAddress"  name="email"class="form-control form-control-lg" placeholder="name@example.com" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Please enter a valid email address (e.g., name@example.com)" />
                    <label class="form-label" for="emailAddress">Email</label>
                  </div>

                </div>
             
              </div>

              <div class="row">
              <div class="col-md-6 mb-4 pb-2">
                <div class="form-outline">
<input type="password" id="password" class="form-control form-control-lg"  maxlength="8" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"  name="password" required />
                    <label class="form-label" for="password">Password</label>
</div>
                </div>
              </div>

              <div class="mt-4 pt-2">
              <form action="<%=request.getContextPath()%>/LoginServlet1" method="POST">
                <input class="btn btn-primary btn-lg" type="submit" value="Submit" />
                </form>
              </div>

            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>