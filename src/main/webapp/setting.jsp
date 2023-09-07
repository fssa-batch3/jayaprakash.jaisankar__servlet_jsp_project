<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Project Management Settings</title>
    <link rel="stylesheet" type="text/css" href="setting.css">
</head>
<body>
    <h1>Project Management Settings</h1>
    <div id="settings-container">
        <div class="setting">
            <label for="theme">Select Theme:</label>
            <select id="theme">
                <option value="light">Light</option>
                <option value="dark">Dark</option>
            </select>
        </div>
        <div class="setting">
            <label for="notifications">Notifications:</label>
            <input type="checkbox" id="notifications">
        </div>
        <!-- Add more settings as needed -->
    </div>
    <script src="settings.js"></script>
</body>
</html>
