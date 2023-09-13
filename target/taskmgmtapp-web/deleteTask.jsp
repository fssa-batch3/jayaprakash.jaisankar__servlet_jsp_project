<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Task</title>
</head>
<body>
    <h1>Delete Task</h1>
    <form action="deleteTask" method="get">
        <p>Are you sure you want to delete this task?</p>
        <input type="hidden" name="taskId" value="<%= request.getParameter("id") %>">
        <input type="submit" value="Yes, Delete">
        <a href="listTasks">Cancel</a>
    </form>
</body>
</html>
