<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.fssa.projectprovision.model.CalendarEntry" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Calendar Entries</title>
</head>
<body>
<% 
   List<CalendarEntry> calendarEntries = (List<CalendarEntry>) request.getAttribute("calendarEntries");
%>
<h1>Calendar Entries</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>URL</th>
        <th>User ID</th>
    </tr>
    <c:forEach var="entry" items="${calendarEntries}">
        <tr>
            <td>${entry.id}</td>
            <td>${entry.url}</td>
            <td>${entry.userId}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
