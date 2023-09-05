<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Milestone</title>
</head>
<body>
    <h2>Add Milestone</h2>
    <form action="AddMilestoneServlet" method="post">
        <label for="task">Task:</label>
        <input type="text" name="task" required><br>
        
        <label for="date">Date:</label>
        <input type="date" name="date" required><br>
        
        <label for="time">Time:</label>
        <input type="time" name="time" required><br>
        
        <label for="reminder">Reminder:</label>
        <input type="checkbox" name="reminder"><br>
        
        <!-- Hidden input for the taskId, set its value from the task you want to associate this milestone with -->
        <input name="taskId" value="<%= request.getParameter("taskId") %>">
        
        <input type="submit" value="Add Milestone">
    </form>
</body>
</html>
