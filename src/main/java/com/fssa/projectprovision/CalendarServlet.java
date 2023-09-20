package com.fssa.projectprovision;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calendar")
public class CalendarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        response.setContentType("text/html");

        
        String yearParam = request.getParameter("year");
        String monthParam = request.getParameter("month");

        int year;
        int month;

        if (yearParam != null && !yearParam.isEmpty()) {
            year = Integer.parseInt(yearParam);
        } else {
            year = Calendar.getInstance().get(Calendar.YEAR);
        }

        if (monthParam != null && !monthParam.isEmpty()) {
            month = Integer.parseInt(monthParam);
        } else {
            month = Calendar.getInstance().get(Calendar.MONTH) + 1; 
        }

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.MONTH, month - 1); 
        int daysInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

        calendar.set(Calendar.DAY_OF_MONTH, 1);
        int firstDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);

        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("    <title>Calendar</title>");
        out.println("    <style>");
        out.println("    </style>");
        out.println("</head>");
        out.println("<body>");
        out.println("    <div>");
        out.println("        <h1>Project Calendar</h1>");
        out.println("        <form action=\"calendar\" method=\"get\">");
        out.println("            <label for=\"year\">Year:</label>");
        out.println("            <input type=\"number\" id=\"year\" name=\"year\" value=\"" + year + "\" />");
        out.println("            <label for=\"month\">Month:</label>");
        out.println("            <input type=\"number\" id=\"month\" name=\"month\" value=\"" + month + "\" />");
        out.println("            <input type=\"submit\" value=\"Show Calendar\" />");
        out.println("        </form>");
        out.println("    </div>");

        out.println("    <div>");
        out.println("        <h2>" + new SimpleDateFormat("MMMM yyyy").format(calendar.getTime()) + "</h2>");
        out.println("    </div>");

        out.println("    <div>");
        out.println("        <table>");
        out.println("            <thead>");
        out.println("                <tr>");
        out.println("                    <th>Sun</th>");
        out.println("                    <th>Mon</th>");
        out.println("                    <th>Tue</th>");
        out.println("                    <th>Wed</th>");
        out.println("                    <th>Thu</th>");
        out.println("                    <th>Fri</th>");
        out.println("                    <th>Sat</th>");
        out.println("                </tr>");
        out.println("            </thead>");
        out.println("            <tbody>");
        out.println("                <tr>");

        int currentRow = 1; 

        for (int day = 1; day <= daysInMonth; day++) {
            boolean isCurrentMonth = calendar.get(Calendar.MONTH) == month - 1;
            boolean isCurrentDay = isCurrentMonth && day == Calendar.getInstance().get(Calendar.DAY_OF_MONTH);

            if (isCurrentMonth) {
                String formattedDate = String.format("%04d-%02d-%02d", year, month, day);
                String taskDetailsLink = "<a href=\"taskDetails?date=" + formattedDate + "\">" + day + "</a>";			
                if (isCurrentDay) {
                    out.println("                    <td class=\"current-day\">" + taskDetailsLink + "</td>");
                } else {
                    out.println("                    <td>" + taskDetailsLink + "</td>");
                }
            } else {
                out.println("                    <td class=\"other-month-day\">" + day + "</td>");
            }

            if (calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY && currentRow < 6) {
                out.println("                </tr>");
                out.println("                <tr>");
                currentRow++;
            }

            calendar.add(Calendar.DAY_OF_MONTH, 1);
        }

        out.println("                </tr>");
        out.println("            </tbody>");
        out.println("        </table>");
        out.println("    </div>");
        out.println("</body>");
        out.println("</html>");
    }
}
