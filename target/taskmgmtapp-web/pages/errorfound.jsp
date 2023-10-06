<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Loading Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #e4e9f7;
        }

        .loading-overlay {
            background: rgba(0, 0, 0, 0.5);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }

        .loading-content {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        .loading-spinner {
            border: 4px solid rgba(0, 0, 0, 0.3);
            border-top: 4px solid #3498db;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 2s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .loading-text {
            margin-top: 20px;
            font-size: 16px;
        }

        .home-link {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div id="loadingOverlay" class="loading-overlay">
        <div class="loading-content">
            <div class="loading-spinner"></div>
            <p class="loading-text">
               An error occured Please wait or Try again.
            </p>
            <a href="<%= request.getContextPath() %>/index2.jsp" class="home-link">Go to Home Page</a>
        </div>
    </div>

    <jsp:include page="sider.jsp"></jsp:include>
</body>
</html>
