package com.fssa.projectprovision;

import com.fssa.projectprovision.exception.ServiceException;
import com.fssa.projectprovision.model.User;
import com.fssa.projectprovision.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LoginServlet1")
public class LoginServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserService userService = new UserService();
        User user = new User();
        user.setEmail(email);
        user.setPassword(password);

        try {
            User loggedInUser = userService.loginUser(user);
            if (loggedInUser != null) {
                // Store the user's ID in the session
                HttpSession session = request.getSession();
                session.setAttribute("userId", loggedInUser.getUserId());
                session.setAttribute("taskassignee", loggedInUser.getTaskAssignee()); // Set task assignee

                System.out.println("User ID set in session: " + loggedInUser.getUserId());
                System.out.println("Task Assignee set in session: " + loggedInUser.getTaskAssignee());

                response.sendRedirect(request.getContextPath() + "/index2.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/login3.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred");
            request.getRequestDispatcher("/pages/login3.jsp?errorMessage=An error occurred").forward(request, response);
          
        }
    }
}
