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
  </head>
  <body>
    <div class="sidebar close">
      <div class="logo-details">
        <i class="bx bx-task"></i>
        <span class="logo_name">ProjectProVision</span>
      </div>
      <ul class="nav-links">
        <li></li>
        <li>
          <a href="pages/mytodo.jsp">
            <i class="bx bx-task"></i>
            <span class="link_name">My project's</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="#">My Project's</a></li>
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
            <li><a href="./pages/PersonalTasks.jsp">Personal Tasks</a></li>
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
            <li><a href="pages/freetemplates.jsp">Free Templates</a></li>
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
          <form action="<%= request.getContextPath() %>/logout" method="get" id="logoutbtn">
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
        
       <form action="<%= request.getContextPath() %>/searchtask" method="GET">
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

        <form action="<%= request.getContextPath() %>/searchsort" method="GET">
    <div>
        <select
            class="form-select"
            aria-label="Default select example"
            id="sort"
            name="sortCriteria" 
            required
        >
            <option disabled selected value="">Sort</option>
            <option id="option1" value="Based On Due date">
                Based On Due date
            </option>
            <option id="option2" value="A-Z (Ascending Order)">
                A-Z (Ascending Order)
            </option>
            <option id="option3" value="Z-A (Descending Order)">
                Z-A (Descending Order)
            </option>
        </select>
    </div>
    &emsp;
    <div>
        <select
            class="form-select"
            aria-label="Default select example"
            id="filter"
            name="filterCriteria" 
            required
        >
            <option disabled selected value="">Filter</option>
            <option value="Based On Category">Based On Category</option>
            <option value="Based On Assignee">Based On Assignee</option>
            <option value="Based On Status">Based On Status</option>
            <option value="Based On Priority">Based On Priority</option>
            <option value="Based On Tags">Based On Tags</option>
        </select>
    </div>

    <div class="searchcategory">
        <i class="bx bx-search" id="searchicon"></i>
        <input
            type="search"
            id="searchbarfilter"
            class="form-control mr-sm-2"
            type="search"
            aria-label="Search"
            name="searchKeyword" 
        />
        <button type="submit">Search</button> 
    </div>
</form>

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

           <form action="<%= request.getContextPath() %>/createTask" method="post" id="taskForm">
        <div id="overflow">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="taskname" name="taskname" placeholder="Task Name" required />
                <label for="taskname">Task Name</label>
            </div>
            <div class="form-floating">
                <textarea class="form-control" id="taskdetails" name="taskdetails" placeholder="Leave a comment here" style="height: 100px" required></textarea>
                <label for="taskdetails">Project Details</label>
            </div>
            <br />
            <select class="form-select" aria-label="Default select example" name="taskcategory" required>
                <option disabled selected value="">Project Category</option>
                <option value="Personal Tasks">Personal Project</option>
                <option value="Work/Professional Tasks">Work/Professional</option>
                <option value="Academic Tasks">Academic</option>
                <option value="Health and Fitness Tasks">Health and Fitness Tasks</option>
                <option value="Social/Event Tasks">Social</option>
            </select>
            <br />
            <div class="form-floating mb-3">
                <input type="date" class="form-control taskdue" id="taskdue" name="taskdue" required />
                <label for="taskdue">Project DueDate</label>
            </div>
            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="taskassignee" name="taskassignee" placeholder="name@example.com" required />
                <label for="taskassignee">Project Assignee</label>
            </div>
            <select class="form-select" aria-label="Default select example" name="taskstatus" required>
                <option disabled selected value="">Project Status</option>
                <option value="Completed">Completed</option>
                <option value="Currently Working">Currently Working</option>
                <option value="Not Completed (Incomplete)">Not Completed (Incomplete)</option>
                <option value="Not Yet Started">Not Yet Started</option>
            </select>
            <br />
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="projectname" name="projectname" placeholder="Project Name" value="ProjectPerformance" />
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
                <input type="text" class="form-control" id="tasktags" name="tasktags" placeholder="Project Tags (Optional)" />
                <label for="tasktags">Project Tags (Optional)</label>
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
    <script src="<%=request.getContextPath()%>/assets/js/index2.js"></script>
  </body>
</html>
