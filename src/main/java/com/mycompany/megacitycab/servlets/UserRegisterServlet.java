package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.auth.UserAuth;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserRegisterServlet", urlPatterns = {"/register"})
public class UserRegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String homeAddress = request.getParameter("homeAddress");
        String nic = request.getParameter("nic");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        if (UserAuth.emailExists(email)) {
            response.sendRedirect("login.jsp?registererror=3");
            return;
        }

        if (UserAuth.register(firstName, lastName, email, contactNumber, homeAddress, nic, password)) {
            
            response.sendRedirect("login.jsp?registersuccess=1");
        } else {
            response.sendRedirect("login.jsp?registererror=1");
        }
    }
}
