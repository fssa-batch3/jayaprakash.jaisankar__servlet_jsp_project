package com.fssa.projectprovision;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.projectprovision.model.Task;
import com.fssa.projectprovision.service.TaskService;
import com.fssa.projectprovision.dao.TaskDAO;
import com.fssa.projectprovision.exception.ServiceException;



/**
 * Servlet implementation class Searchsort
 */
@WebServlet("/searchsort")
public class Searchsort extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TaskService taskService;

    @Override
    public void init() throws ServletException {
        super.init();
        TaskDAO taskDAO = new TaskDAO();
        taskService = new TaskService(taskDAO);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String sortCriteria = request.getParameter("sortCriteria");
            String filterCriteria = request.getParameter("filterCriteria");
            String searchKeyword = request.getParameter("searchKeyword");

            List<Task> taskList;

            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                // Handle searching based on the searchKeyword
                taskList = taskService.getFilteredAndSortedTasks(sortCriteria, filterCriteria, searchKeyword);
            } else {
                // Handle cases without searchKeyword (e.g., no search or only sort/filter)
                taskList = taskService.getAllTasks();
            }

            request.setAttribute("taskList", taskList);
            request.getRequestDispatcher("pages/listTasks.jsp").forward(request, response);
        } catch (ServiceException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Failed to retrieve tasks: " + e.getMessage());

            response.sendRedirect(request.getContextPath() + "/pages/error.jsp");
        }
    }


}
