<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fssa.projectprovision.model.PersonalTask" %>
<%@ page import="com.fssa.projectprovision.service.PersonalTaskService" %>
<%@ page import="com.fssa.projectprovision.exception.ServiceException" %>
<%@ page import="javax.servlet.http.HttpSession" %>


<html>
<head>
    <meta charset="UTF-8">
    <title>List of Personal Tasks</title>
   <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #e4e9f7;
      }

      #task-list {
        list-style-type: none;
        padding-top: 30px;
      }

      .personal {
        margin-left: 100px;
      }

      h1 {
        margin-top: 10px;
        margin-left: 100px;
        margin-bottom: 30px;
      }

      .dis {
        margin-top: 20px;
        margin-left: 100px;
        display: flex;
        justify-content: space-between;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0px 3px 10px rgba(0, 0, 0, 0.1);
      }

      .btn {
        display: flex;
        gap: 5px;
      }

      .edit-task,
      .delete-task {
        background-color: #f44336;
        color: white;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s;
      }

      .edit-task {
        background-color: #f7b731;
      }

      .delete-task:hover {
        background-color: #c3180e;
      }

      .full {
        width: 400px;
        margin-top: 20px;
        margin-left: 20px;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0px 3px 10px rgba(0, 0, 0, 0.1);
      }

      .todo {
        margin: 10px 0;
        display: flex;
        align-items: center;
      }

      .todo input[type="text"] {
        border: none;
        border-bottom: 2px solid #ccc;
        padding: 5px;
        width: 100%;
        font-size: 16px;
        outline: none;
        transition: border-color 0.3s;
      }

      .todo input[type="text"]:focus {
        border-color: #007bff;
      }

      .todo input[type="checkbox"] {
        margin-right: 5px;
      }

      .todo span {
        font-size: 16px;
      }
      p{
      margin-left:100px;
      }

      #add-task {
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 8px 16px;
        cursor: pointer;
        transition: background-color 0.3s;
      }

      #add-task:hover {
        background-color: #0056b3;
      }
      .title {
  font-weight: bold;
}

span:contains("Task: ") {
  color: blue;
}

span:contains("TaskDueDate: ") {
  color: red;
}

span:contains("TaskTime: ") {
  color: green;
}

span:contains("Remainder: ") {
  color: purple;
}
      .pagination-buttons{
      margin-left:100px;
      }
    </style>
    
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/page.css" />
</head>
<body>
    <jsp:include page="sider.jsp" />

    <h1>List of Personal Tasks</h1>
    <div id="task-list">
        <%
        List<PersonalTask> tasks = (List<PersonalTask>) request.getAttribute("tasks");
        Long loggedInUserId = (Long) session.getAttribute("userId");
        
        int pageSize = 5; 
        int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
        int totalTasks = tasks.size();
        int totalPages = (int) Math.ceil((double) totalTasks / pageSize);
        int startIndex = (currentPage - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalTasks);

        if (tasks != null && !tasks.isEmpty()) {
        	for (int i = startIndex; i < endIndex; i++) {
        		PersonalTask task = tasks.get(i);       %>
                <div class="dis">
                    <span class="title">Task: <%= task.getTaskName() %></span>
                    <span class="title">TaskDueDate: <%= task.getTaskDate() %></span>
                    <span class="title">TaskTime: <%= task.getTaskTime() %></span>
                    <span class="title">Remainder: <%= task.isRemainder() %></span>
                    <div class="btn">
                        <%-- Add your condition for isCreator here --%>
                        <a href="editpersonal?id=<%= task.getTaskId() %>"><button class="edit-task">Edit</button></a>
                        <a href="deletepersonal?id=<%= task.getTaskId() %>"><button class="delete-task">Delete</button></a>
                    </div>
                   
</div>
             
                <%
            }
        } else {
        %>
        <p>No personal tasks available.</p>
        <%
        }
        %>
         <div class="pagination-buttons">
    <% if (currentPage > 1) { %>
        <a href="?page=<%= currentPage - 1 %>"><<</a>
    <% } else { %>
        <span class="disabled"><<</span>
    <% } %>

    <% for (int j = 1; j <= totalPages; j++) { %>
        <a href="?page=<%= j %>" <%= (j == currentPage) ? "class='active'" : "" %>><%= j %></a>
    <% } %>

    <% if (currentPage < totalPages) { %>
        <a href="?page=<%= currentPage + 1 %>">>></a>
    <% } else { %>
        <span class="disabled">>></span>
    <% } %>
</div>
        

    </div>
</body>
</html>
