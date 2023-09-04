package com.fssa.projectprovision;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve the list of tasks from the database using the TaskService or TaskDAO
            List<Task> taskList = taskService.getAllTasks(); // Replace with the appropriate method

            // Set the list of tasks as an attribute in the request
            request.setAttribute("taskList", taskList);

            // Forward the request to the JSP page for rendering
            request.getRequestDispatcher("/listTasks.jsp").forward(request, response);
        } catch (ServiceException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Failed to retrieve tasks: " + e.getMessage());
        }
    }
}
