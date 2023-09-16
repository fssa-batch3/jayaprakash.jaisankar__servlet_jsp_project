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

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/pages/login3.jsp");
            return;
        }

        UserService userService = new UserService();

        try {
            User user = userService.getUserById(userId);

            if (user != null) {
                request.setAttribute("user", user);
                request.getRequestDispatcher("/profile.jsp").forward(request, response);
            } else {
                response.getWriter().write("User not found");
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred");
        } catch (ServletException e) {
            e.printStackTrace();
            response.getWriter().write("Servlet error occurred");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login3.jsp");
            return;
        }

        UserService userService = new UserService();

        try {
            User user = userService.getUserById(userId);

            if (user != null) {
                String name = request.getParameter("name");
                String mobileNumber = request.getParameter("mobileNumber");
                String address = request.getParameter("address");
                String aboutMe = request.getParameter("aboutMe");

                user.setName(name);
                user.setMobileNumber(mobileNumber);
                user.setAddress(address);
                user.setAboutMe(aboutMe);

                userService.updateUser(user);

                response.sendRedirect(request.getContextPath() + "/ProfileServlet");
            } else {
                response.getWriter().write("User not found");
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred");
        }
    }
}
