package com.fssa.projectprovision;


import java.io.IOException;

import java.sql.PreparedStatement;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.projectprovision.dao.TaskDAO;
import com.fssa.projectprovision.exception.DAOException;
import com.fssa.projectprovision.utils.ConnectionUtil;

@WebServlet("/deleteTask")
public class DeleteTaskServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String taskIdStr = request.getParameter("id");
        if (taskIdStr == null || taskIdStr.isEmpty()) {
            response.getWriter().write("Task ID parameter is missing.");
            return;
        }
        
        int taskId = -1;
        try {
            taskId = Integer.parseInt(taskIdStr);
        } catch (NumberFormatException e) {
            response.getWriter().write("Invalid Task ID format.");
            return;
        }
        
        if (taskId != -1) {
            try {
                boolean deleted = deleteTask(taskId);
                if (deleted) {
                    response.sendRedirect(request.getContextPath()+"/listTasks");
                } else {
                    response.getWriter().write("Failed to delete task.");
                }
            } catch (DAOException e) {
                response.getWriter().write("Error while deleting task.");

                response.sendRedirect(request.getContextPath() + "/pages/listTasks.jsp?errorMessage=" + e.getMessage());

                System.out.println(e)
;            }
        } else {
            response.getWriter().write("Task ID parameter is missing.");

            response.sendRedirect(request.getContextPath() + "/listTasks?errorMessage=Task ID parameter is missing.");

        }
    }
    
    private boolean deleteTask(int taskId) throws DAOException {
        String query = "DELETE FROM tasks WHERE id = ?";
        try (Connection connection = ConnectionUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(query)) {

            pst.setInt(1, taskId);

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            throw new DAOException(e);
        }
    }
}
