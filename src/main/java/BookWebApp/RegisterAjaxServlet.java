package BookWebApp;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.projectprovision.exception.ServiceException;
import com.fssa.projectprovision.model.User;
import com.fssa.projectprovision.service.UserService;

/**
 * Servlet implementation class RegisterAjaxServlet
 */
@WebServlet("/RegisterAjaxServlet")
public class RegisterAjaxServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Set CORS headers to allow requests from your client's origin
        response.setHeader("Access-Control-Allow-Origin", "http://127.0.0.1:5501");
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Allow-Credentials", "true");

        // Retrieve user registration data from request parameters
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String mobileNumber = request.getParameter("mobileNumber");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String dateOfBirthStr = request.getParameter("dateOfBirth");
        if (dateOfBirthStr == null) {
            response.getWriter().write("Date of birth parameter is missing.");
            return;
        }
        LocalDate dateOfBirth = LocalDate.parse(dateOfBirthStr, formatter);

        String address = "address"; // Correct parameter name
        String aboutMe = "aboutMe"; // Correct parameter name
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String profilePic = "http://localhost:8080/taskmgmtapp-web/register1"; // Correct parameter name
        String myTodos = "{}"; // Correct parameter name
        long userIdStr = System.currentTimeMillis();

        // Create a User object with the retrieved data
        User user = new User(name, gender, mobileNumber, dateOfBirth, address, aboutMe,
                             email, password, profilePic, myTodos, userIdStr, false);

        // Use UserService to register the user
        UserService userService = new UserService();
        try {
            String resultMessage = userService.registerUser(user);
            if ("Registration Successful".equals(resultMessage)) {
                // Redirect to the login page after successful registration
                response.sendRedirect(request.getContextPath() + "/projectprovisionlogin.jsp");
            } else {
                response.getWriter().write(resultMessage);
            }
        } catch (ServiceException e) {
            e.printStackTrace();
            response.getWriter().write("Registration Failed");
        }
    }
}
