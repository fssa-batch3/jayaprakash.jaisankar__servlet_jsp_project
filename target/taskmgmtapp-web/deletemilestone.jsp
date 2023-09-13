<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Milestone</title>
</head>
<body>
    <h1>Delete Milestone</h1>
    <form  action="deletemilestone"  method="get">
        <p>Are you sure you want to delete this milestone?</p>
        <input type="hidden" name="id" value="${param.id}" />
        <button type="submit">Delete</button>
        <a href="listmilestones">Cancel</a>
    </form>
</body>
</html>
