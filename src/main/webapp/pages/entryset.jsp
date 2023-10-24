<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Calendar Entry</title>
    
</head>
<body>
    <h1>Create Calendar Entry</h1>
    <form id="calendarForm" action="<%= request.getContextPath() %>/create-calendar-entry" method="post">
    <%
	String errorMessage = request.getParameter("errorMessage");
	if (errorMessage != null) {
		out.println("<p>" + errorMessage + "</p>");
	}
	%>
        <label for="url">URL:</label>
        <input type="text" id="url" name="url" required><br>
<button>submit</button>
       </form>
</body>
</html>
