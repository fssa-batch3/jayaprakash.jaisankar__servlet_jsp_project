package com.fssa.projectprovision;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.Date;

import com.fssa.projectprovision.exception.ServiceException;
import com.fssa.projectprovision.model.PersonalTask;
import com.fssa.projectprovision.service.PersonalTaskService;
import com.fssa.projectprovision.dao.PersonalTaskDAO;

@WebServlet("/personal")
public class Personalservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PersonalTaskService taskService;

    public Personalservlet() {
        super();
        taskService = new PersonalTaskService(new PersonalTaskDAO());
    }


protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        String taskName = request.getParameter("taskName");
        boolean remainder = Boolean.parseBoolean(request.getParameter("remainder"));
        String taskDateStr = request.getParameter("taskDate"); 
        String taskTimeStr = request.getParameter("taskTime"); 

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        
        Date taskDate = dateFormat.parse(taskDateStr);
        Date taskTime = timeFormat.parse(taskTimeStr);

       LocalDate localTaskDate = taskDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        LocalTime localTaskTime = taskTime.toInstant().atZone(ZoneId.systemDefault()).toLocalTime();

        HttpSession session = request.getSession();
        long userId = (long) session.getAttribute("userId");

        PersonalTask task = new PersonalTask();
        task.setUserId(userId);
        task.setTaskName(taskName);
        task.setRemainder(remainder);
        task.setTaskDate(localTaskDate);
        task.setTaskTime(localTaskTime);

        boolean taskAdded = taskService.createPersonalTask(task);

        if (taskAdded) {
            response.sendRedirect(request.getContextPath() + "/listPersonalTasks");
        } else {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        request.getRequestDispatcher("/index2.jsp?errorMessage=An error occurred").forward(request, response);
        
    }
}
}