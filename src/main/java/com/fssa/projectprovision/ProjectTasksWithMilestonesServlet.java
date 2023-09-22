package com.fssa.projectprovision;

import java.io.IOException;


import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.projectprovision.model.Milestone;
import com.fssa.projectprovision.service.MilestoneService;
import com.fssa.projectprovision.dao.MilestoneDAO;
import com.fssa.projectprovision.exception.DAOException;
import com.fssa.projectprovision.exception.ServiceException;

@WebServlet("/projectTasksWithMilestones")
public class ProjectTasksWithMilestonesServlet extends HttpServlet {
    private MilestoneService milestoneService; 

    @Override
    public void init() throws ServletException {
        super.init();
        MilestoneDAO milestoneDAO = new MilestoneDAO();
        milestoneService = new MilestoneService(milestoneDAO);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("userId");
        String taskAssignee = (String) session.getAttribute("taskassignee");

        if (userId != null) {
            String taskIdParam = request.getParameter("taskId");
            if (taskIdParam != null) {
                try {
                	int taskId = Integer.parseInt(taskIdParam);
                	System.out.println(taskId);

                    List<Milestone> milestones = milestoneService.getMilestonesByTaskId(taskId);

                    request.setAttribute("milestones", milestones);
                } catch (NumberFormatException e) {
                               } catch (ServiceException e) {
                    e.printStackTrace();
                }
            }

            request.getRequestDispatcher("/pages/projectTasksWithMilestones.jsp").forward(request, response);
        } else {
            response.sendRedirect("pages/login3.jsp");
        }
    }

    private void handleError(String message, HttpServletResponse response) throws IOException {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.getWriter().write(message);
        
    }
}
