<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ProjectProVision</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/tododetails.css" />
    <!-- Box icon CSS   -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
      crossorigin="anonymous"
    />

    <link
      href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
      rel="stylesheet"
    />
    <!-- End -->
  </head>
  <body>
    <div class="sidebar close">
      <div class="logo-details">
        <i class="bx bx-task"></i>
        <span class="logo_name">TodoMaster</span>
      </div>
      <ul class="nav-links">
        <li>
          <a href="#">
            <i class="bx bx-home"></i>
            <span class="link_name">Home</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="#">Home</a></li>
          </ul>
        </li>
        <li></li>
        <li>
          <a href="#">
            <i class="bx bx-task"></i>
            <span class="link_name">My Todo's</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="#">My Todo's</a></li>
          </ul>
        </li>
        <li></li>
        <li>
          <a href="#">
            <i class="bx bx-history"></i>
            <span class="link_name">Recent Todo's</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="#">Recent Todo's</a></li>
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
            <li><a href="#">Personal Tasks</a></li>
            <li><a href="#">Work/Professional Tasks</a></li>
            <li><a href="#">Academic Tasks</a></li>
            <li><a href="#">Health and Fitness Tasks</a></li>
            <li><a href="#">Financial Tasks</a></li>
            <li><a href="#">Social/Event Tasks</a></li>
            <li><a href="#">Travel Tasks</a></li>
            <li><a href="#">Home Improvement Tasks</a></li>
            <li><a href="#">Personal Growth Tasks</a></li>
            <li><a href="#">Miscellaneous/Other Tasks</a></li>
          </ul>
        </li>
        <li></li>
        <li>
          <a href="#">
            <i class="bx bx-refresh"></i>
            <span class="link_name">Recurring Todo's</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="#">Recurring Todo's</a></li>
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
          <a href="#">
            <i class="bx bx-log-out"></i>
            <span class="link_name">LogOut</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="#">LogOut</a></li>
          </ul>
        </li>
        <li>
          <div class="profile-details">
            <div class="profile-content">
              <img
                src="#"
                alt="profileImg"
              />
            </div>
            <div class="name-job">
              <div class="profile_name">jp</div>
              <div class="job">Todo User</div>
            </div>
            <i class="bx bx-log-out"></i>
          </div>
        </li>
      </ul>
    </div>
    <section class="home-section">
      <div class="home-content">
        <i class="bx bx-menu"></i>
        <span class="text">Edit Todo</span>
      </div>

    
      <div id="todo-container">
        <div class="todo-edit-form">
          <form id="form"  action="userupdate" method="post">
          
            <div id="divflex1">
              <div class="form-group">
              
                 <input type="hidden"  name="taskId" value="${task.id}" required>
                <label for="taskname">Project Name:</label>
                <input name="taskname" type="text" id="taskname" value="${task.taskName}" required  minlength="3"  pattern="^[a-zA-Z0-9]+$" title="Please enter only letters and numbers." />
              </div>
              <br />
              <div class="form-group">
                <label for="taskdetails">Project Details:</label>
                <textarea name="taskdetails" id="taskdetails">${task.taskDetails}   </textarea>
              </div>
              <br />
              <div class="form-group">
                <label for="taskcategory">Project Category:</label>
                <label for="taskcategory">Project Category:</label>
    <select
        name="taskcategory"
        class="form-select"
        aria-label="Default select example"
        id="taskcategory"
        required
    >
        <option disabled selected value="">Select Project Category</option>
          <option value="Professional" ${task.taskCategory == 'Professional' ? 'selected' : ''}>Professional</option>
        <option value="Academic" ${task.taskCategory == 'Academic' ? 'selected' : ''}>Academic</option>
        <option value="Social" ${task.taskCategory == 'Social' ? 'selected' : ''}>Social</option>
    </select>
              </div>
              <br />
              <div class="form-group">
                <label for="taskdue">Project Due Date:</label>
                <input type="date" name="taskdue" value="${task.taskDue}" id="taskdue"  min="<%=java.time.LocalDate.now()%>" value="" required />
              </div>
              <br />
              <div class="form-group">
                <label for="taskassignee">Project Assignee:</label>
                <input type="email" name="taskassignee" value="${task.taskAssignee}" id="taskassignee"   pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Please enter a valid email address (e.g., name@example.com)" readonly />
              </div>
            </div>
            <div id="divflex2">
              <div class="form-group">
                <label for="taskstatus">Project Status:</label>
                  <select
        name="taskstatus"
        class="form-select"
        aria-label="Default select example"
        id="taskstatus"
        required
    >
        <option disabled selected value="">Select Project Status</option>
        <option value="Completed" ${task.taskStatus == 'Completed' ? 'selected' : ''}>Completed</option>
        <option value="Currently Working" ${task.taskStatus == 'Currently Working' ? 'selected' : ''}>Currently Working</option>
        <option value="Not Yet Started" ${task.taskStatus == 'Not Yet Started' ? 'selected' : ''}>Not Yet Started</option>
    </select> 
              </div>
              <br />
              <div class="form-group">
                <label for="projectname">Project Name:</label>
                <input type="text" name="projectname" value="${task.projectName}"  minlength="3" id="projectname" required value="" />
              </div>
              <br />
              <div class="form-group">
                <label for="taskpriority">Project Priority:</label>
                  <select
        name="taskpriority"
        class="form-select"
        aria-label="Default select example"
        id="taskpriority"
        
        required
    >
        <option disabled selected value="">Select Project Priority</option>
        <option value="High" style="background-color: red; color: white" ${task.taskPriority == 'High' ? 'selected' : ''}>High</option>
        <option value="Medium" style="background-color: orange; color: white" ${task.taskPriority == 'Medium' ? 'selected' : ''}>Medium</option>
        <option value="Low" style="background-color: green; color: white" ${task.taskPriority == 'Low' ? 'selected' : ''}>Low</option>
    </select>
              </div>
              <br />
              <div class="form-group">
                <label for="tasktags">Project Tags:</label>
                <input type="text" name="tasktags" value="${task.taskTags}"  minlength="3" id="tasktags" required value="" />
              </div>
              <br />
              <div class="form-group">
                <label for="todoID">Project ID:</label>
                <input type="text"  name="todoid" value="${task.todoId}" id="todoID" readonly disabled />
              </div>
              <input type="hidden" name="todoid" value="${task.todoId}" />
            </div>
