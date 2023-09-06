package com.fssa.projectprovision;

import com.fssa.projectprovision.dao.MilestoneDAO;
import com.fssa.projectprovision.exception.DAOException;
import com.fssa.projectprovision.exception.ServiceException;
import com.fssa.projectprovision.model.Milestone;
import com.fssa.projectprovision.service.MilestoneService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/MilestoneListServlet")
public class MilestoneListServlet extends HttpServlet {

    private MilestoneService milestoneService;

    @Override
    public void init() throws ServletException {
        super.init();
        milestoneService = new MilestoneService(new MilestoneDAO());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Milestone> milestoneList=getProjectTasksWithMilestones();
        try {
            milestoneList = milestoneService.getAllMilestones();
        } catch (ServiceException | DAOException e) {
            e.printStackTrace();
        }

        // Debugging: Print the milestoneList to the console to check its contents
        System.out.println("Milestone List:");
        for (Milestone milestone : milestoneList) {
            System.out.println(milestone); // This will print each milestone to the console
        }

        request.setAttribute("milestoneList", milestoneList);

        // Forward the request to the JSP for rendering
        request.getRequestDispatcher("/listMilestones.jsp").forward(request, response);
    }

}
