package com.fssa.projectprovision;

import com.fssa.projectprovision.dao.PersonalTaskDAO;
import com.fssa.projectprovision.exception.DAOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deletepersonal")
public class DeletePersonalTaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String taskIdStr = request.getParameter("id");
            int taskId = Integer.parseInt(taskIdStr);
            System.out.println(taskId);
            PersonalTaskDAO personalTaskDAO = new PersonalTaskDAO();
            boolean deleted = personalTaskDAO.deletePersonalTask(taskId);

            if (deleted) {
                response.sendRedirect(request.getContextPath() + "/listPersonalTasks");
            } else {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        } catch (NumberFormatException | DAOException e) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}
