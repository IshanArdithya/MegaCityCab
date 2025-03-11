package com.mycompany.megacitycab.driverauth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DriverLoginServlet", urlPatterns = {"/driver-login"})
public class DriverLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (DriverAuth.authenticateDriver(email, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("driver_email", email);
            
            String driverFirstName = DriverAuth.getFirstName(email);
            if (driverFirstName != null) {
                session.setAttribute("driver_firstName", driverFirstName);
            }
            
            response.sendRedirect(request.getContextPath() + "/driver/dashboard.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/driverlogin.jsp?error=1");
        }
    }
}
