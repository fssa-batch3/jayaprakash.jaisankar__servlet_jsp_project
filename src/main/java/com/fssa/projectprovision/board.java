package com.fssa.projectprovision;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.projectprovision.model.Task;
import com.fssa.projectprovision.service.TaskService;
import com.fssa.projectprovision.dao.TaskDAO;
import com.fssa.projectprovision.exception.ServiceException;

@WebServlet("/board")
public class board extends HttpServlet {
    /**
	 * 
	 */
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
            HttpSession session = request.getSession();
            Long userId = (Long) session.getAttribute("userId");
            String taskAssignee = (String) session.getAttribute("taskassignee"); 
            if (userId != null) {
                List<Task> taskList = taskService.getTasksForUser(userId, taskAssignee);
                request.setAttribute("taskList", taskList);
                request.getRequestDispatcher("pages/board.jsp").forward(request, response);
            } else {
                response.sendRedirect("pages/login3.jsp");
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Failed to retrieve tasks: " + e.getMessage());
            request.getRequestDispatcher("/pages/board.jsp?errorMessage="+ e.getMessage()).forward(request, response);
            
        }
    }


}
