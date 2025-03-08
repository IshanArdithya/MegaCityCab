<%-- 
    Document   : sessions_checker
    Created on : Mar 9, 2025, 12:58:32 AM
    Author     : IshanPC
--%>

<%@ page import="java.util.Enumeration" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Session Checker</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            h2 {
                color: #333;
            }
            ul {
                list-style-type: none;
                padding: 0;
            }
            li {
                margin: 10px 0;
            }
            form {
                margin-top: 20px;
            }
            label {
                font-weight: bold;
            }
            select, button {
                padding: 5px;
                margin: 5px;
            }
        </style>
    </head>
    <body>
        <h2>Sessions</h2>
        <ul>
            <%
                if (request.getMethod().equalsIgnoreCase("POST") && request.getParameter("destroy_session") != null) {
                    String sessionName = request.getParameter("session_name");
                    if (sessionName != null && !sessionName.isEmpty()) {
                        session.removeAttribute(sessionName);
                        response.sendRedirect("sessions_checker.jsp");
                        return;
                    }
                }

                Enumeration<String> sessionAttributes = session.getAttributeNames();
                while (sessionAttributes.hasMoreElements()) {
                    String attributeName = sessionAttributes.nextElement();
                    Object attributeValue = session.getAttribute(attributeName);
            %>
            <li>
                <strong><%= attributeName%>:</strong>
                <% if (attributeValue instanceof java.util.Map) { %>
                <ul>
                    <% for (java.util.Map.Entry<?, ?> entry : ((java.util.Map<?, ?>) attributeValue).entrySet()) {%>
                    <li><%= entry.getKey()%>: <%= entry.getValue()%></li>
                        <% } %>
                </ul>
                <% } else {%>
                <%= attributeValue%>
                <% } %>
            </li>
            <%
                }
            %>
        </ul>

        <form method="post">
            <label for="session_name">Select session to destroy:</label>
            <select name="session_name" id="session_name">
                <%
                    Enumeration<String> sessionAttributesForForm = session.getAttributeNames();
                    while (sessionAttributesForForm.hasMoreElements()) {
                        String attributeName = sessionAttributesForForm.nextElement();
                %>
                <option value="<%= attributeName%>"><%= attributeName%></option>
                <%
                    }
                %>
            </select>
            <button type="submit" name="destroy_session">Destroy Session</button>
        </form>
    </body>
</html>