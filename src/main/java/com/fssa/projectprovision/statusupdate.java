
package com.fssa.projectprovision;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.projectprovision.model.Task;
import com.fssa.projectprovision.service.TaskService;
import com.fssa.projectprovision.dao.TaskDAO;
import com.fssa.projectprovision.exception.ServiceException;

@WebServlet("/tasklist2")
public class statusupdate extends HttpServlet {
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
            String taskIdStr = request.getParameter("id");
            if (taskIdStr == null || taskIdStr.isEmpty()) {
                response.getWriter().write("Task ID parameter is missing.");
                return;
            }
            
            long taskId = -1;
            try {
                taskId = Long.parseLong(taskIdStr);
            } catch (NumberFormatException e) {
                response.getWriter().write("Invalid Task ID format.");
                return;
            }
            
            Task task = taskService.getTaskById((int) taskId);

            if (task != null) {
                request.setAttribute("task", task);

                request.getRequestDispatcher("/pages/tasklist2.jsp").forward(request, response);
            } else {
                response.getWriter().write("Task not found.");
                request.getRequestDispatcher("/pages/tasklist2.jsp?errorMessage="+"Failed to retrieve task: Task not found.").forward(request, response);
                
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Failed to retrieve task: " + e.getMessage());
            request.getRequestDispatcher("/pages/tasklist2.jsp?errorMessage=" + e.getMessage()).forward(request, response);
           
        }
    }
}
