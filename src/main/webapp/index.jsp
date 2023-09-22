<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ProjectProVision</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/index.css" />

    <link
      href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
      rel="stylesheet"
    />
    <!-- End -->
  </head>
  <body>
    <header>
      <nav class="navbar">
        <div>
          <h1 class="logo-title">
            <i class="bx bx-task"></i> Project Management
          </h1>
        </div>
        <div class="btns">
          <div>
            <form action="pages/login3.jsp">
              <button type="submit" class="login-btn">LogIn</button>&emsp;	
            </form>
          </div>
          <div>
            <form action="pages/register.jsp">
              <button type="submit" class="signup-btn">SignUp</button>
            </form>
          </div>
        </div>
      </nav>
    </header>

    <main>
      <section class="hero">
        <h2>Welcome to Project Management!</h2>
        <p>Keep track of your project and stay organized.</p>
      </section>

      <section class="login-signup">
        <h2>Explore Our Features</h2>

        <div class="cards-features">
          <div class="card">
            <a class="card1" href="#">
              <p>Manage your Project</p>
              <p class="small">You can Manage project in this Website</p>
              <div class="go-corner" href="#">
                <div class="go-arrow"></div>
              </div>
            </a>
          </div>
          <!-- second -->
          <div class="card">
            <a class="card1" href="#">
              <p>Task Management</p>
              <p class="small">We have Task Managent</p>
              <div class="go-corner" href="#">
                <div class="go-arrow"></div>
              </div>
            </a>
          </div>
          <!-- third -->
          <div class="card">
            <a class="card1" href="#">
              <p>Invite Members</p>
              <p class="small">You can invite members in your team.</p>
              <div class="go-corner" href="#">
              </div>
            </a>
          </div>
          <!-- fourth -->

          <div class="card">
            <a class="card1" href="#">
              <p>Personal Task management</p>
              <p class="small">
                You can manage your personal here.
              </p>
              <div class="go-corner" href="#">
                <div class="go-arrow"></div>
              </div>
            </a>
          </div>
        </div>

        <div class="container">
          <h3 lass="termsandconditionsh1">Project management</h3>
          <p class="termsandconditions">
            Project management is a strategic process that orchestrates diverse
            elements to accomplish defined objectives. It encompasses
            initiation, planning, execution, monitoring, and closure phases,
            ensuring a systematic approach from idea to result. The Iron
            Triangle theory emphasizes the delicate balance between scope, time,
            and cost, illustrating that altering any factor impacts the
            project's dynamics. Quality and stakeholder satisfaction are also
            integral, requiring meticulous attention to detail and continuous
            improvement. Skilled project managers harness their expertise in
            communication, risk management, and resource allocation to navigate
            uncertainties, facilitate collaboration, and meet deadlines.
            Ultimately, successful project management hinges on aligning efforts
            with the organizational strategy, optimizing efficiency, and
            delivering value.
          </p>
        </div>
      </section>
    </main>

    <footer>
      <p>
        © 2023 <span><i class="bx bx-task"></i> TodoMaster</span>. All rights
        reserved.
      </p>
    </footer>
  </body>
</html>
