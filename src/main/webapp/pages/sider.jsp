<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <%@ page import="com.fssa.projectprovision.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style2.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
      crossorigin="anonymous"
    />

    <link
      href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
      rel="stylesheet"
    />
    <!-- End -->
    <script src="https://apis.google.com/js/api.js"></script>
</head>
<body>
<div class="sidebar close">
      <div class="logo-details">
      
<a href="<%=request.getContextPath()%>/index2.jsp">
        <i class="bx bx-task"></i></a>
        <span class="logo_name">ProjectProVision</span>
        
      
      </div>
      <ul class="nav-links">
        <li></li>
        <li>
          <a href="<%=request.getContextPath()%>/pages/mytodo.jsp">
            <i class="bx bx-task"></i>
            <span class="link_name">My project's</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="<%=request.getContextPath()%>/pages/mytodo.jsp"">My Project's</a></li>
          </ul>
        </li>
        <li></li>
        <li class="active">
          <a href="#">
            <i class="bx bx-history"></i>
            <span class="link_name">All project's</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="#">All project's</a></li>
          </ul>
        </li>
        <li>
          <div class="icon-link">
            <a href="#">
              <i class="bx bx-news"></i>
              <span class="link_name">Category</span>
            </a>
            <i class="bx bxs-chevron-down arrow"></i>
          </div>
          <ul class="sub-menu">
            <li><a class="link_name" href="#">Category</a></li>
            <li><a href="<%=request.getContextPath()%>/pages/PersonalTasks.jsp">Personal Tasks</a></li>
            <li><a href="#">Professional Tasks</a></li>
            <li><a href="#">Academic Tasks</a></li>
          </ul>
        </li>
        <li>
           <li>
            <form action="<%= request.getContextPath() %>/listTasks" method="get" id="logoutbtn">
            <button class="logoutbtn" type="submit">
                <i class="bx bx-news"></i>
            </button>
          </form>
           <ul class="sub-menu blank">
          <li><a class="link_name" href="">Dashboard</a></li>
     
          </ul>
            </li>
            
            <li>
          <li>
    <a class="link_name" href="<%= request.getContextPath()%>/listPersonalTasks">
        <button class="logoutbtn" type="button">
            <i class="bx bx-news"></i>
        </button>
    </a>
               <ul class="sub-menu blank">
          <li><a class="link_name" >Personals Dashboard</a></li>
     
          </ul>
    
</li>

        <li>
          <a href="<%= request.getContextPath() %>/calendar">
            <i class="bx bx-refresh"></i>
            <span class="link_name">Recurring Project's</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="<%= request.getContextPath() %>/calendar">Recurring Project's</a></li>
          </ul>
        </li>
        <li>
          <a href="#">
            <i class="bx bx-cog"></i>
            <span class="link_name">Settings</span>
          </a>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="#">Settings</a></li>
          </ul>
        </li>
       
        <li>
          <form action="<%= request.getContextPath() %>/logout" method="get" id="logoutbtn">
          
            <button class="logoutbtn" type="submit">
              <i class="bx bx-log-out"></i>
               </button>
          </form>
          <ul class="sub-menu blank">
            <li><a class="link_name" href="#">LogOut</a></li>
          </ul>
        </li>
        <li>
        
        
        
          
          <div class="profile-details">
            <a class="profile-content" href="<%=request.getContextPath()%>/ProfileServlet">
              <img id="profile_pic" src="" alt="profileImg" />
            </a>
            <div class="name-job">
              <div class="profile_name" id="profile_name"></div>
              <div class="job">Project User</div>
            </div>
            <i class="bx bx-log-out"></i>
          </div>
        </li>
      </ul>
    </div>
</body>
</html>