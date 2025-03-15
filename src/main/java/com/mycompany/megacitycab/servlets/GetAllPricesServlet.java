package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.PricingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "GetAllPrices", urlPatterns = {"/getAllPrices"})
public class GetAllPricesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PricingDAO pricingDAO = new PricingDAO();
        
        Map<Integer, Double> prices = new HashMap<>();
        prices.put(4, pricingDAO.getPriceByPassengerCount(4));
        prices.put(9, pricingDAO.getPriceByPassengerCount(9));
        prices.put(14, pricingDAO.getPriceByPassengerCount(14));

        String jsonResponse = "{";
        for (Map.Entry<Integer, Double> entry : prices.entrySet()) {
            jsonResponse += "\"" + entry.getKey() + "\":" + entry.getValue() + ",";
        }
        jsonResponse = jsonResponse.replaceAll(",$", "") + "}"; // remove trailing comma

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}
