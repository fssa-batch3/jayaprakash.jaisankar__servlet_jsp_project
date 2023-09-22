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
        String milestoneIdString = request.getParameter("id");
 if (milestoneIdString != null && milestoneIdString.matches("\\d+")) {
            int milestoneId = Integer.parseInt(milestoneIdString);
   boolean deleted = deleteMilestoneByTodoId(milestoneId);

            if (deleted) {
               response.sendRedirect(request.getContextPath() + "/listTasks");
            } else {
                 response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.sendRedirect(request.getContextPath() + "/listTasks?errorMessage=Failed to delete");
                response.getWriter().println("deleteed the milestone.");
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.sendRedirect(request.getContextPath() + "/listTasks?errorMessage=Failed to delete");

            
            response.getWriter().println("Invalid milestone ID.");
        }
    }

    private boolean deleteMilestoneByTodoId(int id) {
        String query = "DELETE FROM milestone WHERE id = ?";
        try (Connection connection = ConnectionUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(query)) {

            pst.setInt(1, id);

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
}
