<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.fssa.projectprovision.model.Task" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Task</title>
    <style>
    /* styles.css */


        /* Apply styles to the entire page */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100%; /* Set the body height to 100% to prevent scrolling */
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f4f4f4;
        }

        /* Style the form container */
        .container {
            max-width: 400px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Style form labels and inputs */
        label {
            font-weight: bold;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
     
<jsp:include page="sidebar.jsp"></jsp:include>
    <form id="add" action="updateTask" method="post">
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
