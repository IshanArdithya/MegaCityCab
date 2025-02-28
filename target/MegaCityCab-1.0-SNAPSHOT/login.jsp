<%--
    Document   : login
    Created on : Feb 28, 2025, 5:12:25 PM
    Author     : IshanPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign-In | Mega City Cab</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@ include file="components/header.jsp" %>

        <div class="login-container">
            <div class="login-content">
                <div class="login">
                    <h2>Welcome To</h2>
                    <h1 class="brand-name">Mega City Cab</h1>
                    <form>
                        <div class="login-form-group">
                            <label>Email</label>
                            <input type="email" required>
                        </div>

                        <div class="login-form-group">
                            <label>Password</label>
                            <input type="password" required>
                        </div>
                        <div class="login-form-group">
                            <button type="submit" class="login-btn">LOGIN</button>
                        </div>
                    </form>
                    <p class="signup-text">Don't have an account? <a href="#">SIGN UP</a></p>
                </div>
            </div>

            <div class="taxi-image"></div>
            <div class="footer-text">
                <p class="left-text"></p>
                <p class="right-text"></p>
            </div>

        </div>

    </body>
</html>
