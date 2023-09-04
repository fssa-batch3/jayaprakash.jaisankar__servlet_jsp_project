package com.fssa.bookapp.servlet;

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
        milestoneService = new MilestoneService(new MilestoneDAO()); // Replace with your actual implementation
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String task = request.getParameter("task");
        LocalDate date = LocalDate.parse(request.getParameter("date"));
        LocalTime time = LocalTime.parse(request.getParameter("time"));
        boolean reminder = request.getParameter("reminder") != null;

        Milestone milestone = new Milestone();
        milestone.setTaskText(task);
        milestone.setTaskDate(date);
        milestone.setTaskTime(time);
        milestone.setRemainder(reminder);

        try {
            boolean created = milestoneService.insertMilestone(milestone);
            if (created) {
                response.setStatus(HttpServletResponse.SC_CREATED);
                response.getWriter().write("Milestone added successfully");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Failed to add milestone");
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Failed to add milestone: " + e.getMessage());
        }
    }
}
