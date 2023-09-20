package com.fssa.projectprovision;

import java.io.IOException;


import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.projectprovision.model.Milestone;
import com.fssa.projectprovision.service.MilestoneService;
import com.fssa.projectprovision.dao.MilestoneDAO;
import com.fssa.projectprovision.exception.DAOException;
import com.fssa.projectprovision.exception.ServiceException;

@WebServlet("/projectTasksWithMilestones")
public class ProjectTasksWithMilestonesServlet extends HttpServlet {
    private MilestoneService milestoneService; // Create an instance variable

    @Override
    public void init() throws ServletException {
        super.init();
        MilestoneDAO milestoneDAO = new MilestoneDAO();
        milestoneService = new MilestoneService(milestoneDAO);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the user ID from the session
        HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("userId");
        System.out.println(userId);
        String taskAssignee = (String) session.getAttribute("taskassignee"); // Retrieve taskassignee
        System.out.println(taskAssignee);
       
        if (userId != null) {
                List<Milestone> projectTasks = null;
			try {
				projectTasks = milestoneService.getProjectTasksWithMilestones(userId, taskAssignee);
			} catch (ServiceException e) {
				e.printStackTrace();
			}

            request.setAttribute("projectTasks", projectTasks);

            request.getRequestDispatcher("/pages/projectTasksWithMilestones.jsp").forward(request, response);
        } else {
            // Redirect to the login page or handle the case when the user is not logged in
            response.sendRedirect("pages/login3.jsp");
        }
    }

    private void handleError(String message, HttpServletResponse response) throws IOException {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.getWriter().write(message);
    }
}
