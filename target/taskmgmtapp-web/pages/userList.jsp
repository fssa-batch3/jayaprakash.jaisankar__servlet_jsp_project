<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fssa.projectprovision.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Users</title>
</head>
<body>
    <h1>List of Users</h1>
    <table border="1">
        <tr> 
            <th>ID</th>
            <th>Name</th>
            <th>Gender</th>
            <th>Mobile Number</th>
            <th>Date of Birth</th>
            <th>Address</th>
            <th>About Me</th>
            <th>Email</th>
            <th>Password</th>
            <th>Profile Pic</th>
            <th>My Todos</th>
            <th>User ID</th>
        </tr>
        <%
           List<User> userList = (List<User>) request.getAttribute("userList");
           if (userList != null && !userList.isEmpty()) {
               for (User user : userList) {
        %>
           <tr>
               <td><%= user.getId() %></td>
               <td><%= user.getName() %></td>
               <td><%= user.getGender() %></td>
               <td><%= user.getMobileNumber() %></td>             
               <td><%= user.getDateOfBirth() %></td>
               <td><%= user.getAddress() %></td>
               <td><%= user.getAboutMe() %></td>
               <td><%= user.getEmail() %></td>
               <td><%= user.getPassword() %></td>
               <td><%= user.getProfilePic() %></td>
               <td><%= user.getMyTodos() %></td>
               <td><%= user.getUserId() %></td>
           </tr>
        <%
               }
           } else {
        %>
           <tr>
               <td colspan="12">No users available.</td>
           </tr>
        <%
           }
        %>
    </table>
</body>
</html>
