package com.fssa.projectprovision;

import com.fssa.projectprovision.exception.ServiceException;

import com.fssa.projectprovision.model.PersonalTask;
import com.fssa.projectprovision.service.PersonalTaskService;
import com.fssa.projectprovision.dao.PersonalTaskDAO;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/listPersonalTasks")
public class ListPersonalTasksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PersonalTaskService personalTaskService;

    public ListPersonalTasksServlet() {
        personalTaskService = new PersonalTaskService(new PersonalTaskDAO());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            long userId = (Long) session.getAttribute("userId");

            List<PersonalTask> tasks = personalTaskService.getPersonalTasksByUserId(userId);
          
            request.setAttribute("tasks", tasks);
            request.getRequestDispatcher("/pages/personallist.jsp").forward(request, response);
            
        } catch (ServiceException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error listing tasks");
        }
    }
}

