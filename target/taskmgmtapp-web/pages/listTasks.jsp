<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fssa.projectprovision.model.Task" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Tasks</title>
    
    <!-- Link to your external CSS file -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style2.css" />
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/listtask.css" />
    
</head>
<body>
<jsp:include page="SIDEBAR.jsp" />
 
    <div class="container">
        <h1 class="task-status">List of Tasks</h1>
        <% List<Task> taskList = (List<Task>) request.getAttribute("taskList");
            if (taskList != null) {
                for (Task task : taskList) {%>
                    <div class="task-item">
                        <span class="task-status">Project Status <a href="editTask?id=<%= task.getId() %>">View Details</a></span>
                        <span class="task-status1"> <a href="deleteTask?id=<%= task.getId() %>">Delete</a></span>
                           <a href=" <%=request.getContextPath()%>/pages/addmilestone.jsp?taskId=<%= task.getId() %>">Add</a>
                        <span class="task"> <a href="listmilestones?id=<%= task.getId() %>">Create</a></span>
                       
                         
                        <p class="task-name">ProjectName:<%= task.getTaskName() %></p>
                        <p class="project-name"><i class='bx bx-briefcase'></i>ProjectDetails:<%= task.getTaskDetails() %></p>
                        <div class="task-due">
                            <p><i class='bx bx-time'></i>Duedate:<%= task.getTaskDue() %></p>
                            <a class="task-assignee" href="mailto:sample@example.com"><i class='bx bx-user-circle'></i>Assignee:<%= task.getTaskAssignee() %></a>
                        </div>
                        <p class="task-priority"><i class="bx bx-circle" id="bx-circle-1"></i>ProjectPriority:<%= task.getTaskPriority() %></p>
                    </div>
                <%
                }
            }
        %>
    </div>
</body>
</html>
