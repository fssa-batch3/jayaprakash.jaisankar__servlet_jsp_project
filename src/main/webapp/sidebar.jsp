<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="../assets/css/style.css">
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
    <style>
    @charset "ISO-8859-1";
@import url('https://fonts.googleapis.com/css2?family=Chakra+Petch:wght@300&family=Tinos&display=swap');
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Tinos', serif;
}
.sidebar {
  position: fixed;
  top: 0;
  left: 0;
  height: 100%;
  width: 260px;
  background: #000428; 
  background: -webkit-linear-gradient(to right, #004e92, #000428); 
  background: linear-gradient(to right, #004e92, #000428);
  z-index: 100;
  transition: all 0.5s ease;
}
.sidebar.close {
  width: 78px;
}
.sidebar .logo-details {
  height: 60px;
  width: 100%;
  display: flex;
  align-items: center;
}
.sidebar .logo-details i {
  font-size: 30px;
  color: #fff;
  height: 50px;
  min-width: 78px;
  text-align: center;
  line-height: 50px;
}
.sidebar .logo-details .logo_name {
  font-size: 22px;
  color: #fff;
  font-weight: 600;
  transition: 0.3s ease;
  transition-delay: 0.1s;
}
.sidebar.close .logo-details .logo_name {
  transition-delay: 0s;
  opacity: 0;
  pointer-events: none;
}
.sidebar .nav-links {
  height: 100%;
  padding: 0 0 150px 0;
  overflow: auto;
}
.sidebar.close .nav-links {
  overflow: visible;
}
.sidebar .nav-links::-webkit-scrollbar {
  display: none;
}
.sidebar .nav-links li {
  position: relative;
  list-style: none;
  transition: all 0.4s ease;
}
.sidebar .nav-links li:hover {
  background: #1d1b31;
}
.sidebar .nav-links li .icon-link {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.sidebar.close .nav-links li .icon-link {
  display: block;
}
.sidebar .nav-links li i {
  height: 50px;
  min-width: 78px;
  text-align: center;
  line-height: 50px;
  color: #fff;
  font-size: 20px;
  cursor: pointer;
  transition: all 0.3s ease;
}
.sidebar .nav-links li.showMenu i.arrow {
  transform: rotate(-180deg);
}
.sidebar.close .nav-links i.arrow {
  display: none;
}
.sidebar .nav-links li a {
  display: flex;
  align-items: center;
  text-decoration: none;
}
.sidebar .nav-links li a .link_name {
  font-size: 18px;
  font-weight: 400;
  color: #fff;
  transition: all 0.4s ease;
}
.sidebar.close .nav-links li a .link_name {
  opacity: 0;
  pointer-events: none;
}
.sidebar .nav-links li .sub-menu {
  padding: 6px 6px 14px 80px;
  margin-top: -10px;
  background: #1d1b31;
  display: none;
}
.sidebar .nav-links li.showMenu .sub-menu {
  display: block;
}
.sidebar .nav-links li .sub-menu a {
  color: #fff;
  font-size: 15px;
  padding: 5px 0;
  white-space: nowrap;
  opacity: 0.6;
  transition: all 0.3s ease;
}
.sidebar .nav-links li .sub-menu a:hover {
  opacity: 1;
}
.sidebar.close .nav-links li .sub-menu {
  position: absolute;
  left: 100%;
  top: -10px;
  margin-top: 0;
  padding: 10px 20px;
  border-radius: 0 6px 6px 0;
  opacity: 0;
  display: block;
  pointer-events: none;
  transition: 0s;
}
.sidebar.close .nav-links li:hover .sub-menu {
  top: 0;
  opacity: 1;
  pointer-events: auto;
  transition: all 0.4s ease;
}
.sidebar .nav-links li .sub-menu .link_name {
  display: none;
}
.sidebar.close .nav-links li .sub-menu .link_name {
  font-size: 18px;
  opacity: 1;
  display: block;
}
.sidebar .nav-links li .sub-menu.blank {
  opacity: 1;
  pointer-events: auto;
  padding: 3px 20px 6px 16px;
  opacity: 0;
  pointer-events: none;
}
.sidebar .nav-links li:hover .sub-menu.blank {
  top: 50%;
  transform: translateY(-50%);
}
.sidebar .profile-details {
  position: fixed;
  bottom: 0;
  width: 260px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  background: #1d1b31;
  padding: 12px 0;
  transition: all 0.5s ease;
}
.sidebar.close .profile-details {
  background: none;
}
.sidebar.close .profile-details {
  width: 78px;
}
.sidebar .profile-details .profile-content {
  display: flex;
  align-items: center;
}
.sidebar .profile-details img {
  height: 52px;
  width: 52px;
  object-fit: cover;
  border-radius: 16px;
  margin: 0 14px 0 12px;
  background: #1d1b31;
  transition: all 0.5s ease;
}
.sidebar.close .profile-details img {
  padding: 10px;
}
.sidebar .profile-details .profile_name,
.sidebar .profile-details .job {
  color: #fff;
  font-size: 18px;
  font-weight: 500;
  white-space: nowrap;
}
.sidebar.close .profile-details i,
.sidebar.close .profile-details .profile_name,
.sidebar.close .profile-details .job {
  display: none;
}
.sidebar .profile-details .job {
  font-size: 12px;
}
.home-section {
  position: relative;
  background: #e4e9f7;
  height: 100vh;
  left: 260px;
  width: calc(100% - 260px);
  transition: all 0.5s ease;
}
.sidebar.close ~ .home-section {
  left: 78px;
  width: calc(100% - 78px);
}
.home-section .home-content {
  height: 60px;
  display: flex;
  align-items: center;
}
.home-section .home-content .bx-menu,
.home-section .home-content .text {
  color: #11101d;
  font-size: 35px;
}
.home-section .home-content .bx-menu {
  margin: 0 15px;
  cursor: pointer;
}
.home-section .home-content .text {
  font-size: 26px;
  font-weight: 600;
}
@media (max-width: 420px) {
  .sidebar.close .nav-links li .sub-menu {
    display: none;
  }
}
.addtask {
    padding: 5px;
    width: 400px;
    margin-left: 20px;
    height: 50px;
    border-radius: 5px;
    border: none;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
    font-family: sans-serif;
    font-size: 16px;
    font-weight: 600;
}
.active {
  background-color: #004e92;
  color: white;
  width: 100%;
  height: 50px;
}
#search {
  width: 500px;
  transition: all 1s;
  border-top-left-radius: 0px;
  border-bottom-left-radius: 0px;
}
.searchcategory {
  display: flex;
}
#searchicon {
  background-color: lightgray;
  color: white;
  display: none;
  width: 35px;
  height: 35px;
  font-size: 20px;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  margin-left: 50px;
  margin-top: 22px;
}
#search:focus {
  width: 800px;
}
.bx-search {
  padding: 10px;
  background-color: lightgray;
  color: white;
  width: 50px;
  font-size: 30px;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  margin-left: 20px;
}
.search-add-task {
  display: flex;
}
/* .addtaskpopup {
    position: absolute;
    width: 600px;
    height: 600px;
    background-color: whitesmoke;
    margin-left: 300px;
    margin-top: 10px; 
} */
.logout {
  background-color: #1D1B31;
  outline: none;
  border: none;
}
.logoutbtn {
  background-color: transparent;
  color: white;
  outline: none;
  border: none;
}

#popupOverlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
  }
  #popupContent {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #e4e9f7;
    padding: 40px;
    width: 500px;
    height : 600px;
    border-radius: 10px;
    /* text-align: center; */
  }
  #popupContent::-webkit-scrollbar {
    display: none;
  }
  #task-name {
    padding: 5px;
    margin-left: 20px;
    width: 300px;
    margin-top: 20px;
  }
  .task-details {
    font-size: 15px;
    font-family: sans-serif;
    font-weight: 600;
    border: 1px solid grey;
    opacity: 0.8;
    padding: 10px;
    width: 500px;
    height: 50px;
    text-align: center;
    border-radius: 5px;
    margin-top: 0px;
  }
  .newtaskh1 {
    font-size: 30px;
    font-family: sans-serif;
    font-weight: 600;
    position: sticky;
    top: 0;
  }
  label::placeholder {
    font-size: 30px;
    font-family: 'Segoe UI';
    font-weight: 600;
  }
  .flexinput {
    display: flex;
  }
  .form-floating {
    margin-left: 50px;
    background-color: whitesmoke;
  }
  #firstinput {
    margin-left: 0px;
  }
.form-control {
    width: 390px;
    font-family: monospace;
  }
  #overflow {
    overflow-y: scroll;
    overflow-x: hidden;
    z-index: -100;
    height: 450px;
    width: 420px;
    box-sizing: border-box;
    padding: 20px;
  }
  #overflow::-webkit-scrollbar {
    display: none;
  }
  #closePopup , #openPopup , option , select {
    margin-left: 80px;
    margin-top: 20px;
    font-family: 'Segoe UI';
  }
  #signwithgoogle {
    margin-top: 10px;
    font-family: 'Segoe UI';
  }
  .tododiv {
    width: 300px;
    height: 250px;
    border-radius: 10px;
    margin-top: 30px;
    margin-left: 28px;
    background-color: whitesmoke;
    transition: all 0.5s;
    text-decoration: none;
    color: black;
  }
  .todoinnerdiv {
    width: 270px;
    height: 180px;
    border-radius: 10px;
    position: relative;
    top: 25px;
    left: 15px;
    background-color: white;
    transition: all 0.5s;
  }
  .todoinnerdiv:hover {
    box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
  }
  .tododiv:hover {
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
}

  
  #taskstatus1 {
    font-size: 15px;
    font-family: sans-serif;
    font-weight: 500;
    position: relative;
    top: 10px;
    margin-left: 20px;
    background-color: lightgrey;
    width: auto;
    padding-left: 10px;
    padding-right: 10px;
    padding-top: 3px;
    padding-bottom: 3px;
    border-radius: 5px;
  }
  #taskname1 {
    font-size: 16px;
    font-family: sans-serif;
    font-weight: 600;
    position: relative;
    top: 10px;
    margin-left: 20px;
  }
  #taskdetails1 {
    font-size: 14px;
    width: 220px;
    font-family: sans-serif;
    font-weight: 500;
    position: relative;
    top: 5px;
    margin-left: 20px;
  }
  #projectname1 {
    font-size: 14px;
    width: 220px;
    font-family: sans-serif;
    font-weight: 500;
    position: relative;
    top: -5px;
    margin-left: 20px;
  }
  #taskdue1 {
    font-size: 14px;
    width: 330px;
    font-family: sans-serif;
    font-weight: 500;
    position: relative;
    top: -13px;
    margin-left: 20px;
  }
  #taskdue-assign1 {
    display: flex;
  }
  #taskassignee1 {
    font-size: 14px;
    width: 220px;
    font-family: sans-serif;
    font-weight: 500;
    position: relative;
    top: -13px;
    margin-left: 20px;
    text-decoration: none;
    color: black;
  }
  #taskassignee1:hover {
    text-decoration: underline;
    color: blue;
  }
  #taskpriority1 {
    font-size: 14px;
    width: 220px;
    font-family: sans-serif;
    font-weight: 500;
    position: relative;
    top: -20px;
    margin-left: 20px;
  } 
  #searchbarfilter {
    display: none;
  width: 250px;
  height: 35px;
  font-size: 10px;
  margin-left: 0px;
  margin-top: 22px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
  border-top-left-radius: 0px;
  border-bottom-left-radius: 0px;
  }
  #bx-circle {
    border-radius: 50%;
    border: none;
  }
  #todo-container {
    display: flex;
    flex-wrap: wrap;
  }
  #todo-container2 {
    display: flex;
    flex-wrap: wrap;
  }
  #todo-container3 {
    display: flex;
    flex-wrap: wrap;
  }
  #todo-container4 {
    display: flex;
    flex-wrap: wrap;
  }
  .todohead {
    margin-left: 25px;
    margin-top: 20px;
    font-size: 30px;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }
  .flex-sort {
    display: flex;
    margin-top: 30px;
  }
  #sort , #filter {
    margin-left: 30px;
    margin-top: 21px;
    font-family: monospace;
  }
