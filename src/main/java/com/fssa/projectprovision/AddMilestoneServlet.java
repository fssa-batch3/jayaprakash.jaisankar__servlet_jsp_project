package com.fssa.projectprovision;

import com.fssa.projectprovision.dao.MilestoneDAO;
import com.fssa.projectprovision.exception.ServiceException;
import com.fssa.projectprovision.model.Milestone;
import com.fssa.projectprovision.service.MilestoneService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/AddMilestoneServlet")
public class AddMilestoneServlet extends HttpServlet {

    private MilestoneService milestoneService;

    @Override
    public void init() {
        // Initialize the MilestoneService with the appropriate MilestoneDAO implementation
        milestoneService = new MilestoneService(new MilestoneDAO());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Get task ID from the form parameter
        int taskId = Integer.parseInt(request.getParameter("taskId"));

        // Retrieve other milestone details from the form
        String taskText = request.getParameter("taskText");
        LocalDate taskDate = LocalDate.parse(request.getParameter("taskDate"));
        LocalTime taskTime = LocalTime.parse(request.getParameter("taskTime"));
        boolean isReminder = Boolean.parseBoolean(request.getParameter("isReminder"));

        Milestone milestone = new Milestone(taskId, taskText, taskDate, taskTime, isReminder);

        try {
            boolean created = milestoneService.insertMilestone(milestone);
            if (created) {
                response.setStatus(HttpServletResponse.SC_CREATED);
                response.getWriter().write("Milestone created successfully");
                response.sendRedirect(request.getContextPath() + "/projectTasksWithMilestones");
                
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Failed to create milestone");
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Failed to add milestone: " + e.getMessage());
        }
    }
}
