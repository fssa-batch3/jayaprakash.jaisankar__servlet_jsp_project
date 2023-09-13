
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up | ProjectProVision</title>
  <link rel="stylesheet" href="assets/css/register.css">
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
   <main class="fullpage">

    <div>
      <h1 class="logo-title"><i class="bx bx-task"></i> TodoMaster</h1>
    </div>
    <div class="signup">

      <h1 class="create-h1"><br>Create your account</h1>

      <!-- form start -->
      <form id="form" action="register" method="post">
        <div class="input-display">
          <div>
            <div class="form-floating" id="emailinput">
              <input type="text" class="form-control" id="username" name="name" placeholder="Username" required
              pattern="[A-Za-z0-9_]{1,15}" 
                title="Username (letters and numbers only, no punctuation or special characters)">
              <label for="username">Username</label>
            </div>
            <br>
            <select class="form-select" id="select" name="gender" aria-label="Default select example"  required>
              <option selected>Select Your Gender</option>
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="other">Other</option>
            </select>
            <br>
            <div class="form-floating mb-3" id="passinput">
              <input type="text" class="form-control" id="mobile-number" name="mobile_number" placeholder="Mobile Number" required
                pattern="[0-9]{10}" title="It should Contain 10 Numbers" >
              <label for="mobile-number">Mobile Number</label>
            </div>
            <div class="form-floating mb-3" id="passinput">
              <input type="date" class="form-control" id="date-of-birth" name="date_of_birth" required/>
              <label for="date-of-birth">Date of Birth</label>
            </div>
          </div>
          <div>
            <br>
            <br>
            <div class="form-floating mb-3" id="passinput">
              <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" requiredpattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[cC][oO][mM]$"
               title="Please Enter the Valid Email" />
              <label for="email">Email address</label>
            </div>
            <div class="form-floating" id="passinput">
              <input type="password" class="form-control" id="password" name="password" placeholder="Password" required
              pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{8,}$"
                title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
              <label for="password">Password</label>
            </div>
            <div class="form-floating" id="passinput">
              <input type="password" class="form-control" id="confirm-password" placeholder="Password" required
              pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{8,}$"
                title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
              <label for="confirm-password">Confirm Password</label>
            </div>
          </div>
        </div>
        <button class="submit-signup" type="submit">Create an account</button>
      </form>
      <div class="signin-link"><span class="hint--bottom hint--rounded" aria-label="for Existing Users"><a class="login-link" href="signin.html">Already have an account? Sign In to your
          Account</a></div>
    </div>
  </main>
</body>
</html>
