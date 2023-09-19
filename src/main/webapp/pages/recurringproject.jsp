<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Week View Calendar</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style2.css" />
</head>
<body>
    <div class="calendar">
        <div class="header">
            <h1>Week View Calendar</h1>
        </div>
        <div class="week-view">
            <div class="days">
                <div class="day">Sunday</div>
                <div class="day">Monday</div>
                <div class="day">Tuesday</div>
                <div class="day">Wednesday</div>
                <div class="day">Thursday</div>
                <div class="day">Friday</div>
                <div class="day">Saturday</div>
            </div>
            <div class="events">
                <!-- Event slots will be dynamically generated here -->
            </div>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>
