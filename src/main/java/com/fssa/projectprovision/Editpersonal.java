package com.fssa.projectprovision;

import com.fssa.projectprovision.dao.PersonalTaskDAO;
import com.fssa.projectprovision.exception.DAOException;
import com.fssa.projectprovision.model.PersonalTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editpersonal")
public class Editpersonal extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taskIdStr = request.getParameter("id");
        if (taskIdStr == null || taskIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/pages/Editpersonal.jsp?errorMessage=Task ID parameter is missing.");
            return;
        }

        long taskId = -1;
        try {
            taskId = Long.parseLong(taskIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/pages/Editpersonal.jsp?errorMessage=Invalid Task ID format.");
            return;
        }

        PersonalTaskDAO personalTaskDAO = new PersonalTaskDAO();
        try {
            PersonalTask task = personalTaskDAO.getPersonalTaskById1(taskId);
            if (task != null) {
                request.setAttribute("task", task);
                request.getRequestDispatcher("/pages/Editpersonal.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/pages/Editpersonal.jsp?errorMessage=Task not found.");
            }
        } catch (DAOException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pages/error.jsp?errorMessage=Error occurred while accessing the database.");
        }
    }
}
