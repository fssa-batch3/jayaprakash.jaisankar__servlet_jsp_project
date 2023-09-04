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

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the user is logged in by verifying the presence of the userId attribute in the session
        HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("userId");

        if (userId != null) {
            // Fetch the user's information from the database using the userId
            UserService userService = new UserService();
            User user = userService.getUserById(userId);

            if (user != null) {
                // Set the user object as an attribute in the request
                request.setAttribute("user", user);
                // Forward the request to the profile JSP page
                request.getRequestDispatcher("/profile.jsp").forward(request, response);
            } else {
                // Handle the case where the user doesn't exist
                response.sendRedirect(request.getContextPath() + "/home.jsp");
            }
        } else {
            // Handle the case where the user is not logged in
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }
}
