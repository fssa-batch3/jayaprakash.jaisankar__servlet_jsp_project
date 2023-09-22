package com.fssa.projectprovision;


import com.fssa.projectprovision.dao.UserDAO;

import com.fssa.projectprovision.exception.DAOException;
import com.fssa.projectprovision.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     	String name = request.getParameter("name");
		if (name == null || name.trim().isEmpty()) {
		    response.getWriter().write("Name parameter is missing or empty.");
		    return;
		}
        String gender = request.getParameter("gender");
        String mobileNumber = request.getParameter("mobile_number");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        System.out.println("Date of Birth Parameter: " + request.getParameter("dateOfBirth"));
        String dateOfBirthParam = request.getParameter("dateofbirth");
        if (dateOfBirthParam == null || dateOfBirthParam.isEmpty()) {
            response.getWriter().write("Date of birth parameter is missing or empty.");
            return;
        }

        LocalDate dateOfBirth = LocalDate.parse(dateOfBirthParam, formatter);
   String defaultAddress = "No Address";
        String defaultAboutMe = "No information available.";

        String email = request.getParameter("email"); 
        if (email != null && !email.isEmpty()) {
        	 response.getWriter().write("Email parameter is missing or empty.");
 		    return;
        } 
        String password = request.getParameter("password");

       
               String defaultProfilePic = "default_profile.png";
        String defaultMyTodos = "";
        long userId = System.currentTimeMillis();

         User newUser = new User();
        newUser.setName(name);
        newUser.setGender(gender);
        newUser.setMobileNumber(mobileNumber);
        newUser.setDateOfBirth(dateOfBirth);
        newUser.setAddress(defaultAddress);
        newUser.setAboutMe(defaultAboutMe);
        newUser.setProfilePic(defaultProfilePic);
        newUser.setMyTodos(defaultMyTodos);
        newUser.setEmail(email);
        newUser.setPassword(password);
        newUser.setUserId(userId);

       try {
            boolean userCreated = UserDAO.createUser(newUser);
            if (userCreated) {
            	request.setAttribute("profilePicURL", defaultProfilePic);
                response.sendRedirect(request.getContextPath() + "/signin.jsp");
            } else {
                response.getWriter().write("User registration failed.");
            }
        } catch (DAOException e) {
            e.printStackTrace();
            response.getWriter().write("User registration failed.");

            response.sendRedirect(request.getContextPath() + "/pages/error.jsp");
        }
    }
}