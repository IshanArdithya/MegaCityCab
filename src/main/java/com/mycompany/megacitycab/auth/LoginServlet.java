/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.megacitycab.auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author IshanPC
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (UserAuth.login(email, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);

            String firstName = UserAuth.getFirstName(email);
            String lastName = UserAuth.getLastName(email);
            String contactNumber = UserAuth.getContactNumber(email);
            if (firstName != null) {
                session.setAttribute("firstName", firstName);
            }
            if (lastName != null) {
                session.setAttribute("lastName", lastName);
            }
            if (contactNumber != null) {
                session.setAttribute("contactNumber", contactNumber);
            }

            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