.red {
  background-color: red;
  border-radius: 50%;
}
.yellow {
  background-color: yellow;
  border-radius: 50%;
}
.green {
  background-color: lightseagreen;
  border-radius: 50%;
}
.lightgreen {
  background-color: #D0F0C0;
}
.lightyellow {
  background-color: #efe9b2;
}
.lightred {
  background-color: #FFCCCB ;
}


/* Default light mode styles */
body {
    background-color: #f0f0f0;
    color: #333;
}

/* Dark mode styles */
.dark-mode body {
    background-color: #333;
    color: #f0f0f0;
}
    
    </style>
</head>
<body>
<div class="sidebar close">
  <div class="logo-details">
    <i class="bx bx-task"></i>
    <span class="logo_name">ProjectProVision</span>
  </div>
  <ul class="nav-links">
    <li></li>
    <li>
      <a href="home.jsp">
        <i class="bx bx-task"></i>
        <span class="link_name">My project's</span>
      </a>
      <ul class="sub-menu blank">
        <li><a class="link_name" href="#">My Project's</a></li>
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
        <li><a href="./pages/PersonalTasks.html">Personal Tasks</a></li>
        <li><a href="#">Work/Professional Tasks</a></li>
        <li><a href="#">Academic Tasks</a></li>
      </ul>
    </li>
    <li>
      <div class="icon-link">
        <a href="#">
          <i class="bx bx-news"></i>
          <span class="link_name">Templates</span>
        </a>
        <i class="bx bxs-chevron-down arrow"></i>
      </div>
      <ul class="sub-menu">
        <li><a class="link_name" href="#">Templates</a></li>
        <li><a href="pages/freetemplates.html">Free Templates</a></li>
        <li><a href="#">Paid Templates</a></li>
      </ul>
    </li>
    <li></li>
    <li>
      <a href="#">
        <i class="bx bx-refresh"></i>
        <span class="link_name">Recurring Project's</span>
      </a>
      <ul class="sub-menu blank">
        <li><a class="link_name" href="#">Recurring Project's</a></li>
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
      <a href="#">
        <i class="bx bx-moon"></i>
        <span id="link" class="link_name">Dark Mode</span>
      </a>
      <ul class="sub-menu blank">
        <li><a id="link" class="link_name" >Dark Mode</a></li>
      </ul>
    </li>
    <li>
<form id="logoutbtn" action="/logout" method="post">
    <button class="logoutbtn" type="submit">
        <i class="bx bx-log-out"></i>
        <span class="link_name">LogOut</span>
    </button>
</form>

      <ul class="sub-menu blank">
        <li><a class="link_name" href="#">LogOut</a></li>
      </ul>
    </li>
    <li>
      <div class="profile-details">
        <a class="profile-content" href="<%= request.getContextPath() %>/profile">
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
<script>
const darkModeToggle =   document.getElementById("link");
const body = document.body;

darkModeToggle.addEventListener('click', () => {
    body.classList.toggle('dark-mode');
});


</script>
</body>
</html>