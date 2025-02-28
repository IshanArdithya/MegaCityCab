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
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet" />
    </head>
    <body>
        <%@ include file="components/header.jsp" %>

        <div class="login-container">
            <div class="container">
                <div class="login-content">
                    <div class="login">
                        <h2>Welcome To</h2>
                        <h1 class="brand-name">Mega City Cab</h1>
                        <form>
                            <div class="login-form-group">
                                <label>Email</label>
                                <div class="input-container">
                                    <input type="email" required>
                                    <i class="ri-mail-fill input-icon"></i>
                                </div>
                            </div>

                            <div class="login-form-group">
                                <label>Password</label>
                                <div class="input-container">
                                    <input type="password" required>
                                    <i class="ri-lock-password-fill input-icon"></i>
                                </div>
                            </div>
                            <div class="login-form-group">
                                <button type="submit" class="login-btn">LOGIN <i
                                        class="ri-arrow-right-double-fill animate-icon"></i></button>
                            </div>
                        </form>
                        <!--                    <p class="signup-text">Don't have an account? <a href="#">SIGN UP</a></p>-->
                    </div>
                </div>

                <div class="login-message">
                    <h2>Welcome Back!</h2>
                    <p>To keep connected with us, please login to your account using your email address and password.</p>
                    <div class="login-message-sign-up">
                        <p>Don't have an account?</p>
                        <button class="login-switch-btn">Sign Up</button>
                    </div>
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

        <div class="register-container" style="display: none;">
            <div class="container">
                <div class="register-container-sub">
                    <div class="register-content">
                        <div class="register">
                            <h2>Create Account</h2>
                            <h1 class="brand-name">Mega City Cab</h1>
                            <form>
                                <div class="login-form-group">
                                    <label>Email</label>
                                    <div class="input-container">
                                        <input type="email" required>
                                        <i class="ri-mail-fill input-icon"></i>
                                    </div>
                                </div>

                                <div class="login-form-group">
                                    <label>Password</label>
                                    <div class="input-container">
                                        <input type="password" required>
                                        <i class="ri-lock-password-fill input-icon"></i>
                                    </div>
                                </div>

                                <div class="login-form-group">
                                    <button type="submit" class="login-btn">REGISTER <i class="ri-arrow-right-double-fill animate-icon"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="register-message">
                    <h2>Join Us Today!</h2>
                    <p>Start your journey with Mega City Cab by creating an account. Book rides seamlessly!</p>
                    <div class="login-message-sign-up">
                        <p>Already have an account?</p>
                        <button class="register-switch-btn">Sign In</button>
                    </div>
                </div>
                <div class="register-footer-text">
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

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const loginContainer = document.querySelector(".login-container");
                const registerContainer = document.querySelector(".register-container");
                const signUpBtn = document.querySelector(".login-switch-btn");
                const loginBtn = document.querySelector(".register-switch-btn");

                signUpBtn.addEventListener("click", function () {
                    loginContainer.style.display = "none";
                    registerContainer.style.display = "flex";
                });

                loginBtn.addEventListener("click", function () {
                    registerContainer.style.display = "none";
                    loginContainer.style.display = "flex";
                });
            });
        </script>
    </body>
</html>
