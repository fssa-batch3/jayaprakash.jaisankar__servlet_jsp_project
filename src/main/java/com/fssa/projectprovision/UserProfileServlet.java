package com.fssa.projectprovision;

import com.fssa.projectprovision.model.User;
import com.fssa.projectprovision.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user-profile")
public class UserProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Retrieve the user's ID from the session
        int userId = (int) session.getAttribute("id");

        // Fetch user data from the UserService (adjust the UserService class accordingly)
        UserService userService = new UserService(); // You'll need to create this service
        User user = userService.getUserById(id);

        if (user != null) {
            // Set the user object as an attribute and forward to the user profile JSP
            request.setAttribute("user", user);
            request.getRequestDispatcher("/user-profile.jsp").forward(request, response);
        } else {
            // Handle the case where the user doesn't exist or there's an error
            response.getWriter().write("User not found or an error occurred.");
        }
    }
}
