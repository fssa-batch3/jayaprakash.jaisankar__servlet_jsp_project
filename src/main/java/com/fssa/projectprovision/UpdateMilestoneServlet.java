//package com.fssa.projectprovision;
//
//import com.fssa.projectprovision.dao.MilestoneDAO;
//import com.fssa.projectprovision.exception.DAOException;
//import com.fssa.projectprovision.exception.ServiceException;
//import com.fssa.projectprovision.model.Milestone;
//import com.fssa.projectprovision.service.MilestoneService;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.time.LocalDate;
//import java.time.LocalTime;
//import java.time.format.DateTimeParseException;
//
//@WebServlet("/updatemilestone") // Make sure the URL mapping is correct
//public class UpdateMilestoneServlet extends HttpServlet {
//    private MilestoneService milestoneService;
//
//    @Override
//    public void init() throws ServletException {
//        super.init();
//        MilestoneDAO milestoneDAO = new MilestoneDAO();
//        milestoneService = new MilestoneService(milestoneDAO);
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            // Retrieve milestone data from the form
//            int milestoneId = Integer.parseInt(request.getParameter("taskId"));
//            String taskText = request.getParameter("taskText");
//            LocalDate taskDate = LocalDate.parse(request.getParameter("taskDate"));
//            LocalTime taskTime = LocalTime.parse(request.getParameter("taskTime"));
//            boolean isReminder = "on".equals(request.getParameter("isReminder")); // Assuming checkbox sends "on" when checked
//
//            // Create a Milestone object with the updated data
//            Milestone updatedMilestone = new Milestone();
//            updatedMilestone.setId(milestoneId);
//            updatedMilestone.setTaskText(taskText);
//            updatedMilestone.setTaskDate(taskDate);
//            updatedMilestone.setTaskTime(taskTime);
//            updatedMilestone.setIsRemainder(isReminder);
//
//            // Use MilestoneService to update the milestone in the database
//            boolean updated = false;
//			try {
//				updated = milestoneService.updateMilestone(updatedMilestone);
//			} catch (DAOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//
//            if (updated) {
//                response.sendRedirect("listProjectTasksWithMilestones"); // Redirect to the milestone list page
//            } else {
//                response.getWriter().write("Failed to update milestone.");
//            }
//        } catch (ServiceException e) {
//            e.printStackTrace();
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//            response.getWriter().write("Failed to update milestone: " + e.getMessage());
//        } catch (NumberFormatException | DateTimeParseException e) {
//            response.getWriter().write("Invalid input format.");
//        }
//    }
//}
