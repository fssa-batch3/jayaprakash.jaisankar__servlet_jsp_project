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
 * Servlet implementation class SearchTaskServlet
 */@WebServlet("/searchtask")
 public class SearchTaskServlet extends HttpServlet {
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
	            String assigneeEmail = request.getParameter("assigneeEmail"); // Get the search parameter
	            List<Task> taskList;

	            if (assigneeEmail != null && !assigneeEmail.isEmpty()) {
	                // If a search parameter is provided, filter tasks by assignee's Gmail
	                taskList = taskService.getTasksByAssigneeEmail(assigneeEmail);
	            } else {
	                // If no search parameter is provided, get all tasks
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
