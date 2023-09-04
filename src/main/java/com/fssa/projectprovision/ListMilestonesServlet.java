package com.fssa.projectprovision;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.projectprovision.model.Milestone;
import com.fssa.projectprovision.service.MilestoneService;
import com.fssa.projectprovision.dao.MilestoneDAO;
import com.fssa.projectprovision.exception.DAOException;
import com.fssa.projectprovision.exception.ServiceException;

@WebServlet("/listMilestones")
public class ListMilestonesServlet extends HttpServlet {
    private MilestoneService milestoneService;

    @Override
    public void init() throws ServletException {
        super.init();
        MilestoneDAO milestoneDAO = new MilestoneDAO();
        milestoneService = new MilestoneService(milestoneDAO);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve the list of milestones from the database using the MilestoneService or MilestoneDAO
            List<Milestone> milestoneList = milestoneService.getAllMilestones();

            // Set the list of milestones as an attribute in the request
            request.setAttribute("milestoneList", milestoneList);

            // Forward the request to the JSP page for rendering
            request.getRequestDispatcher("/listMilestones.jsp").forward(request, response);
        } catch (ServiceException e) {
            handleError("Failed to retrieve milestones: " + e.getMessage(), response);
        } catch (DAOException e) {
            handleError("Database error: " + e.getMessage(), response);
        }
    }

    private void handleError(String message, HttpServletResponse response) throws IOException {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.getWriter().write(message);
    }
}
