<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Task List</title>
</head>
<body>
    <h1>Task List</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Details</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <!-- Loop through tasks and generate rows -->
        <c:forEach items="${tasks}" var="task">
            <tr>
                <td>${task.getId()}</td>
                <td>${task.getTaskName()}</td>
                <td>${task.getTaskDetails()}</td>
                <td><a href="editTask?id=${task.getId()}">Edit</a></td>
                <td>
                    <form action="deleteTask" method="post">
                        <input type="hidden" name="id" value="${task.getId()}">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="createTask.html">Create New Task</a>
</body>
</html>
