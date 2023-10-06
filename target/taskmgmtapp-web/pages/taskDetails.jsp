<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.fssa.projectprovision.model.Task" %>
<%@ page import="com.fssa.projectprovision.service.TaskService" %>
<%@ page import="com.fssa.projectprovision.dao.TaskDAO" %>

<%@ page import="com.fssa.projectprovision.service.TaskService" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Details</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style2.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/listtask.css" />
</head>
<body>
    <h1>Task Details for <%= request.getParameter("date") %></h1>
    
    <%  
    TaskDAO taskDAO = new TaskDAO(); 

    TaskService taskService = new TaskService(taskDAO);
        List<Task> taskList = taskService.getTasksForDate(request.getParameter("date"));
        if (taskList != null && !taskList.isEmpty()) {
            %>
            <table>
                <thead>
                    <tr>
                        <th>Task Name</th>
                        <th>Task Details</th>
                        <th>Due Date</th>
                        <th>Assignee</th>
                        <th>Priority</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Task task : taskList) { %>
                        <tr>
                            <td><%= task.getTaskName() %></td>
                            <td><%= task.getTaskDetails() %></td>
                            <td><%= task.getTaskDue() %></td>
                            <td><%= task.getTaskAssignee() %></td>
                            <td><%= task.getTaskPriority() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% 
        } else {
            %>
            <p>No tasks found for this date.</p>
        <% 
        }
    %>
</body>
</html>
