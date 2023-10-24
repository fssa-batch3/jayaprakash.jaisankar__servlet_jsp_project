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
   
    
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/page.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style2.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/listtask.css" />
</head>
<body>
<jsp:include page="sider.jsp" />

<%
    HttpSession ses = request.getSession();
    Long userId = (Long) ses.getAttribute("userId");
    String taskAssignee = (String) ses.getAttribute("taskassignee");
    List<Task> taskList = (List<Task>) request.getAttribute("taskList");
    
    int pageSize = 2; 
    int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
    int totalTasks = taskList.size();
    int totalPages = (int) Math.ceil((double) totalTasks / pageSize);
    int startIndex = (currentPage - 1) * pageSize;
    int endIndex = Math.min(startIndex + pageSize, totalTasks);
%>

<div class="container">
    <h1 class="task-status">List of Tasks</h1>
    <% 
          if (taskList != null) {
        	 for (int i = startIndex; i < endIndex; i++) {
        		 Task task = taskList.get(i);
                boolean isTaskAssignee = task.isAssignee(taskAssignee);
    %>
    <div class="task-item">
        <%
            String errorMessage = request.getParameter("errorMessage");
            if (errorMessage != null) {
                out.println("<p>" + errorMessage + "</p>");
            }
        %>
    
      <%
if (isTaskAssignee) {
%>
<span class="task-status3"> <a href="<%=request.getContextPath()%>/projectTasksWithMilestones?taskId=<%= task.getId() %>">View</a></span>
<span class="task-status"><a href="tasklist2?id=<%= task.getId() %>">Status</a></span>
<%
} else {
    if ("Completed".equals(task.getTaskStatus())) {
%>
<span>Completed</span>
<%
    } else {
%>
<span class="task-status">Project Status <a href="editTask?id=<%= task.getId() %>">View Details</a></span>
<span class="task-status1"> <a href="deleteTask?id=<%= task.getId() %>">Delete</a></span>
<span class="task-status"> <a href="<%=request.getContextPath()%>/projectTasksWithMilestones?taskId=<%= task.getId() %>">View</a></span>
<a href="<%= request.getContextPath() %>/pages/addmilestone.jsp?taskId=<%= task.getId() %>&taskassignee=<%= task.getTaskAssignee() %>">Add</a>
<%
    }
}
%>

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

<div class="pagination-buttons">
    <% if (currentPage > 1) { %>
        <a href="?page=<%= currentPage - 1 %>"><<</a>
    <% } else { %>
        <span class="disabled"><<</span>
    <% } %>

    <% for (int i = 1; i <= totalPages; i++) { %>
        <a href="?page=<%= i %>" <%= (i == currentPage) ? "class='active'" : "" %>><%= i %></a>
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
