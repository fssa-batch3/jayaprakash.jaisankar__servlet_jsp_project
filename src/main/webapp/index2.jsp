<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ProjectProVision</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style2.css" />
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
    <script src="https://apis.google.com/js/api.js"></script>
    <style>


body #change {
    background-color: black;
    
}

.bx-moon {
    font-size: 24px;
}

    
    #search {
    display: flex;
    align-items: center;
}

i.bx-search {
    margin-right: -2px;
    padding-top:0px;
}

input.form-control.mr-sm-2 {
    flex: 1;
    margin-right: 10px;
}

button[type="submit"] {
    margin-right: 10px;
}
    
    
    </style>
  </head>
  <body>
<div class="sidebar close">
      <div class="logo-details">
      
<a href="<%=request.getContextPath()%>/index2.jsp">
        <i class="bx bx-task"></i></a>
        <span class="logo_name">ProjectProVision</span>
        
      
      </div>
      <ul class="nav-links">
        <li></li>
        <li>
          <a href="<%=request.getContextPath()%>/pages/mytodo.jsp">
            <i class="bx bx-task"></i>
            <span class="link_name">My project's</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="<%=request.getContextPath()%>/pages/mytodo.jsp"">My Project's</a></li>
          </ul>
        </li>
        <li></li>
        <li class="active">
          <a href="#">
            <i class="bx bx-history"></i>
            <span class="link_name">All project's</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="#">All project's</a></li>
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
            <li><a href="<%=request.getContextPath()%>/pages/PersonalTasks.jsp">Personal Tasks</a></li>
          
          </ul>
        </li>
        <li>
           <li>
            <form action="<%= request.getContextPath() %>/listTasks" method="get" id="logoutbtn">
            <button class="logoutbtn" type="submit">
                <i class="bx bx-news"></i>
            </button>
          </form>
           <ul class="sub-menu blank">
          <li><a class="link_name" href="">Dashboard</a></li>
     
          </ul>
            </li>
            
            <li>
          <li>
    <a class="link_name" href="<%= request.getContextPath()%>/listPersonalTasks">
        <button class="logoutbtn" type="button">
            <i class="bx bx-news"></i>
        </button>
    </a>
               <ul class="sub-menu blank">
          <li><a class="link_name" >Personals Dashboard</a></li>
     
          </ul>
    
</li>

        <li>
          <a href="<%= request.getContextPath() %>/calendar">
            <i class="bx bx-refresh"></i>
            <span class="link_name">Recurring Project's</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="<%= request.getContextPath() %>/calendar">Recurring Project's</a></li>
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
          <form action="<%= request.getContextPath() %>/logout" method="get" id="logoutbtn">
          
            <button class="logoutbtn" type="submit">
              <i class="bx bx-log-out"></i>
               </button>
          </form>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="#">LogOut</a></li>
          </ul>
        </li>
        <li>
        
        
        
          
          <div class="profile-details">
            <a class="profile-content" href="<%=request.getContextPath()%>/ProfileServlet">
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

    <section class="home-section">
      <div class="home-content">
        <i class="bx bx-menu"></i>
        <span class="text">Inbox</span>
      </div>

      <div class="search-add-task">
        <button class="addtask" id="addtask" type="button">
          <i class="bx bx-plus"></i>&nbsp;Add project task
        </button>
        
       <form id="search" action="<%= request.getContextPath() %>/searchtask" method="GET">
        <i class="bx bx-search"></i
        >
    <input
        class="form-control mr-sm-2"
        type="search"
        placeholder="Search Todo By Assignee's Gmail"
        id="search"
        aria-label="Search"
        name="assigneeEmail"
    />
    <button type="submit">Search</button>
</form>

      </div>

      <div class="flex-sort">
        <div>
          <h1 class="todohead">All project's</h1>
        </div>
        </div>
        <form action="<%= request.getContextPath() %>/calendar" method="GET">
        <div  class="flex-sort">
        <label>Search Task:</label>   
        <input type="date">
        
        <button>Search</button>
        </div>
</form>
     
