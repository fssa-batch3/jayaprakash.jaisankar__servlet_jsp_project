package com.fssa.projectprovision;

import java.io.IOException;


import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.projectprovision.model.Task;
import com.fssa.projectprovision.service.TaskService;
import com.fssa.projectprovision.dao.TaskDAO;
import com.fssa.projectprovision.exception.ServiceException;

@WebServlet("/updateTask")
public class UpdateTaskServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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
            
            long taskId = Long.parseLong(request.getParameter("taskId"));
            String taskName = request.getParameter("taskname");
            String taskDetails = request.getParameter("taskdetails");
            String taskCategory = request.getParameter("taskcategory");
            String taskDueStr = request.getParameter("taskdue"); 
            String taskAssignee = request.getParameter("taskassignee");
            String taskStatus = request.getParameter("taskstatus");
            String projectName = request.getParameter("projectname");
            String taskPriority = request.getParameter("taskpriority");
            String taskTags = request.getParameter("tasktags");
            String todoid= request.getParameter("todoid");
            
             
            LocalDate taskDue = LocalDate.parse(taskDueStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));

            Task updatedTask = new Task();
            updatedTask.setId((int) taskId);
            updatedTask.setTaskName(taskName);
            updatedTask.setTaskDetails(taskDetails);
            updatedTask.setTaskCategory(taskCategory);
            updatedTask.setTaskDue(taskDue);
            updatedTask.setTaskAssignee(taskAssignee);
            updatedTask.setTaskStatus(taskStatus);
            updatedTask.setProjectName(projectName);
            updatedTask.setTaskPriority(taskPriority);
            updatedTask.setTaskTags(taskTags);
            updatedTask.setTodoId(todoid);
            String updated = taskService.updateTask(updatedTask);

            if (updated != null) {
                response.sendRedirect("listTasks"); 
            } else {
                response.getWriter().write("Failed to update task.");
                request.getRequestDispatcher("/listTasks?errorMessage=Failed to update task.").forward(request, response);
                
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            request.getRequestDispatcher("/listTasks?errorMessage="+ e.getMessage()).forward(request, response);
            response.getWriter().write("Failed to update task: " + e.getMessage());
        } catch (NumberFormatException | DateTimeParseException e) {
        	 request.getRequestDispatcher("/listTasks?errorMessage="+ e.getMessage()).forward(request, response);
            response.getWriter().write("Invalid input format.");
        }
    }
}
