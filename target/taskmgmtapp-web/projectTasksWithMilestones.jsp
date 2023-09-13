<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fssa.projectprovision.model.Milestone" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Project Tasks with Milestones</title>
</head>
<style>
/* style.css */
table {

   display:flex;
   align-items:center;
   justify-content:center;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #ddd;
}

a {
    text-decoration: none;
    color: #007bff;
    margin-right: 10px;
}

a:hover {
    text-decoration: underline;
}


</style>
<body>

<jsp:include page="sidebar.jsp"></jsp:include>
    <table border="1">
        <tr> 
            <th>Task Text</th>
            <th>Task Date</th>
            <th>Task Time</th>
            <th>Is Reminder</th>
            <th>Action</th>
        </tr>
        <%
           List<Milestone> projectTasks = (List<Milestone>) request.getAttribute("projectTasks");
           if (projectTasks != null && !projectTasks.isEmpty()) {
               for (Milestone milestone : projectTasks) {
        %>
           <tr>
               <td><%= milestone.getTaskText() %></td>
               <td><%= milestone.getTaskDate() %></td>
               <td><%= milestone.getTaskTime() %></td>             
               <td><%= milestone.getIsRemainder() %></td>
                  <td>
                     <!-- Edit Task Link -->
                    <a href="editmilestone?id=<%= milestone.getId() %>">Edit</a>
                    <!-- Delete Task Link -->
                    <a href="deletemilestone?id=<%= milestone.getId() %>">Delete</a>
               </td>
           </tr>
        <%
               }
           } else {
        %>
           <tr>
               <td colspan="5">No project tasks with milestones available.</td>
           </tr>
        <%
           }
        %>
    </table>
</body>
</html>
