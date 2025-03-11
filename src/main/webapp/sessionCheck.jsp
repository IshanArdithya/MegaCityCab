<%@page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession userSession = request.getSession(false);
    String sessionEmail = (userSession != null) ? (String) userSession.getAttribute("email") : null;
        pageContext.setAttribute("email", sessionEmail);

        String requestURI = request.getRequestURI();
        boolean isLoginPage = requestURI.endsWith("/login.jsp");
        pageContext.setAttribute("requestURI", requestURI);
        pageContext.setAttribute("isLoginPage", isLoginPage);
%>