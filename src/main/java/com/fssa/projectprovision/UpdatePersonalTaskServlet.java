package com.fssa.projectprovision;

import com.fssa.projectprovision.dao.PersonalTaskDAO;
import com.fssa.projectprovision.exception.DAOException;
import com.fssa.projectprovision.model.PersonalTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.Date;

@WebServlet("/updatepersonal")
public class UpdatePersonalTaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

        	HttpSession session = request.getSession();
            long userId = (long) session.getAttribute("userId");
            String taskIdStr = request.getParameter("taskId");
            String taskName = request.getParameter("taskName");
            boolean isReminder = "on".equals(request.getParameter("isReminder")); 
            String taskDateStr = request.getParameter("taskDate");
            String taskTimeStr = request.getParameter("taskTime");

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            Date taskDate = dateFormat.parse(taskDateStr);
            Date taskTime = timeFormat.parse(taskTimeStr);
            LocalDate localTaskDate = taskDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            LocalTime localTaskTime = taskTime.toInstant().atZone(ZoneId.systemDefault()).toLocalTime();

            
            int taskId = Integer.parseInt(taskIdStr);
System.out.println(taskId);
            
            PersonalTask existingTask = new PersonalTask();
            
            existingTask.setUserId(userId);
            existingTask.setTaskName(taskName);
            existingTask.setRemainder(isReminder);
            existingTask.setTaskDate(localTaskDate);
            existingTask.setTaskTime(localTaskTime);
            existingTask.setTaskId(taskId);

            PersonalTaskDAO personalTaskDAO = new PersonalTaskDAO();
            boolean updated = personalTaskDAO.updatePersonalTask(existingTask);

            
            if (updated) {
                response.sendRedirect(request.getContextPath() + "/listPersonalTasks");
            } else {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        } catch (ParseException | NumberFormatException | DAOException e) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}
