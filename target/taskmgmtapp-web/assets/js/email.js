/**
 * 
 */
 document.getElementById("verify-button").addEventListener("click", function() {
        // Get the email entered by the user
        const emailInput = document.getElementById("email");
        const email = emailInput.value;

        // Check if the email is valid before proceeding
        if (!isValidEmail(email)) {
            alert("Please enter a valid email address.");
            return;
        }

        // Generate a random 6-digit OTP
        const otp = Math.floor(100000 + Math.random() * 900000);

        // Send the OTP to the email using Email.js
        const message = {
            from: 'jayaprakash.jaisankar@fssa.freshworks.com',
            to: email,
            subject: 'OTP Verification',
            text: `Your OTP is: ${otp}`,
        };

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
        // Regular expression for basic email validation
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    