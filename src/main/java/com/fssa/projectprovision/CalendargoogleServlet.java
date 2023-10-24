package com.fssa.projectprovision;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.projectprovision.model.CalendarEntry;
import com.fssa.projectprovision.service.CalendarService;

@WebServlet("/calendargoogle")
public class CalendargoogleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("userId");
        CalendarService calendarService = new CalendarService();

        List<CalendarEntry> calendarEntries = calendarService.getCalendarEntriesByUserId(userId);

     
        if (!calendarEntries.isEmpty()) {
            CalendarEntry entry = calendarEntries.get(0);
            String url = entry.getUrl();
            if (url != null) {
                String redirectURL = "https://calendar.google.com/calendar/u/0/embed?src=" + url;
                response.sendRedirect(redirectURL);
                return; // Stop further processing
            }
        }

        // If no valid URL is found, you can handle it as needed
        response.sendRedirect(request.getContextPath() + "/index2.jsp");
        
    }
}
