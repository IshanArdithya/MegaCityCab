package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.DriverDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DriverSignupServlet", urlPatterns = {"/driver-signup"})
public class DriverSignupServlet extends HttpServlet {

    private DriverDAO driverDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        driverDAO = new DriverDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("registerFirstName");
        String lastName = request.getParameter("registerLastName");
        String email = request.getParameter("registerEmail");
        String contactNumber = request.getParameter("registerContactNumber");
        String homeAddress = request.getParameter("registerHomeAddress");
        String nic = request.getParameter("registerNIC");
        String password = request.getParameter("registerPassword");
        String confirmPassword = request.getParameter("registerConfirmPassword");
        String gender = request.getParameter("registerGender");
        String vehicleName = request.getParameter("registerVehicleName");
        String passengerCount = request.getParameter("registerPassengerCount");
        String vehicleNumber = request.getParameter("registerVehicleNumber");

        if (!password.equals(confirmPassword)) {
            response.sendRedirect(request.getContextPath() + "/driverlogin.jsp?registererror=2");
            return;
        }

        if (driverDAO.emailExists(email)) {
            response.sendRedirect(request.getContextPath() + "/driverlogin.jsp?registererror=3");
            return;
        }

        if (driverDAO.registerDriver(firstName, lastName, email, contactNumber, homeAddress, nic, password, gender, vehicleName, passengerCount, vehicleNumber)) {
            response.sendRedirect(request.getContextPath() + "/driverlogin.jsp?registersuccess=1");
        } else {
            response.sendRedirect(request.getContextPath() + "/driverlogin.jsp?registererror=1");
        }
    }
}