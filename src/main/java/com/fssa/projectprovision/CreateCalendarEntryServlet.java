package com.fssa.projectprovision;

import com.fssa.projectprovision.model.CalendarEntry;
import com.fssa.projectprovision.service.CalendarService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/create-calendar-entry")
public class CreateCalendarEntryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CalendarService calendarService;

    public void init() {
        calendarService = new CalendarService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Long userId = (Long) session.getAttribute("userId");

            String base64Url = request.getParameter("url");

           

            CalendarEntry entry = new CalendarEntry();
            entry.setUrl( base64Url); 
            entry.setUserId(userId); 

            boolean success = calendarService.addCalendarEntry(entry);
            if (success) {
            	response.sendRedirect(request.getContextPath() + "/pages/login3.jsp");
            }
            else {
            	 response.sendRedirect(request.getContextPath() + "/pages/entryset.jsp");
            }
            
        }catch (Exception e) {
        	 e.printStackTrace();
             response.getWriter().write("An error occurred");
             request.getRequestDispatcher("/pages/entry.jsp?errorMessage="+e.getMessage()).forward(request, response);
            }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
