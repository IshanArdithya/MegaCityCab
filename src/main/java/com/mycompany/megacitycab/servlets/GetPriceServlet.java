package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.PricingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "GetPriceServlet", urlPatterns = {"/getPrice"})
public class GetPriceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int passengerCount = Integer.parseInt(request.getParameter("passengerCount"));

        PricingDAO pricingDAO = new PricingDAO();
        double price = pricingDAO.getPriceByPassengerCount(passengerCount);

        String jsonResponse = "{\"price\": " + price + "}";

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}