<%
	String errorMessage = request.getParameter("errorMessage");
	if (errorMessage != null) {
		out.println("<p>" + errorMessage + "</p>");
	}
	%>
      </div>
      <div id="todo-container"></div>
      <div id="todo-container2"></div>
      <div id="todo-container3"></div>
      <div id="todo-container4"></div>

      <!-- display none when click add new task it becomes display block -->
      <div id="popupOverlay">
        <div id="popupContent">
          <h2 class="newtaskh1">Add New ProjectTask</h2>
          <br />
         <%
	String errorMessag = request.getParameter("errorMessage");
	if (errorMessage != null) {
		out.println("<p>" + errorMessag + "</p>");
	}
	%>
           <form action="<%= request.getContextPath() %>/createTask" method="post" id="taskForm" onsubmit="return validateForm()">
           
     
        <div id="overflow">
            <div class="form-floating mb-3">
               <input type="text" class="form-control" id="taskname" name="taskname" placeholder="Task Name"  minlength="3" required  pattern="^[a-zA-Z0-9]+$" title="Please enter only letters and numbers." />
                <label for="taskname">Task Name</label>
            </div>
            <div class="form-floating">
                <textarea class="form-control" id="taskdetails" name="taskdetails"  minlength="3" placeholder="Leave a comment here" style="height: 100px" required></textarea>
                <label for="taskdetails">Project Details</label>
            </div>
            <br />
            <select class="form-select" aria-label="Default select example" name="taskcategory" required>
                <option disabled selected value="">Project Category</option>
         
                <option value="Professional">Professional</option>
                <option value="Academic">Academic</option>
                <option value="Social">Social</option>
            </select>
            <br />
            <div class="form-floating mb-3">
                <input type="date" class="form-control taskdue" id="taskdue" name="taskdue" min="<%=java.time.LocalDate.now()%>" required />
                <label for="taskdue">Project DueDate</label>
            </div>
            <div class="form-floating mb-3">
               <input type="email" class="form-control" id="taskassignee" name="taskassignee" placeholder="name@example.com" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Please enter a valid email address (e.g., name@example.com)">
<label for="taskassignee">Project Assignee</label>

            </div>
            <select class="form-select" aria-label="Default select example" name="taskstatus" required>
                <option disabled selected value="">Project Status</option>
                <option value="Completed">Completed</option>
                <option value="Currently Working">Currently Working</option>
                <option value="Not Yet Started">Not Yet Started</option>
            </select>
            <br />
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="projectname" name="projectname" placeholder="Project Name" pattern="^[a-zA-Z0-9]+$" title="Please enter only letters and numbers." value="ProjectPerformance" />
                <label for="projectname">Project Name</label>
            </div>
            <select class="form-select" aria-label="Default select example" name="taskpriority" required>
                <option disabled selected value="">Project Priority</option>
                <option value="High" style="background-color: red; color: white">High</option>
                <option value="Medium" style="background-color: orange; color: white">Medium</option>
                <option value="Low" style="background-color: green; color: white">Low</option>
            </select>
            <br />
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="tasktags" minlength="3" name="tasktags" placeholder="Project Tags" required />
                <label for="tasktags">Project Tags</label>
            </div>

            <button type="button" id="closePopup" class="btn btn-danger">Cancel</button>
            <button type="submit" id="openPopup" class="btn btn-success">Submit</button>
        </div>
    </form>
        </div>
      </div>

      <!-- display none when click add new task it becomes display block -->
    </section>
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
      crossorigin="anonymous"
    ></script>
    <script src="https://momentjs.com/downloads/moment.js"></script>
    <script>
 // add task div open
    let addtask = document.getElementById("addtask");
    addtask.addEventListener("click", (event) => {
      event.preventDefault();
      document.getElementById("popupOverlay").style.display = "block";
    });

    // cancel task
    let closetask = document.getElementById("closePopup");
    closetask.addEventListener("click", (event) => {
      event.preventDefault();
      document.getElementById("popupOverlay").style.display = "none";
    });


    
    function validateForm() {
       
        var taskName = document.getElementById("taskname").value;
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
    <script>
        const darkModeToggle = document.getElementById('change');
        let isDarkModeOn = false;

        darkModeToggle.addEventListener('click', () => {
          
            isDarkModeOn = !isDarkModeOn;

            document.body.classList.toggle('dark-mode', isDarkModeOn);
        });
    </script>
     </body>
</html>
