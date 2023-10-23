<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Personal Task</title>
        <style>
        /* Apply basic styling to the entire page */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        /* Style the header */
        h1 {
            text-align: center;
            background-color: #333;
            color: #fff;
            padding: 10px;
        }

        /* Style the form container */
        #add {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }

        /* Style form labels and inputs */
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"],
        input[type="time"],
        input[type="checkbox"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        /* Style the submit button */
        input[type="submit"] {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="hidden"] {
            display: none;
        }

        /* Style the submit button on hover */
        input[type="submit"]:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <h1>Edit Personal Task</h1>
    <div>
        <%-- Display error message if present --%>
        <c:if test="${not empty requestScope.errorMessage}">
            <div style="color: red;">${requestScope.errorMessage}</div>
        </c:if>

        <c:choose>
            <c:when test="${not empty requestScope.task}">
                <%-- PersonalTask object is available, display the form for editing --%>
                <form action="<%=request.getContextPath() %>/updatepersonal" method="post">
                    <input type="hidden" name="taskId" value="${requestScope.task.taskId}" />

                    <label for="taskName">Task Name:</label>
                    <input type="text" id="taskName" name="taskName" value="${requestScope.task.taskName}" required/><br/><br/>

                    <label for="remainder">Remainder:</label>
                    <input type="checkbox" id="remainder" name="remainder" ${requestScope.task.remainder ? 'checked' : ''} /><br/><br/>
                     
                    <label for="taskDate">Task Date:</label>
                    <input type="date" id="taskDate" name="taskDate" value="${requestScope.task.taskDate}" required/><br/><br/>

                    <label for="taskTime">Task Time:</label>
                    <input type="time" id="taskTime" name="taskTime" value="${requestScope.task.taskTime}" required/><br/><br/>

                    <input type="submit" value="Update Task"/>
                </form>
            </c:when>
            <c:otherwise>
                <%-- PersonalTask object is not available, display an error message --%>
                <div style="color: red;">Task not found.</div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
