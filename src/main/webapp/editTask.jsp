<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.fssa.projectprovision.model.Task" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Task</title>
</head>
<body>
    <h1>Edit Task</h1>
    <form action="updateTask" method="post">
        <input type="hidden" name="taskId" value="${task.id}">
        
        <label for="taskname">Task Name:</label>
        <input type="text" name="taskname" value="${task.taskName}" required><br>
        
        <label for="taskdetails">Task Details:</label>
        <textarea name="taskdetails">${task.taskDetails}</textarea><br>
        
        <label for="taskcategory">Task Category:</label>
        <input type="text" name="taskcategory" value="${task.taskCategory}" required><br>
        
        <label for="taskdue">Task Due Date:</label>
        <input type="text" name="taskdue" value="${task.taskDue}" required><br>
        
        <label for="taskassignee">Task Assignee:</label>
        <input type="text" name="taskassignee" value="${task.taskAssignee}" required><br>
        
        <label for="taskstatus">Task Status:</label>
        <input type="text" name="taskstatus" value="${task.taskStatus}" required><br>
        
        <label for="projectname">Project Name:</label>
        <input type="text" name="projectname" value="${task.projectName}" required><br>
        
        <label for="taskpriority">Task Priority:</label>
        <input type="text" name="taskpriority" value="${task.taskPriority}" required><br>
        
        <label for="tasktags">Task Tags:</label>
        <input type="text" name="tasktags" value="${task.taskTags}" required><br>
        
         <label for="todoid">TODO ID:</label>
        <input type="text" name="todoid" value="${task.todoId}" required><br>
    
        
        <input type="submit" value="Update Task">
    </form>
</body>
</html>
