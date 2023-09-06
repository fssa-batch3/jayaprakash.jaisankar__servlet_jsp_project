package com.fssa.projectprovision;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.projectprovision.model.Milestone;
import com.fssa.projectprovision.dao.MilestoneDAO;
import com.fssa.projectprovision.exception.DAOException;

@WebServlet("/viewMilestones")
public class ViewMilestones extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Call the method to retrieve project tasks with milestones from the database
		List<Milestone> projectTasks = MilestoneDAO.getProjectTasksWithMilestones();

		// Set the list of project tasks as an attribute in the request
		request.setAttribute("projectTasks", projectTasks);

		// Forward the request to a JSP page for rendering
		request.getRequestDispatcher("/viewMilestones.jsp").forward(request, response);
    }

    private void handleError(String message, HttpServletResponse response) throws IOException {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.getWriter().write(message);
    }
}
