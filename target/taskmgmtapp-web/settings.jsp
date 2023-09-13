<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Settings</title>
    <link rel="stylesheet" type="text/css" href="setting.css">
</head>
<body>
    <h1>Settings</h1>
    
    <div class="settings-container">
        <h2>General Settings</h2>
        <form id="general-settings-form">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username"><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email"><br>

            <button type="submit">Save</button>
        </form>
    </div>

    <div class="settings-container">
        <h2>Feedback</h2>
        <form id="feedback-form">
            <label for="feedback">Your Feedback:</label>
            <textarea id="feedback" name="feedback"></textarea><br>

            <button type="submit">Submit Feedback</button>
        </form>
    </div>

    <script src="script.js"></script>
</body>
</html>
