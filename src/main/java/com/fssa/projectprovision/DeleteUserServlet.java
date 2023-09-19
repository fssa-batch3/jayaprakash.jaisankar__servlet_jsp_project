package com.fssa.projectprovision;

import com.fssa.projectprovision.exception.ServiceException;
import com.fssa.projectprovision.model.User;
import com.fssa.projectprovision.service.UserService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteUserServlet")
public class DeleteUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String emailToDelete = request.getParameter("emailToDelete");

        UserService userService = new UserService();

        try {
            boolean deleted = userService.deleteUser(emailToDelete);

            if (deleted) {
                response.getWriter().write("User deleted successfully");
            } else {
                response.getWriter().write("User not found or already deleted");
            }
        } catch (ServiceException e) {
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
