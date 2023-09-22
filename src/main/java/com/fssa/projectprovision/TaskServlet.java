package com.fssa.projectprovision;

import java.io.IOException;


import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.projectprovision.exception.ServiceException;
import com.fssa.projectprovision.model.Task;
import com.fssa.projectprovision.service.TaskService;
import com.fssa.projectprovision.dao.TaskDAO;

@WebServlet("/createTask")
public class TaskServlet extends HttpServlet {
    private TaskService taskService; 

    @Override
    public void init() throws ServletException {
        super.init();
        TaskDAO taskDAO = new TaskDAO(); 
        taskService = new TaskService(taskDAO); 
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String taskName = request.getParameter("taskname");
            String taskDetails = request.getParameter("taskdetails");
            String taskCategory = request.getParameter("taskcategory");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String taskDueStrInput = request.getParameter("taskdue");
            if (taskDueStrInput == null) {
                response.getWriter().write("taskdue parameter is missing.");
                return;
            }
            LocalDate taskDueDate = LocalDate.parse(taskDueStrInput, formatter);

            HttpSession session = request.getSession();
            Long userId = (Long) session.getAttribute("userId");

            String taskAssignee = request.getParameter("taskassignee");
            String taskStatus = request.getParameter("taskstatus");
            String projectName = request.getParameter("projectname");
            String taskPriority = request.getParameter("taskpriority");
            String taskTags = request.getParameter("tasktags");
            String todoId = RandomStringGenerator.generateRandomString(32);

            Task task = new Task();
            task.setTaskName(taskName);
            task.setTaskDetails(taskDetails);
            task.setTaskCategory(taskCategory);
            task.setTaskDue(taskDueDate);
            task.setTaskAssignee(taskAssignee);
            task.setTaskStatus(taskStatus);
            task.setProjectName(projectName);
            task.setTaskPriority(taskPriority);
            task.setTaskTags(taskTags);
            task.setTodoId(todoId);

            task.setCreatorId(userId);


boolean created = taskService.createTask(task, userId);
            if (created) {
                response.setStatus(HttpServletResponse.SC_CREATED);
                response.getWriter().write("Task created successfully");

                response.sendRedirect(request.getContextPath() + "/listTasks");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Failed to create task");

                response.sendRedirect(request.getContextPath() + "/pages/error.jsp");
            }

        } catch (ServiceException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            request.getRequestDispatcher("/index2.jsp?errorMessage="+"Failed to create task: " + e.getMessage()).forward(request, response);
            response.getWriter().write("Failed to create task: " + e.getMessage());
        }
    }

    
}
