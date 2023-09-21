<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fssa.projectprovision.model.Milestone" %>
<%@ page import="com.fssa.projectprovision.dao.MilestoneDAO" %>
<%@ page import="com.fssa.projectprovision.service.MilestoneService" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Project Tasks with Milestones</title>
    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style2.css" />
    <script src="https://apis.google.com/js/api.js"></script>
 
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
    </style>
</head>
<body>
<jsp:include page="sider.jsp" />
    <h1>List of Project Tasks with Milestones</h1>
   <div id="task-list">
     <%
List<Milestone> projectTasks = (List<Milestone>) request.getAttribute("milestones");
Long loggedInUserId = (Long) session.getAttribute("userId");
System.out.println(loggedInUserId);

if (projectTasks != null && !projectTasks.isEmpty()) {
    for (Milestone milestone : projectTasks) {
        MilestoneDAO milestoneDAO = new MilestoneDAO();
        MilestoneService milestoneservice = new MilestoneService(milestoneDAO);
        System.out.println("userID:"+ milestone.getCreatorId() );
        Long milestoneCreatorId = milestoneservice.getCreatorId(milestone.getCreatorId() ); 
        
        System.out.println(milestoneCreatorId);
        boolean isCreator = loggedInUserId.equals(milestoneCreatorId);
        %>
        <div class="dis">
            <span><%= milestone.getTaskText() %></span>
            <span><%= milestone.getTaskDate() %></span>
            <span><%= milestone.getTaskTime() %></span>
            <span><%= milestone.getIsRemainder() %></span>
            <div class="btn">
                <% if (isCreator) { %>
                    <a href="editmilestone?id=<%= milestone.getId() %>"><button class="edit-task">Edit</button></a>
                    <a href="deletemilestone?id=<%= milestone.getId() %>"><button class="delete-task">Delete</button></a>
                <% } %>
            </div>
        </div>
        <%
    }
} else {
%>
<p>No project tasks with milestones available.</p>
<%
}
%>


    </div>
</body>
</html>
