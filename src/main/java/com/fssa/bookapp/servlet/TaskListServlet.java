package com.fssa.bookapp.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.projectprovision.exception.ServiceException;
import com.fssa.projectprovision.model.Task;
import com.fssa.projectprovision.service.TaskService;
import com.fssa.projectprovision.dao.TaskDAO;
/**
 * Servlet implementation class TaskListServlet
 */
@WebServlet("/taskList")
public class TaskListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TaskService taskService;

    @Override
    public void init() throws ServletException {
        super.init();
        TaskDAO taskDAO = new TaskDAO(); // Instantiate your TaskDAO here
        taskService = new TaskService(taskDAO);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Task> tasks = taskService.getAllTasks();
            request.setAttribute("tasks", tasks);
            request.getRequestDispatcher("/TaskList.jsp").forward(request, response);
        } catch (ServiceException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
