<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fssa.projectprovision.model.Task" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Tasks</title>
</head>
<body>
    <h1>List of Tasks</h1>
    <table border="1">
        <tr>
            <th>Task Name</th>
            <th>Task Details</th>
            <th>Task Category</th>
            <th>Task Due Date</th>
            <th>Task Assignee</th>
            <th>Task Status</th>
            <th>Project Name</th>
            <th>Task Priority</th>
            <th>Task Tags</th>
             <th>TODO ID</th>
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
                 <td><%= task.getTodoId() %></td>
                <td>
                    <!-- View Task Link -->

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
