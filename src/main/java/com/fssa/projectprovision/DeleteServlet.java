package com.fssa.projectprovision;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.fssa.projectprovision.exception.DAOException;
import com.fssa.projectprovision.utils.ConnectionUtil;
import com.fssa.projectprovision.dao.MilestoneDAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/deletemilestone")
public class DeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the ID of the milestone to delete from the request parameter
        String milestoneIdString = request.getParameter("id");

        // Check if the milestoneIdString is not null and is a valid integer
        if (milestoneIdString != null && milestoneIdString.matches("\\d+")) {
            int milestoneId = Integer.parseInt(milestoneIdString);

            // Delete the milestone by its ID using the deleteMilestoneByTodoId method
            boolean deleted = deleteMilestoneByTodoId(milestoneId);

            if (deleted) {
                // Redirect to the page displaying the list of tasks after successful deletion
                response.sendRedirect(request.getContextPath() + "/projectTasksWithMilestones");
            } else {
                // Handle the case where deletion fails, e.g., display an error message
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().println("deleteed the milestone.");
            }
        } else {
            // Handle the case where the ID is not valid, e.g., display an error message
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().println("Invalid milestone ID.");
        }
    }

    // Method to delete a milestone by its ID
    private boolean deleteMilestoneByTodoId(int id) {
        String query = "DELETE FROM milestone WHERE id = ?";
        try (Connection connection = ConnectionUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(query)) {

            pst.setInt(1, id);

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            // Log the exception for debugging purposes
            e.printStackTrace();
            return false;
        }
    }
    
    
}
