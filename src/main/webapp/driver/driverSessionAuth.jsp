<%@page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession driverSession = request.getSession(false);
    String sessionDriverEmail = (driverSession != null) ? (String) driverSession.getAttribute("email") : null;
    pageContext.setAttribute("driver_email", sessionDriverEmail);
%>