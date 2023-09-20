package com.fssa.projectprovision;

import com.fssa.projectprovision.dao.MilestoneDAO;
import com.fssa.projectprovision.exception.ServiceException;
import com.fssa.projectprovision.model.Milestone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editmilestone")
public class EditMilestoneServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve task ID from the request parameter
		String taskIdStr = request.getParameter("id");
		if (taskIdStr == null || taskIdStr.isEmpty()) {
		    response.getWriter().write("Task ID parameter is missing.");
		    return;
		}

		// Validate and parse the task ID
		long taskId = -1;
		try {
		    taskId = Long.parseLong(taskIdStr);
		} catch (NumberFormatException e) {
		    response.getWriter().write("Invalid Task ID format.");
		    return;
		}

		// Create an instance of the MilestoneDAO
		MilestoneDAO milestoneDAO = new MilestoneDAO();

		// Retrieve the milestone to be edited
		Milestone milestone = milestoneDAO.getMilestoneById( (int) taskId);

		if (milestone != null) {
		    // Set the milestone as an attribute in the request
		    request.setAttribute("milestone", milestone);

		    // Forward the request to the JSP page for editing
		    request.getRequestDispatcher("/pages/editmilestone.jsp").forward(request, response);
		} else {
		    response.getWriter().write("Milestone not found.");

            response.sendRedirect(request.getContextPath() + "/pages/error.jsp");
		}
    }
}
