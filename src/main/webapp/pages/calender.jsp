<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calendar</title>
    <style>
        /* Reset some default styles */
        body, h1, h2, table {
            margin: 0;
            padding: 0;
            border: none;
        }

        /* Set a background color for the body */
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        /* Center the content */
        .content {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        /* Calendar container */
        .calendar {
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            padding: 20px;
        }

        /* Calendar title */
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Month and Year */
        .date {
            font-size: 18px;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Calendar grid */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
            min-width: 40px;
            background-color: #fff;
        }

        /* Header cells */
        table th {
            font-weight: bold;
            background-color: #eee;
        }

        /* Current day */
        .current-day {
            background-color: #337ab7;
            color: #fff;
        }

        /* Days from other months */
        .other-month-day {
            color: #999;
        }

        /* Navigation button */
        .nav-button {
            display: inline-block;
            margin: 10px;
            padding: 5px 10px;
            background-color: #337ab7;
            color: #fff;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div>
        <h1>Project Calendar</h1>
        <form action="calendar.jsp" method="get">
            <label for="year">Year:</label>
            <input type="number" id="year" name="year" value="<%= request.getParameter("year") != null ? request.getParameter("year") : java.time.Year.now().getValue() %>" />
            <label for="month">Month:</label>
            <input type="number" id="month" name="month" value="<%= request.getParameter("month") != null ? request.getParameter("month") : java.time.MonthDay.now().getMonthValue() %>" />
            <input type="submit" value="Show Calendar" />
        </form>
    </div>

    <%
        // Get the year and month from request parameters or use the current date
        String yearParam = request.getParameter("year");
        String monthParam = request.getParameter("month");

        int year;
        int month;

        if (yearParam != null && !yearParam.isEmpty()) {
            year = Integer.parseInt(yearParam);
        } else {
            year = java.time.Year.now().getValue();
        }

        if (monthParam != null && !monthParam.isEmpty()) {
            month = Integer.parseInt(monthParam);
        } else {
            month = java.time.MonthDay.now().getMonthValue();
        }

        // Create a Calendar instance for the specified year and month
        java.util.Calendar calendar = java.util.Calendar.getInstance();
        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.MONTH, month - 1); // Calendar months are zero-based

        // Get the number of days in the specified month
        int daysInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

        // Calculate the day of the week for the first day of the month (1 - Sunday, 2 - Monday, etc.)
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        int firstDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
    %>

    <div>
        <h2><%= new java.text.SimpleDateFormat("MMMM yyyy").format(calendar.getTime()) %></h2>
    </div>

    <div>
        <table>
            <thead>
                <tr>
                    <th>Sun</th>
                    <th>Mon</th>
                    <th>Tue</th>
                    <th>Wed</th>
                    <th>Thu</th>
                    <th>Fri</th>
                    <th>Sat</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                        int currentRow = 1; // Initialize current row counter
                        // Loop to generate the calendar grid cells
                        for (int day = 1; day <= daysInMonth; day++) {
                            // Check if the day is in the current month
                            boolean isCurrentMonth = calendar.get(Calendar.MONTH) == month - 1;
                            boolean isCurrentDay = isCurrentMonth && day == java.time.LocalDate.now().getDayOfMonth();
                    %>
                    <td class="<%= isCurrentDay ? "current-day" : (isCurrentMonth ? "" : "other-month-day") %>"><%= day %></td>
                    <%
                            if (calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY && currentRow < 6) {
                    %>
                </tr>
                <tr>
                    <%
                                currentRow++;
                            }
                            // Move to the next day
                            calendar.add(Calendar.DAY_OF_MONTH, 1);
                        }
                    %>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
