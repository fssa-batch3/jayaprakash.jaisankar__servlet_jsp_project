package com.fssa.projectprovision;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.projectprovision.model.Task;
import com.fssa.projectprovision.service.TaskService;
import com.fssa.projectprovision.dao.TaskDAO;
import com.fssa.projectprovision.exception.ServiceException;

@WebServlet("/listTasks")
public class ListTasksServlet extends HttpServlet {
    private TaskService taskService;

    @Override
    public void init() throws ServletException {
        super.init();
        TaskDAO taskDAO = new TaskDAO();
        taskService = new TaskService(taskDAO);
    }

 // Inside your ListTasksServlet
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get the user ID from the session
            HttpSession session = request.getSession();
            Long userId = (Long) session.getAttribute("userId");
            String taskAssignee = (String) session.getAttribute("taskassignee"); // Retrieve taskassignee

            // Check if the user is logged in (userId is not null)
            if (userId != null) {
                // Now you have the userId, and you can use it to fetch tasks specific to that user.
                // You can also use taskAssignee to filter tasks assigned to that person.
                List<Task> taskList = taskService.getTasksForUser(userId, taskAssignee);
                request.setAttribute("taskList", taskList);
                request.getRequestDispatcher("pages/listTasks.jsp").forward(request, response);
            } else {
                // Redirect to the login page or handle the case when the user is not logged in
                response.sendRedirect("pages/login3.jsp");
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Failed to retrieve tasks: " + e.getMessage());

            response.sendRedirect(request.getContextPath() + "/pages/error.jsp");
        }
    }


}
