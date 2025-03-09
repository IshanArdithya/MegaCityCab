<%-- 
    Document   : sessionCheck
    Created on : Mar 9, 2025, 3:23:05 PM
    Author     : IshanPC
--%>

<%@page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession userSession = request.getSession(false);
    String email = (userSession != null) ? (String) userSession.getAttribute("email") : null;
    pageContext.setAttribute("email", email);

        String requestURI = request.getRequestURI();
        boolean isLoginPage = requestURI.endsWith("/login.jsp");
        pageContext.setAttribute("requestURI", requestURI);
        pageContext.setAttribute("isLoginPage", isLoginPage);
%>