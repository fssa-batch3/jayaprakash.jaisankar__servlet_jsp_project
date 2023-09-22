<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fssa.projectprovision.model.Task" %>
<%@ page import="com.fssa.projectprovision.model.Milestone" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Tasks</title>
    
    <!-- Link to your external CSS files -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style2.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/listtask.css" />
</head>
<body>
<jsp:include page="sider.jsp" />

<%
    HttpSession ses = request.getSession();
    Long userId = (Long) ses.getAttribute("userId");
    String taskAssignee = (String) ses.getAttribute("taskassignee");
%>

<div class="container">
    <h1 class="task-status">List of Tasks</h1>
    <% 
        List<Task> taskList = (List<Task>) request.getAttribute("taskList");
        if (taskList != null) {
            for (Task task : taskList) {
                boolean isTaskAssignee = task.isAssignee(taskAssignee);
    %>
    <div class="task-item">
        <%
            String errorMessage = request.getParameter("errorMessage");
            if (errorMessage != null) {
                out.println("<p>" + errorMessage + "</p>");
            }
        %>
    
     
        
        <span class="task-status3"> <a href="<%=request.getContextPath()%>/projectTasksWithMilestones?taskId=<%= task.getId() %>">View</a></span>
   
         
        <%
            String errorMessag = request.getParameter("errorMessage");
            if (errorMessage != null) {
                out.println("<p>" + errorMessag + "</p>");
            }
        %>
        <p class="task-name">Project Name:<%= task.getTaskName() %></p>
        <p class="project-name"><i class='bx bx-briefcase'></i>Project Details:<%= task.getTaskDetails() %></p>
        <div class="task-due">
            <p><i class='bx bx-time'></i>Due date:<%= task.getTaskDue() %></p>
            <a class="task-assignee" href="mailto:<%= task.getTaskAssignee() %>"><i class='bx bx-user-circle'></i>Assignee:<%= task.getTaskAssignee() %></a>
        </div>
        <p class="task-priority"><i class="bx bx-circle" id="bx-circle-1"></i>Project Priority:<%= task.getTaskPriority() %></p>
    </div>
    <%
            }
        }
    %>
</div>
</body>
</html>
