package com.fssa.projectprovision;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.projectprovision.exception.ServiceException;
import com.fssa.projectprovision.model.PersonalTask;
import com.fssa.projectprovision.service.PersonalTaskService;
import com.fssa.projectprovision.dao.PersonalTaskDAO;


@WebServlet("/viewPersonalTask.jsp")

public class ListPersonalTasksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve user ID from the session
            HttpSession session = request.getSession();
            long userId = (long) session.getAttribute("userId");

            // Retrieve the personal task for the user
            PersonalTaskDAO personalTaskDAO = new PersonalTaskDAO(); // Create an instance of PersonalTaskDAO
            PersonalTaskService taskService = new PersonalTaskService(personalTaskDAO); // Create an instance of PersonalTaskService
 PersonalTask personalTask = taskService.getPersonalTaskById(userId);

            // Set the personal task as an attribute in the request
            request.setAttribute("personalTask", personalTask);

            // Forward the request to a JSP for displaying the task
            request.getRequestDispatcher("/pages/viewPersonalTask.jsp").forward(request, response);
        } catch (ServiceException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pages/error.jsp");
        }
    }
}
