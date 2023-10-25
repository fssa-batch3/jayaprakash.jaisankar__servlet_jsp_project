<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Calendar Entry</title>
     <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
        }
              
        
       #calendarForm {
            margin: 100px;
            padding:20px;
            padding-left:100px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: left;
        }
              
        
      #url {
            width: 50%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        
        #btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<jsp:include page="sider.jsp" />
  
    <form id="calendarForm" action="<%= request.getContextPath() %>/create-calendar-entry" method="post">
    <%
	String errorMessage = request.getParameter("errorMessage");
	if (errorMessage != null) {
		out.println("<p>" + errorMessage + "</p>");
	}
	%>
        <label for="url">URL:</label>
        <input type="text" id="url" name="url" required><br>
<button id="btn">submit</button>
       </form>
</body>
</html>
