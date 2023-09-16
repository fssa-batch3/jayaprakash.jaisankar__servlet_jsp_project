<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Task</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style2.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style2.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
    <script src="https://apis.google.com/js/api.js"></script>
</head>
<body>
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
                <input type="text" class="form-control" id="projectname" name="projectname" placeholder="Project Name" value="For Example : Project Performance" />
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
</body>
</html>
