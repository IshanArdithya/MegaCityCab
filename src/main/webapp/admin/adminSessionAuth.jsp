<%-- 
    Document   : adminSessionAuth
    Created on : Mar 10, 2025, 3:48:30 AM
    Author     : IshanPC
--%>

<%@page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession staffSession = request.getSession(false);
        String sessionStaffEmail = (staffSession != null) ? (String) staffSession.getAttribute("email") : null;
            pageContext.setAttribute("staff_email", sessionStaffEmail);
%>