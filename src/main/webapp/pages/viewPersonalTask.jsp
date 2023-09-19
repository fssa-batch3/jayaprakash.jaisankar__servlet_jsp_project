<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fssa.projectprovision.model.PersonalTask" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Personal Tasks</title>
</head>
<body>
    <h1>List of Personal Tasks</h1>
    
    <table border="1">
        <tr>
            <th>Task ID</th>
            <th>Task Name</th>
            <th>Remainder</th>
            <th>Task Date</th>
            <th>Task Time</th>
        </tr>
        <% List<PersonalTask> personalTasks = (List<PersonalTask>) request.getAttribute("personalTasks");
           if (personalTasks != null) {
               for (PersonalTask task : personalTasks) { %>
                   <tr>
                       <td><%= task.getTaskId() %></td>
                       <td><%= task.getTaskName() %></td>
                       <td><%= task.isRemainder() %></td>
                       <td><%= task.getTaskDate() %></td>
                       <td><%= task.getTaskTime() %></td>
                   </tr>
               <% }
           } %>
    </table>
    
    <a href="${pageContext.request.contextPath}/index2.jsp">Back to Home</a>
</body>
</html>
