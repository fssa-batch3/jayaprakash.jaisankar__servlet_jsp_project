<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login Page</title>
   <style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f1f1f1;
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

</style>
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <form >
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>
            
            <button id="verify-button">Verify</button>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <button type="submit">Login</button>
        </form>
    </div>
    <script src="https://cdn.emailjs.com/dist/email.min.js"></script>
    
    <script>
    let verify = document.getElementById("verify-button")
    verify.addEventListener("click", function(e) {
        e.preventDefault();
        const emailInput = document.getElementById("email");
        const email = emailInput.value;

        if (!isValidEmail(email)) {
            alert("Please enter a valid email address.");
            return;
        }

        const otp = Math.floor(100000 + Math.random() * 900000);

        const message = {
            from: 'jayaprakash.jaisankar@fssa.freshworks.com',
            to: email,
            subject: 'OTP Verification',
            text: `Your OTP is: ${otp}`,
        };

        const YOUR_EMAILJS_PUBLIC_KEY = 'YLO9BGIIh2G5zIqvB';
     emailjs.init(YOUR_EMAILJS_PUBLIC_KEY);

     emailjs.send("service_1pzxrcb", "template_9u9jmia", message)
         .then(function(response) {
             console.log('Email sent successfully:', response);
             alert('OTP sent to your email. Check your inbox.');
         })
         .catch(function(error) {
             console.error('Error sending email:', error);
             alert('Failed to send OTP. Please try again later.');
         });

    });

    function isValidEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    
    </script>
</body>
</html>
