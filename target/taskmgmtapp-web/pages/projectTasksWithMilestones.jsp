<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fssa.projectprovision.model.Milestone" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Project Tasks with Milestones</title>
    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style2.css" />
    <script src="https://apis.google.com/js/api.js"></script>
 
    <style>
      /* Add your CSS styles here */
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
    <div class="sidebar close">
     <div class="logo-details">
        <a href="/index2.html"> <i class="bx bx-task"></i></a>
        <span class="logo_name">Project</span>
      </div>
      <ul class="nav-links">
        <li></li>
        <li>
          <a href="./mytodo.html">
            <i class="bx bx-task"></i>
            <span class="link_name">My Project's</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="./mytodo.html">My Project's</a></li>
          </ul>
        </li>
        <li></li>
        <li class="active">
          <a href="#">
            <i class="bx bx-history"></i>
            <span class="link_name">All Project's</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="./mytodo.html">All Project's</a></li>
          </ul>
        </li>
        <li>
          <div class="icon-link">
            <a href="#">
              <i class="bx bx-news"></i>
              <span class="link_name">Category</span>
            </a>
            <i class="bx bxs-chevron-down arrow"></i>
          </div>
          <ul class="sub-menu">
            <li><a class="link_name" href="#">Category</a></li>

            <li><a href="#">Work/Professional Tasks</a></li>
            <li><a href="#">Academic Tasks</a></li>
          </ul>
        </li>
        <li>
          <div class="icon-link">
            <a href="#">
              <i class="bx bx-news"></i>
              <span class="link_name">Templates</span>
            </a>
            <i class="bx bxs-chevron-down arrow"></i>
          </div>
          <ul class="sub-menu">
            <li><a class="link_name" href="#">Templates</a></li>
            <li><a href="pages/freetemplates.html">Free Templates</a></li>
            <li><a href="#">Paid Templates</a></li>
          </ul>
        </li>
        <li></li>
        <li>
          <a href="#">
            <i class="bx bx-refresh"></i>
            <span class="link_name">Recurring Project's</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="#">Recurring Project's</a></li>
          </ul>
        </li>
        <li>
          <a href="#">
            <i class="bx bx-cog"></i>
            <span class="link_name">Settings</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="#">Settings</a></li>
          </ul>
        </li>
        <li>
          <a href="#">
            <i class="bx bx-moon"></i>
            <span class="link_name">Dark Mode</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="#">Dark Mode</a></li>
          </ul>
        </li>
        <li>
          <form id="logoutbtn">
            <button class="logoutbtn" type="submit">
              <i class="bx bx-log-out"></i>
              <span class="link_name">LogOut</span>
            </button>
          </form>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="#">LogOut</a></li>
          </ul>
        </li>
        <li>
          <div class="profile-details">
            <a class="profile-content" href="/pages/userprofile1.html">
              <img id="profile_pic" src="" alt="profileImg" />
            </a>
            <div class="name-job">
              <div class="profile_name" id="profile_name"></div>
              <div class="job">Project User</div>
            </div>
            <i class="bx bx-log-out"></i>
          </div>
        </li>
      </ul>
    </div>
    <h1>List of Project Tasks with Milestones</h1>
    <div id="task-list">
        <%
           List<Milestone> projectTasks = (List<Milestone>) request.getAttribute("projectTasks");
       
           if (projectTasks != null && !projectTasks.isEmpty()) {
               for (Milestone milestone : projectTasks) {
        %>
        <div class="dis">
            <span><%= milestone.getTaskText() %></span>
            <span><%= milestone.getTaskDate() %></span>
            <span><%= milestone.getTaskTime() %></span>
            <span><%= milestone.getIsRemainder() %></span>
            <div class="btn">
                <a href="editmilestone?id=<%= milestone.getId() %>"><button class="edit-task">Edit</button></a>
                <a href="deletemilestone?id=<%= milestone.getId() %>"><button class="delete-task">Delete</button></a>
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
