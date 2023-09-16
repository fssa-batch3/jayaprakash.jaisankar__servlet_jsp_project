package com.fssa.projectprovision;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.projectprovision.dao.MilestoneDAO;
import com.fssa.projectprovision.exception.DAOException;
import com.fssa.projectprovision.model.Milestone;

@WebServlet("/listmilestones")
public class listmilestone extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Create an instance of MilestoneDAO
		MilestoneDAO milestoneDAO = new MilestoneDAO();

		// Call the method to retrieve project tasks with milestones where two IDs are equal
		List<Milestone> projectTasks = milestoneDAO.getMilestonesWithEqualIds();

		// Set the list of project tasks as an attribute in the request
		request.setAttribute("projectTasks", projectTasks);

		// Forward the request to a JSP page for rendering
		request.getRequestDispatcher("/pages/projectTasksWithMilestones.jsp").forward(request, response);
    }

    private void handleError(String message, HttpServletResponse response) throws IOException {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.getWriter().write(message);
    }
}
