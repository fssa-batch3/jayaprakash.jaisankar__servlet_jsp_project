<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.fssa.projectprovision.model.Milestone" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Milestone</title>
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
display:none;
}
/* Style the submit button on hover */
input[type="submit"]:hover {
    background-color: #555;
}
    
    </style>
</head>
<body>
    
<jsp:include page="sider.jsp"></jsp:include>
    <form id="add" action="<%=request.getContextPath() %>/updatemilestone" method="post">
    	<%
	String errorMessage = request.getParameter("errorMessage");
	if (errorMessage != null) {
		out.println("<p>" + errorMessage + "</p>");
	}
	%>
     <input type="hidden" name="taskId" value="${milestone.id}">
        <label for="taskText">Task Text:</label>
         <input type="text" id="taskText" name="taskText" value="${milestone.taskText}">
        <br>
        <label for="taskDate">Task Date:</label>
        <input type="date" id="taskDate" name="taskDate" value="${milestone.taskDate }"><br>
        <label for="taskTime">Task Time:</label>
        <input type="time" id="taskTime" name="taskTime" value="${milestone. taskTime }"><br>
        <label for="isRemainder">Is Reminder:</label>
        <input type="checkbox" id="isReminder" name="isReminder" ${milestone.isRemainder ? 'checked' : ''}><br>

        <input type="submit" value="Update Milestone">
    </form>
</body>
</html>
