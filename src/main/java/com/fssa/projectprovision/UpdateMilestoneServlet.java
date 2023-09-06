package com.fssa.projectprovision;

import com.fssa.projectprovision.dao.MilestoneDAO;
import com.fssa.projectprovision.exception.DAOException;
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

@WebServlet("/updatemilestone")
public class UpdateMilestoneServlet extends HttpServlet {

    private MilestoneService milestoneService;

    @Override
    public void init() {
        // Initialize the MilestoneService with the appropriate MilestoneDAO implementation
        milestoneService = new MilestoneService(new MilestoneDAO());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Get the updated milestone details from the form
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        String taskText = request.getParameter("taskText");
        LocalDate taskDate = LocalDate.parse(request.getParameter("taskDate"));
        LocalTime taskTime = LocalTime.parse(request.getParameter("taskTime"));
        boolean isReminder = Boolean.parseBoolean(request.getParameter("isReminder"));

        Milestone updatedMilestone = new Milestone(taskId, taskId, taskText, taskDate, taskTime, isReminder);

        try {
            boolean updated = milestoneService.updateMilestone(updatedMilestone);

            if (updated) {
                response.sendRedirect("/listmilestones"); // Redirect to the list page after successful update
            } else {
                response.getWriter().write("Failed to update milestone");
            }
        } catch (ServiceException | DAOException e) {
            e.printStackTrace();
            response.getWriter().write("Failed to update milestone: " + e.getMessage());
        }
    }
}
