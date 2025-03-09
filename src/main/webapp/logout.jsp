<%-- 
    Document   : logout
    Created on : Mar 9, 2025, 4:06:25 PM
    Author     : IshanPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@include file="sessionCheck.jsp" %>
<%
    if (session != null) {
        session.invalidate();
    }
    response.sendRedirect("index.jsp");
%>