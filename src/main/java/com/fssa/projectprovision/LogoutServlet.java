package com.fssa.projectprovision;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate the user's session to log them out
        HttpSession session = request.getSession(false); // Get the current session, or create one if it doesn't exist
        if (session != null) {
            session.invalidate(); // Invalidate the session (log out)
        }
        
        // Redirect the user to the index.jsp page after logging out
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
