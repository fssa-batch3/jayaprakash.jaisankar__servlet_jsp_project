<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
      <h2>Professional Project/Task Management</h2>

      <div class="search-add-task">
        <button class="addtask" id="addtask" type="button">
          <i class="bx bx-plus"></i>&nbsp;Add your task
        </button>
      </div>

      <form id="person">
        <div class="full">
          <div class="todo">
            <input type="text" id="task" placeholder="Enter a task" />
          </div>
          <div class="todo">
            <input
              type="text"
              id="gmail-input"
              placeholder="Enter Gmail addresses (separated by comma)"
            />
          </div>

          <div class="todo">
            <input type="checkbox" id="remain" /><span>Remainder</span>
          </div>
          <div class="todo">
            <label for="date">Select date:</label>
            <select id="date"></select>
          </div>
          <div class="todo">
            <label for="time">Select time:</label>
            <select id="time"></select>
          </div>
          <div class="todo"><button id="add-task">Add Task</button></div>
        </div>
      </form>

      <div class="show2">
        <div id="task-list"></div>
      </div>
    </div>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const show = document.querySelector(".search-add-task");
        const hide = document.getElementById("person");

        show.addEventListener("click", function () {
          hide.style.display = "block";
        });

        const taskInput = document.getElementById("task");
        const addTaskButton = document.getElementById("add-task");
        const dateSelect = document.getElementById("date");
        const timeSelect = document.getElementById("time");
        const taskList = document.getElementById("task-list");

        let tasks = JSON.parse(localStorage.getItem("tasks")) || [];

        function isValidGmail(email) {
          const gmailRegex = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
          return gmailRegex.test(email);
        }

        function generateTimeOptions() {
          const options = [];
          for (let hour = 0; hour < 24; hour++) {
            for (let minute = 0; minute < 60; minute += 15) {
              const formattedHour = hour.toString().padStart(2, "0");
              const formattedMinute = minute.toString().padStart(2, "0");
              options.push(`${formattedHour}:${formattedMinute}`);
            }
          }
          return options;
        }

        function displayTasks() {
          taskList.innerHTML = "";
          tasks.forEach(function (task, index) {
            const li = document.createElement("div");
            li.innerHTML = `
        <div class="dis">
          <span>${task.text}</span>
          <span>Date: ${task.date}</span>
          <span>Time: ${task.time}</span>
          <span>Remainder: ${task.remainder ? "Yes" : "No"}</span>
          <div class="members">
            <button class="show-members" data-index="${index}">Show Members</button>
            <span class="member-list"></span>
          </div>
          <div class="btn">
            <button class="edit-task" data-index="${index}">Edit</button>
            <button class="delete-task" data-index="${index}">Delete</button>
          </div>
        </div>
      `;
            taskList.appendChild(li);
          });
        }

        // Dynamically populate date dropdown
        const now = new Date();
        for (let i = 0; i < 7; i++) {
          const date = new Date(now);
          date.setDate(now.getDate() + i);
          const formattedDate = date.toLocaleDateString("en-US", {
            year: "numeric",
            month: "long",
            day: "numeric",
          });
          dateSelect.innerHTML += `<option value="${formattedDate}">${formattedDate}</option>`;
        }

        // Dynamically populate time dropdown
        const timeOptions = generateTimeOptions();
        timeOptions.forEach((time) => {
          timeSelect.innerHTML += `<option value="${time}">${time}</option>`;
        });

        addTaskButton.addEventListener("click", function () {
          const taskText = taskInput.value.trim();
          const selectedDate = dateSelect.value;
          const selectedTime = timeSelect.value;
          const remainderCheckbox = document.getElementById("remain");
          const remainderValue = remainderCheckbox.checked;

          const gmailInput = document.getElementById("gmail-input");
          const gmailAddresses = gmailInput.value
            .split(",")
            .map((email) => email.trim());

          // Validate and filter valid Gmail addresses
          const validGmailAddresses = gmailAddresses.filter((email) =>
            isValidGmail(email)
          );

          if (taskText !== "" && validGmailAddresses.length > 0) {
            tasks.push({
              text: taskText,
              date: selectedDate,
              time: selectedTime,
              remainder: remainderValue,
              members: validGmailAddresses,
            });
            localStorage.setItem("tasks", JSON.stringify(tasks));
            taskInput.value = "";
            gmailInput.value = "";
            remainderCheckbox.checked = false;
            displayTasks();
          }
        });

        taskList.addEventListener("click", function (event) {
          const target = event.target;
          if (target.classList.contains("delete-task")) {
            const index = target.getAttribute("data-index");
            tasks.splice(index, 1);
            localStorage.setItem("tasks", JSON.stringify(tasks));
            displayTasks();
          } else if (target.classList.contains("edit-task")) {
            const index = target.getAttribute("data-index");
            const task = tasks[index];

            const editedTaskText = prompt("Edit the task text:", task.text);
            if (editedTaskText !== null) {
              task.text = editedTaskText;
              task.date = prompt("Edit the date:", task.date);
              task.time = prompt("Edit the time:", task.time);
              task.remainder = confirm("Set as remainder?");
              task.members = prompt("Edit the time:", task.members);
              localStorage.setItem("tasks", JSON.stringify(tasks));
              displayTasks();
            }
          } else if (target.classList.contains("show-members")) {
            const index = target.getAttribute("data-index");
            const memberList = target.nextElementSibling;
            const task = tasks[index];
            memberList.textContent = `Members: ${task.members.join(", ")}`;
          }
        });

        displayTasks();
      });
    </script>
  </body>
</html>
