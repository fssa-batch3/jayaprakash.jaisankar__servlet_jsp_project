<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fssa.projectprovision.model.Task" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Tasks</title>
    <style>
    table {
    border-collapse: collapse;
    width: 80%; /* Reduce the table width to 80% of the container */
    margin: 20px auto; /* Center the table horizontally and provide 20px margin at the top */
}

th, td {
    padding: 8px 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #f5f5f5;
}

/* CSS for links */
a {
    text-decoration: none;
    color: #007bff;
    margin-right: 10px;
}

    </style>
</head>
<body>
<jsp:include page="sidebar.jsp"></jsp:include>

    <table border="1">
        <tr>
            <th>Project Name</th>
            <th>Project Details</th>
            <th>Project Category</th>
            <th>Project Due Date</th>
            <th>Project Assignee</th>
            <th>Project Status</th>
            <th>Project Name</th>
            <th>Project Priority</th>
            <th>Project Tags</th>
            <th>Actions</th> <!-- Add a column for actions -->
            <!-- Add more table headers for other task properties -->
        </tr>
        <% List<Task> taskList = (List<Task>) request.getAttribute("taskList");
             if (taskList != null) {
                for (Task task : taskList) {%>
                
            <tr>
                <td><%= task.getTaskName() %></td>
                <td><%= task.getTaskDetails() %></td>
                <td><%= task.getTaskCategory() %></td>
                <td><%= task.getTaskDue() %></td>
                <td><%= task.getTaskAssignee() %></td>
                <td><%= task.getTaskStatus() %></td>
                <td><%= task.getProjectName() %></td>
                <td><%= task.getTaskPriority() %></td>
                <td><%= task.getTaskTags() %></td>
                <td>
                    <!-- View Task Link -->
  <!-- Add Task Link -->
                <a href=" addmilestone.jsp?taskId=<%= task.getId() %>">Add</a>
                    <!-- Edit Task Link -->
                    <a href="editTask?id=<%= task.getId() %>">Edit</a>
                    <!-- Delete Task Link -->
                    <a href="deleteTask?id=<%= task.getId() %>">Delete</a>
   
                </td>
            </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