<div>  <button  class="update"type="submit">Update</button></div>
          </form>
             
           
         
        </div>
      </div>
    </section>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
      crossorigin="anonymous"
    ></script>
<script>



function validateForm() {
   
    var taskName = document.getElementById("projectname").value;
    var taskCategory = document.getElementById("taskcategory").value;
    var taskStatus = document.getElementById("taskstatus").value;
    var taskPriority = document.getElementById("taskpriority").value;
    var taskTags = document.getElementById("tasktags").value;
    var todoId = document.getElementById("todoid").value;

   
    var taskNamePattern = /^[a-zA-Z0-9\s]+$/;
    var taskCategoryPattern = /^[a-zA-Z\s]+$/;
    var taskStatusPattern = /^[a-zA-Z\s]+$/;
    var taskPriorityPattern = /^[a-zA-Z\s]+$/;
    var taskTagsPattern = /^[a-zA-Z0-9,\s]+$/;
    var todoIdPattern = /^[a-fA-F0-9]{32}$/;

  
    if (!taskNamePattern.test(taskName) || !taskCategoryPattern.test(taskCategory) || 
        !taskStatusPattern.test(taskStatus) || !taskPriorityPattern.test(taskPriority) || 
        !taskTagsPattern.test(taskTags) || !todoIdPattern.test(todoId)) {
        alert("Invalid input format. Please check your input.");
        return false;
    }


    return true; 
    }

</script> 
</script>
    <script src="<%=request.getContextPath()%>/assets/js/tododetails.js"></script>
  </body>
</html>
