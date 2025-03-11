<%@page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession staffSession = request.getSession(false);
        String sessionStaffEmail = (staffSession != null) ? (String) staffSession.getAttribute("email") : null;
            pageContext.setAttribute("staff_email", sessionStaffEmail);
%>