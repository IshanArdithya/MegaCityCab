<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@include file="sessionCheck.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Sign-In | Mega City Cab</title>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet" />
    </head>
    <body>
        <section id="loginPage">
            <%@ include file="components/header.jsp" %>

            <div class="login-container">
                <div class="container">
                    <div class="login-content">
                        <div class="login">
                            <h2>Admin Login</h2>
                            <h1 class="brand-name">Mega City Cab</h1>
                            <form action="${pageContext.request.contextPath}/staff-login" method="POST">
                                <div class="login-form-group">
                                    <label>Email</label>
                                    <div class="input-container">
                                        <input type="email" name="email" required>
                                        <i class="ri-mail-fill input-icon"></i>
                                    </div>
                                </div>

                                <div class="login-form-group">
                                    <label>Password</label>
                                    <div class="input-container">
                                        <input type="password" name="password" required>
                                        <i class="ri-lock-password-fill input-icon"></i>
                                    </div>
                                </div>
                                <%
                                    String error = request.getParameter("error");
                                    if (error != null && error.equals("1")) {
                                        out.println("<p class='admin-error1'>Invalid email or password. Please try again.</p>");
                                    }
                                %>
                                <div class="login-form-group">
                                    <button type="submit" class="login-btn">SIGN IN <i
                                            class="ri-arrow-right-double-fill animate-icon"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="login-message">
                        <h2>Welcome Back!</h2>
                        <p>To access the administrative dashboard and manage system operations, please log in using your provided credentials.</p>
                    </div>

                    <div class="login-footer-text">
                        <div class="left-text">
                            <p>@Mega City Cab</p>
                            <p><i class="ri-phone-fill"></i> +94 11 241 1231</p>
                            <p><i class="ri-phone-fill"></i> +94 11 312 1561</p>
                            <p><i class="ri-mail-fill"></i> support@megacitycab.com</p>
                        </div>
                        <div class="right-text">
                            <div class="footer-socials">
                                <a href="https://www.facebook.com/"><i class="ri-facebook-circle-fill"></i></a>
                                <a href="https://x.com/home"><i class="ri-twitter-x-fill"></i></a>
                                <a href="https://www.instagram.com/"><i class="ri-instagram-fill"></i></a>
                                <a href="https://www.youtube.com/"><i class="ri-youtube-fill"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const loginContainer = document.querySelector(".login-container");
                const registerContainer = document.querySelector(".register-container");
                const signUpBtn = document.querySelector(".login-switch-btn");
                const loginBtn = document.querySelector(".register-switch-btn");
                const loginPageSection = document.querySelector("section#loginPage");

                signUpBtn.addEventListener("click", function () {
                    loginContainer.style.display = "none";
                    registerContainer.style.display = "flex";
                    loginPageSection.classList.add("nav-a-dark");
                });

                loginBtn.addEventListener("click", function () {
                    registerContainer.style.display = "none";
                    loginContainer.style.display = "flex";
                    loginPageSection.classList.remove("nav-a-dark");
                });
            });
        </script>
        <script src="js/userregister.js"></script>
    </body>
</html>
