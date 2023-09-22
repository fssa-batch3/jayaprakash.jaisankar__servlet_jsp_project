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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Get the existing session, don't create a new one if it doesn't exist

        if (session != null && session.getAttribute("userId") != null) {
            // User is logged in, retrieve user information from the session
            long userId = (long) session.getAttribute("userId");

            try {
                // Create an instance of UserService
                UserService userService = new UserService();
                
                // Retrieve user information from the database using the userId
                User user = userService.getUserById(userId);

                if (user != null) {
                    // Forward to the profile page with user information
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("/pages/Profile.jsp").forward(request, response);
                } else {
                    // Handle the case where the user is not found in the database
                    response.getWriter().write("User not found");
                }
            } catch (ServiceException e) {
                e.printStackTrace();
                response.getWriter().write("An error occurred");

                response.sendRedirect(request.getContextPath() + "/pages/error.jsp");
            }
        } else {
            // User is not logged in, redirect to the login page or display an error message
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Get the existing session, don't create a new one if it doesn't exist

        if (session != null && session.getAttribute("userId") != null) {
            // User is logged in, retrieve user information from the session
            long userId = (long) session.getAttribute("userId");

            try {
                // Retrieve updated user information from the form parameters
                String name = request.getParameter("name");
                String gender = request.getParameter("gender");
                String mobileNumber = request.getParameter("mobileNumber");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                System.out.println("Date of Birth Parameter: " + request.getParameter("dateOfBirth"));
                String dateOfBirthParam = request.getParameter("dateOfBirth");

                if (dateOfBirthParam == null || dateOfBirthParam.isEmpty()) {
                    response.getWriter().write("Date of birth parameter is missing or empty.");
                    return;
                }

                LocalDate dateOfBirth = LocalDate.parse(dateOfBirthParam, formatter);
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String profilePic = request.getParameter("profilePic");
                String address = request.getParameter("address");
                String aboutMe = request.getParameter("aboutMe");

                User user = new User();
                user.setUserId(userId);
                user.setName(name);
                user.setGender(gender);
                user.setMobileNumber(mobileNumber);
                user.setDateOfBirth(dateOfBirth);
                user.setEmail(email);
                user.setPassword(password);
                user.setProfilePic(profilePic);
                user.setAddress(address);
                user.setAboutMe(aboutMe);

                UserService userService = new UserService();
                userService.updateUser(user);
                request.setAttribute("profilePicURL", profilePic);
                response.sendRedirect(request.getContextPath() + "/index2.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("An error occurred");
                request.getRequestDispatcher("/pages/Profile.jsp?errorMessage=An error occurred").forward(request, response);
                
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }
}
