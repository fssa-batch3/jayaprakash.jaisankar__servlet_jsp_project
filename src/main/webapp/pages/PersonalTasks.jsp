<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.fssa.projectprovision.model.PersonalTask" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ProjectProVision</title>
    <link
      href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style2.css" />
    <!-- End -->
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

      h2 {
        margin-top: 10px;
        margin-bottom: 30px;
      }

      #person {
        display: none;
      }

      .show2 {
        margin-top: 10px;
        margin-left: 20px;
      }

      .task-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 0;
        border-bottom: 1px solid #ccc;
      }

      .task-text {
        flex-grow: 1; /* Take up remaining space to keep buttons on the right */
      }
      .dis {
        margin-top: 20px;
        display: flex;
        justify-content: space-between;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0px 3px 10px rgba(0, 0, 0, 0.1);
      }
      .btn {
        display: flex;

        gap: 5px; /* Add gap between edit and delete buttons */
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

<jsp:include page="sider.jsp" />
    <div class="personal">
      <h2>Personal Task Management</h2>

      <div class="search-add-task">
       <button class="addtask" id="addtask" type="button" onclick="toggleTaskForm()">
  <i class="bx bx-plus"></i>&nbsp;Add your task
</button>

      </div>
      
      

      <form id="task-form	" action="<%= request.getContextPath() %>/personal" method="post">
    <div class="full">
        <div class="todo">
            <input type="text" id="task" name="taskName" placeholder="Enter a task" />
        </div>
        <div class="todo">
            <input type="checkbox" id="remain" name="remainder" /><span>Remainder</span>
        </div>
        <div class="todo">
            <label for="date">Select date:</label>
            <input type="date" id="date" name="taskDate" />
        </div>
        <div class="todo">
            <label for="time">Select time:</label>
            <input type="time" id="time" name="taskTime" />
        </div>
        <div class="todo"><button type="submit">Add Task</button></div>
    </div>
</form>
 
      <div class="show2">
        <div id="task-list"></div>
      </div>
    </div>
    <script>
  function toggleTaskForm() {
    var taskForm = document.getElementById("task-form");
    if (taskForm.style.display === "none" || taskForm.style.display === "") {
      taskForm.style.display = "block"; // Show the form
    } else {
      taskForm.style.display = "none"; // Hide the form
    }
  }
</script>
    
  </body>
</html>
