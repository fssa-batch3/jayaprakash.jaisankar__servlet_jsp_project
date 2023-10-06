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
    <style>
    
    /* Initially hide elements with the display-none class */
.display-none {
    display: none;
}

/* Initially show elements with the display-block class */
.display-block {
    display: block;
}
    
    </style>
  </head>
  <body>
  
  
  <form id="form"  action="updateTask" method="post">
          
            <div id="divflex1">
              <div class="form-group  display-none">
              
                 <input type="hidden"  name="taskId" value="${task.id}" required>
                <label for="taskname">Project Name:</label>
                <input name="taskname" type="text" id="taskname" value="${task.taskName}" required  minlength="3"  pattern="^[a-zA-Z0-9]+$" title="Please enter only letters and numbers." />
              </div>
              <br />
              <div class="form-group  display-none">
                <label for="taskdetails">Project Details:</label>
                <textarea name="taskdetails" id="taskdetails">${task.taskDetails}   </textarea>
              </div>
              <br />
              <div class="form-group display-none">
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
              <div class="form-group display-none">
                <label for="taskdue">Project Due Date:</label>
                <input type="date" name="taskdue" value="${task.taskDue}" id="taskdue"  min="<%=java.time.LocalDate.now()%>" value="" required />
              </div>
              <br />
              <div class="form-group display-none">
                <label for="taskassignee">Project Assignee:</label>
                <input type="email" name="taskassignee" value="${task.taskAssignee}" id="taskassignee"   pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Please enter a valid email address (e.g., name@example.com)" readonly />
              </div>
            </div>
            <div id="divflex2">
              <div class="form-group display-block"">
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
              <div class="form-group display-none">
                <label for="projectname">Project Name:</label>
                <input type="text" name="projectname" value="${task.projectName}"  minlength="3" id="projectname" required value="" />
              </div>
              <br />
              <div class="form-group display-none">
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
              <div class="form-group display-none">
                <label for="tasktags">Project Tags:</label>
                <input type="text" name="tasktags" value="${task.taskTags}"  minlength="3" id="tasktags" required value="" />
              </div>
              <br />
              <div class="form-group display-none">
                <label for="todoID">Project ID:</label>
                <input type="text"  name="todoid" value="${task.todoId}" id="todoID" readonly disabled />
              </div>
              <input type="hidden" name="todoid" value="${task.todoId}" />
            </div>
<div>  <button  class="update"type="submit">Update</button></div>
          </form>
             
  
</script>
    <script src="<%=request.getContextPath()%>/assets/js/tododetails.js"></script>
  </body>
</html>
