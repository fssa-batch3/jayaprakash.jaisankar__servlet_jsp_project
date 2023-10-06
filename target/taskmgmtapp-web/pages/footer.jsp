<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/index.css">
</head>
<body>
<footer class="sticky-footer">
  <p>
    © <%= java.time.LocalDate.now().getYear() %> <span><i class="bx bx-task"></i> Projectprovision</span>. All rights reserved.
  </p>
</footer>
</body>
</html>
