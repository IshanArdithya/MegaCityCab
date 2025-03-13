package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.DriverDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DriverLoginServlet", urlPatterns = {"/driver-login"})
public class DriverLoginServlet extends HttpServlet {

    private DriverDAO driverDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        driverDAO = new DriverDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (driverDAO.authenticateDriver(email, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("driver_email", email);

            String driverFirstName = driverDAO.getDriverFirstName(email);
            if (driverFirstName != null) {
                session.setAttribute("driver_firstName", driverFirstName);
            }

            response.sendRedirect(request.getContextPath() + "/driver/dashboard.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/driverlogin.jsp?error=1");
        }
    }
}