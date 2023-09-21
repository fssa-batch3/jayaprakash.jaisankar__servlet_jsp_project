package com.fssa.projectprovision;

import com.fssa.projectprovision.dao.MilestoneDAO;
import com.fssa.projectprovision.exception.ServiceException;
import com.fssa.projectprovision.model.Milestone;
import com.fssa.projectprovision.service.MilestoneService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/AddMilestoneServlet")
public class AddMilestoneServlet extends HttpServlet {

    private MilestoneService milestoneService;

    @Override
    public void init() {
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

        // Retrieve user_id from the session
        HttpSession session = request.getSession();
        long userId = (long) session.getAttribute("userId"); // Assuming user_id is a long

        // Retrieve task assignee from the form
        String taskAssignee = request.getParameter("taskassignee");
        System.out.println("Task Assignee: " + taskAssignee);

        Milestone milestone = new Milestone(taskId, taskText, taskDate, taskTime, isReminder);

        boolean created = milestoneService.insertMilestone(milestone, userId, taskAssignee); // Pass userId and taskAssignee to the service method
        if (created) {
            response.setStatus(HttpServletResponse.SC_CREATED);
            response.getWriter().write("Milestone created successfully");
            response.sendRedirect(request.getContextPath() + "/listTasks");
            
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Failed to create milestone");
            response.sendRedirect(request.getContextPath() + "/pages/error.jsp");
        }
    }
}
