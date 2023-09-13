<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ProjectProVision</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
          crossorigin="anonymous">

    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet">
    <script src="https://apis.google.com/js/api.js"></script>
</head>
<body>
	<jsp:include page="sidebar.jsp"></jsp:include>

 <section class="home-section">
      <div class="home-content">
        <i class="bx bx-menu"></i>
        <span class="text">Inbox</span>
      </div>

      <div class="search-add-task">
     
        <button class="addtask" id="addtask" type="button">
          <i class="bx bx-plus"></i>&nbsp;Add project task
        </button>
        <i class="bx bx-search"></i
        ><input
          class="form-control mr-sm-2"
          type="search"
          placeholder="Search Todo By Category"
          id="search"
          aria-label="Search"
        />
      </div>

      <div class="flex-sort">
        <div>
          <h1 class="todohead">All project's</h1>
        </div>

        <div>
          <select
            class="form-select"
            aria-label="Default select example"
            id="sort"
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
            required
          >
            <option disabled selected value="">filter</option>
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
          />
        </div>
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

          <form action="createTask" id="form" method="post">
            <div id="overflow">
              <div class="form-floating mb-3" id="firstinput">
                <input
                  type="text"
                  class="form-control"
                  id="taskname"
                  name="taskname"
                  id="floatingInput"
                  placeholder="name@example.com"
                  required
                />
                <label for="floatingInput">Project Name</label>
              </div>
              <div class="form-floating" id="firstinput">
                <textarea
                  class="form-control"
                  id="taskdetails"
                  placeholder="Leave a comment here"
                  id="floatingTextarea2"
                  style="height: 100px"
                  required
                ></textarea>
                <label for="floatingTextarea2">Project Details</label>
              </div>
              <br />
              <select
                class="form-select"
                aria-label="Default select example"
                id="taskcategory"
                required
              >
                <option disabled selected value="">Project Category</option>
                <option value="Personal Tasks">Personal Project</option>
                <option value="Work/Professional Tasks">
                  Work/Professional
                </option>
                <option value="Academic Tasks">Academic</option>
                <option value="Health and Fitness Tasks">
                  Health and Fitness Tasks
                </option>

                <option value="Social/Event Tasks">Social</option>
              </select>
              <br />
              <div class="form-floating mb-3" id="firstinput">
                <input
                  
                  class="form-control taskdue"
                  id="taskdue"
                  id="floatingInput"
                   name="taskdue"
                  placeholder="name@example.com"
                  required
                />
                <label for="floatingInput">Project DueDate</label>
              </div>
              <div class="form-floating mb-3" id="firstinput">
                <input
                  type="email"
                  class="form-control"
                  id="taskassignee"
                  id="floatingInput"
                  placeholder="name@example.com"
                  required
                />
                <label for="floatingInput">Project Assignee</label>
              </div>
              <select
                class="form-select"
                aria-label="Default select example"
                id="taskstatus"
                required
              >
                <option disabled selected value="">Project Status</option>
                <option value="Completed">Completed</option>
                <option value="Currently Working">Currently Working</option>
                <option value="Not Completed (Incomplete)">
                  Not Completed (Incomplete)
                </option>
                <option value="Not Yet Started">Not Yet Started</option>
              </select>
              <br />
              <div class="form-floating mb-3" id="firstinput">
                <input
                  type="text"
                  class="form-control"
                  id="projectname"
                  id="floatingInput"
                  placeholder="name@example.com"
                  value="For Example : Project Performance"
                />
                <label for="floatingInput">Project Name</label>
              </div>
              <select
                class="form-select"
                aria-label="Default select example"
                id="taskpriority"
                required
              >
                <option disabled selected value="">Project Priority</option>
                <option
                  value="High"
                  style="background-color: red; color: white"
                >
                  High
                </option>
                <option
                  value="Medium"
                  style="background-color: orange; color: white"
                >
                  Medium
                </option>
                <option
                  value="Low"
                  style="background-color: green; color: white"
                >
                  Low
                </option>
              </select>
              <br />
              <div class="form-floating mb-3" id="firstinput">
                <input
                  type="text"
                  class="form-control"
                  id="tasktags"
                  id="floatingInput"
                  placeholder="name@example.com"
                />
                <label for="floatingInput">Project Tags (Optional)</label>
              </div>
              
                 <div class="form-floating mb-3" id="firstinput">
                <input
                  type="text"
                  class="form-control"
                  id="tasktags"
                  name="todoId"
                  id="floatingInput"
                  placeholder="name@example.com"
                />
                <label for="floatingInput">Todo ID:</label>
              </div>
         

              <button type="button" id="closePopup" class="btn btn-danger">
                Cancel
              </button>
              <button type="submit" id="openPopup" class="btn btn-success">
                Submit
              </button>
            </div>
          </form>
        </div>
      </div>


    </section>
<script>
//add task div open
let addtask = document.getElementById("addtask");
addtask.addEventListener("click", (event) => {
  event.preventDefault();

  document.getElementById("popupOverlay").style.display = "block";
});

//cancel task
let closetask = document.getElementById("closePopup");
closetask.addEventListener("click", (event) => {
  event.preventDefault();

  document.getElementById("popupOverlay").style.display = "none";
});
</script>
    

<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://momentjs.com/downloads/moment.js"></script>

</body>
</html>
    