package com.fssa.projectprovision;

import java.io.IOException;

import com.google.gson.Gson;


import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.projectprovision.exception.ServiceException;
import com.fssa.projectprovision.model.User;
import com.fssa.projectprovision.service.UserService;

@WebServlet("/getAllUsers")
public class GetAllUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService userService = new UserService();
        List<User> userList = null;
        try {
            userList = userService.getAllUsers();
            request.setAttribute("userList", userList);
            request.getRequestDispatcher("pages/userList.jsp").forward(request, response);
  
        } catch (ServiceException e) {
            e.printStackTrace();

            response.sendRedirect(request.getContextPath() + "/pages/error.jsp");
        }

       
    }

}

