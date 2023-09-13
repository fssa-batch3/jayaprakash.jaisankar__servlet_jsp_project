<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Task</title>
    <style>
   /* styles.css */

/* Reset some default styles for form elements */
form, input, textarea {
    margin: 0;
    padding: 0;
    border: none;
}

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.container {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    margin-bottom: 20px;
}

form {
    display: grid;
    grid-gap: 10px;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

label {
    font-weight: bold;
}

input[type="text"],
textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
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
    <h1>Create New Task</h1>
    <form action="createTask" method="post">
        <label for="taskname">Task Name:</label>
        <input type="text" name="taskname" required><br>
        
        <label for="taskdetails">Task Details:</label>
        <textarea name="taskdetails" rows="4" cols="50"></textarea><br>
        
        <label for="taskcategory">Task Category:</label>
        <input type="text" name="taskcategory"><br>
        
        <label for="taskdue">Task Due Date (YYYY-MM-DD):</label>
        <input type="text" name="taskdue" required><br>
        
        <label for="taskassignee">Task Assignee:</label>
        <input type="text" name="taskassignee"><br>
        
        <label for="taskstatus">Task Status:</label>
        <input type="text" name="taskstatus"><br>
        
        <label for="projectname">Project Name:</label>
        <input type="text" name="projectname"><br>
        
        <label for="taskpriority">Task Priority:</label>
        <input type="text" name="taskpriority"><br>
        
        <label for="tasktags">Task Tags:</label>
        <input type="text" name="tasktags"><br>
        
        <label for="todoId">Todo ID:</label>
        <input type="text" name="todoId"><br>
        
        <input type="submit" value="Create Task">
    </form>
</body>
</html>
