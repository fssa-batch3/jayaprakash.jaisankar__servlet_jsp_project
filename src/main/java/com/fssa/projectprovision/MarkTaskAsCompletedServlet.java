package com.fssa.projectprovision;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.projectprovision.model.Task;
import com.fssa.projectprovision.service.TaskService;
import com.fssa.projectprovision.dao.TaskDAO;
import com.fssa.projectprovision.exception.ServiceException;

@WebServlet("/pages/markAsCompleted")
public class MarkTaskAsCompletedServlet extends HttpServlet {
    private TaskService taskService = new TaskService(null);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the taskId from the form submission
        int taskId = Integer.parseInt(request.getParameter("taskId"));

        try {
            // Call the markTaskAsCompleted method from the service
            boolean result = taskService.markTaskAsCompleted(taskId);

            if (result) {
                request.setAttribute("message", "Task Marked as Completed Successfully");
            } else {
                request.setAttribute("message", "Failed to Mark Task as Completed");
            }
        } catch (ServiceException e) {
            // Handle service exceptions
            e.printStackTrace();
            request.setAttribute("message", "Failed to Mark Task as Completed");
        }

        // Forward the request to your JSP for displaying the message
        request.getRequestDispatcher("/your-result-jsp.jsp").forward(request, response);
    }
}
