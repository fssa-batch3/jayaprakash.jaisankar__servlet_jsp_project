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
     	String taskIdStr = request.getParameter("id");
		if (taskIdStr == null || taskIdStr.isEmpty()) {
		    response.getWriter().write("Task ID parameter is missing.");
		    return;
		}

			long taskId = -1;
		try {
		    taskId = Long.parseLong(taskIdStr);
		} catch (NumberFormatException e) {
		    response.getWriter().write("Invalid Task ID format.");
		    response.sendRedirect(request.getContextPath() + "/pages/editmilestone.jsp?errorMessage=Invalid Task ID format.");

		    return;
		}

		MilestoneDAO milestoneDAO = new MilestoneDAO();
		Milestone milestone = milestoneDAO.getMilestoneById( (int) taskId);

		if (milestone != null) {
			    request.setAttribute("milestone", milestone);

			    request.getRequestDispatcher("/pages/editmilestone.jsp").forward(request, response);
		} else {
		    response.getWriter().write("Milestone not found.");
		    response.sendRedirect(request.getContextPath() + "/pages/editmilestone.jsp?errorMessage=Milestone not found.");

		}
    }
}
