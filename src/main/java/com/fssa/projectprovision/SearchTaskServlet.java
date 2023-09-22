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
	        	  HttpSession session = request.getSession();
	              Long userId = (Long) session.getAttribute("userId");
	              String taskAssignee = (String) session.getAttribute("taskassignee"); 
	            String assigneeEmail = request.getParameter("assigneeEmail"); // Get the search parameter
	            List<Task> taskList;

	            if (assigneeEmail != null && !assigneeEmail.isEmpty()) {
	                  taskList = taskService.getTasksByAssigneeEmail(assigneeEmail);
	            } else {
	               taskList = taskService.getAllTasks();
	            }

	            request.setAttribute("taskList", taskList);
	            request.getRequestDispatcher("pages/search.jsp").forward(request, response);
	        } catch (ServiceException e) {
	            e.printStackTrace();
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            response.getWriter().write("Failed to retrieve tasks: " + e.getMessage());
	            request.getRequestDispatcher("/index2.jsp?errorMessage=An error occurred").forward(request, response);
	            
	        }
	    }
	}
