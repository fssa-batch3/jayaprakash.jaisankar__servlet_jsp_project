<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fssa.projectprovision.model.Milestone" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Milestones</title>
</head>
<body>
    <h1>List of Milestones</h1>
    <table border="1">
        <tr> 
            <th>Task Text</th>
            <th>Task Date</th>
            <th>Task Time</th>
            <th>Is Reminder</th>
            <th>Task ID</th>
            <th>Actions</th>
        </tr>
        <%
           List<Milestone> milestoneList = (List<Milestone>) request.getAttribute("milestoneList");
           if (milestoneList != null && !milestoneList.isEmpty()) {
               for (Milestone milestone : milestoneList) {
        %>
           <tr>
               <td><%= milestone.getTaskText() %></td>
               <td><%= milestone.getTaskDate() %></td>
               <td><%= milestone.getTaskTime() %></td>             
               <td><%= milestone.getIsRemainder() %></td>

               <td><%= milestone.getTasks_id() %></td>
               
           </tr>
        <%
               }
           } else {
        %>
           <tr>
               <td colspan="6">No milestones available.</td>
           </tr>
        <%
           }
        %>
    </table>
</body>
</html>
