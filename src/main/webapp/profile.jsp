<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
</head>
<body>
    <h1>User Profile</h1>
    
    <c:if test="${not empty user}">
        <p>Name: ${user.name}</p>
        <p>Email: ${user.email}</p>
        <p>Gender: ${user.gender}</p>
        <p>Mobile Number: ${user.mobileNumber}</p>
        <p>Date of Birth: ${user.dateOfBirth}</p>
        <p>Address: ${user.address}</p>
        <p>About Me: ${user.aboutMe}</p>
        <!-- You can add more user profile information here -->
    </c:if>
    
    <a href="<%= request.getContextPath() %>/home.jsp">Back to Home</a>
</body>
</html>
