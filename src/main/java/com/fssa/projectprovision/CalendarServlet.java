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
        // Set the response content type to HTML
        response.setContentType("text/html");
        
        // Get the year and month from request parameters or use the current date
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
            month = Calendar.getInstance().get(Calendar.MONTH) + 1; // Calendar months are zero-based
        }

        // Create a Calendar instance for the specified year and month
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.MONTH, month - 1); // Calendar months are zero-based

        // Get the number of days in the specified month
        int daysInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

        // Calculate the day of the week for the first day of the month (1 - Sunday, 2 - Monday, etc.)
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        int firstDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);

        // Prepare the response writer
        PrintWriter out = response.getWriter();

        // Generate the HTML content
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("    <title>Calendar</title>");
        out.println("    <style>");
        out.println("           /* Reset some default styles */\r\n"
        		+ "        body, h1, h2, table {\r\n"
        		+ "            margin: 0;\r\n"
        		+ "            padding: 0;\r\n"
        		+ "            border: none;\r\n"
        		+ "        }\r\n"
        		+ "\r\n"
        		+ "        /* Set a background color for the body */\r\n"
        		+ "        body {\r\n"
        		+ "            background-color: #f5f5f5;\r\n"
        		+ "            font-family: Arial, sans-serif;\r\n"
        		+ "        }\r\n"
        		+ "\r\n"
        		+ "        /* Center the content */\r\n"
        		+ "        .content {\r\n"
        		+ "            width: 80%;\r\n"
        		+ "            margin: 0 auto;\r\n"
        		+ "            padding: 20px;\r\n"
        		+ "        }\r\n"
        		+ "\r\n"
        		+ "        /* Calendar container */\r\n"
        		+ "        .calendar {\r\n"
        		+ "            background-color: #fff;\r\n"
        		+ "            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\r\n"
        		+ "            border-radius: 5px;\r\n"
        		+ "            padding: 20px;\r\n"
        		+ "        }\r\n"
        		+ "\r\n"
        		+ "        /* Calendar title */\r\n"
        		+ "        h1 {\r\n"
        		+ "            font-size: 24px;\r\n"
        		+ "            margin-bottom: 20px;\r\n"
        		+ "            text-align: center;\r\n"
        		+ "        }\r\n"
        		+ "\r\n"
        		+ "        /* Month and Year */\r\n"
        		+ "        .date {\r\n"
        		+ "            font-size: 18px;\r\n"
        		+ "            margin-bottom: 20px;\r\n"
        		+ "            text-align: center;\r\n"
        		+ "        }\r\n"
        		+ "\r\n"
        		+ "        /* Calendar grid */\r\n"
        		+ "        table {\r\n"
        		+ "            width: 100%;\r\n"
        		+ "            border-collapse: collapse;\r\n"
        		+ "        }\r\n"
        		+ "\r\n"
        		+ "        table th, table td {\r\n"
        		+ "            border: 1px solid #ccc;\r\n"
        		+ "            padding: 10px;\r\n"
        		+ "            text-align: center;\r\n"
        		+ "            min-width: 40px;\r\n"
        		+ "            background-color: #fff;\r\n"
        		+ "        }\r\n"
        		+ "\r\n"
        		+ "        /* Header cells */\r\n"
        		+ "        table th {\r\n"
        		+ "            font-weight: bold;\r\n"
        		+ "            background-color: #eee;\r\n"
        		+ "        }\r\n"
        		+ "\r\n"
        		+ "        /* Current day */\r\n"
        		+ "        .current-day {\r\n"
        		+ "            background-color: #337ab7;\r\n"
        		+ "            color: #fff;\r\n"
        		+ "        }\r\n"
        		+ "\r\n"
        		+ "        /* Days from other months */\r\n"
        		+ "        .other-month-day {\r\n"
        		+ "            color: #999;\r\n"
        		+ "        }\r\n"
        		+ "\r\n"
        		+ "        /* Navigation button */\r\n"
        		+ "        .nav-button {\r\n"
        		+ "            display: inline-block;\r\n"
        		+ "            margin: 10px;\r\n"
        		+ "            padding: 5px 10px;\r\n"
        		+ "            background-color: #337ab7;\r\n"
        		+ "            color: #fff;\r\n"
        		+ "            border: none;\r\n"
        		+ "            cursor: pointer;\r\n"
        		+ "        }");
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

        int currentRow = 1; // Initialize current row counter

        // Loop to generate the calendar grid cells
        for (int day = 1; day <= daysInMonth; day++) {
            // Check if the day is in the current month
            boolean isCurrentMonth = calendar.get(Calendar.MONTH) == month - 1;
            boolean isCurrentDay = isCurrentMonth && day == Calendar.getInstance().get(Calendar.DAY_OF_MONTH);

            if (isCurrentDay) {
                out.println("                    <td class=\"current-day\">" + day + "</td>");
            } else if (isCurrentMonth) {
                out.println("                    <td>" + day + "</td>");
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
