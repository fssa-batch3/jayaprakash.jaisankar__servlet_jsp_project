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
        String task = request.getParameter("task");
        LocalDate date = LocalDate.parse(request.getParameter("date"));
        LocalTime time = LocalTime.parse(request.getParameter("time"));
        boolean reminder = request.getParameter("reminder") != null;
        String taskIdParam = request.getParameter("taskId");
        int taskId = Integer.parseInt(taskIdParam);



        Milestone milestone = new Milestone();
        milestone.setTaskText(task);
        milestone.setTaskDate(date);
        milestone.setTaskTime(time);
        milestone.setRemainder(reminder);
        milestone.setTasks_id(taskId);

        try {
            boolean created = milestoneService.insertMilestone(milestone);
            if (created) {
                response.setStatus(HttpServletResponse.SC_CREATED);
                response.getWriter().write("Task created successfully");
                
                // Redirect to the /listTasks servlet
                response.sendRedirect(request.getContextPath() + "/projectTasksWithMilestones");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Failed to create task");
            }
            
        } catch (ServiceException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Failed to add milestone: " + e.getMessage());
        }
    }
}
