<%--
    Document   : login
    Created on : Feb 28, 2025, 5:12:25 PM
    Author     : IshanPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@include file="sessionCheck.jsp" %>

<%    if (sessionEmail != null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Sign-In | Mega City Cab</title>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <section id="loginPage">
            <%@ include file="components/header.jsp" %>

            <div class="login-container">
                <div class="container">
                    <div class="login-content">
                        <div class="login">
                            <h2>Welcome To</h2>
                            <h1 class="brand-name">Mega City Cab</h1>
                            <form action="login" method="POST">
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
                                <h1 class="brand-name brand-name-register">Mega City Cab</h1>
                                <form action="register" method="POST">
                                    <div class="form-row">
                                        <div class="login-form-group">
                                            <label>First Name</label>
                                            <div class="input-container">
                                                <input type="text" name="firstName" required>
                                                <i class="ri-user-fill input-icon"></i>
                                            </div>
                                        </div>

                                        <div class="login-form-group">
                                            <label>Last Name</label>
                                            <div class="input-container">
                                                <input type="text" name="lastName" required>
                                                <i class="ri-user-fill input-icon"></i>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="login-form-group">
                                            <label>Email</label>
                                            <div class="input-container">
                                                <input type="email" name="email" required>
                                                <i class="ri-mail-fill input-icon"></i>
                                            </div>
                                        </div>
                                        <div class="login-form-group">
                                            <label>Contact Number</label>
                                            <div class="input-container">
                                                <input type="number" name="contactNumber" required>
                                                <i class="ri-phone-fill input-icon"></i>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="login-form-group">
                                            <label>Home Address</label>
                                            <div class="input-container">
                                                <input type="text" name="homeAddress" required>
                                                <i class="ri-home-4-fill input-icon"></i>
                                            </div>
                                        </div>
                                        <div class="login-form-group">
                                            <label>NIC</label>
                                            <div class="input-container">
                                                <input type="text" name="nic" required>
                                                <i class="ri-id-card-fill input-icon"></i>
                                            </div>
                                        </div>
                                    </div>

                                    <div>
                                        <div class="form-row">
                                            <div class="login-form-group">
                                                <label>Password</label>
                                                <div class="input-container">
                                                    <input type="password" name="password" required>
                                                    <i class="ri-lock-password-fill input-icon"></i>
                                                </div>
                                            </div>

                                            <div class="login-form-group">
                                                <label>Confirm Password</label>
                                                <div class="input-container">
                                                    <input type="password" name="confirmPassword" required>
                                                    <i class="ri-lock-password-fill input-icon"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="error-message">Those passwords didn’t match. Try again.</div>
                                    </div>

                                    <div class="login-form-group">
                                        <button type="submit" class="login-btn">SIGN UP <i class="ri-arrow-right-double-fill animate-icon"></i></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="register-message">
                        <h2>Join Us Today!</h2>
                        <p>Start your journey with Mega City Cab by creating an account.</p>
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
            <script>
        function getParameterByName(name, url = window.location.href) {
            name = name.replace(/[\[\]]/g, '\\$&');
            let regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, ' '));
        }

        const registerSuccess = getParameterByName('registersuccess');
        if (registerSuccess === '1') {
            Swal.fire({
                icon: 'success',
                title: 'Registration Successful!',
                text: 'You have successfully registered. Please log in.',
                confirmButtonText: 'OK',
                customClass: {
                    confirmButton: 'swal2-confirm'
                }
            });
        }

        const registerError = getParameterByName('registererror');
        if (registerError === '1') {
            Swal.fire({
                icon: 'error',
                title: 'Registration Error',
                text: 'An error occurred during registration. Please try again.',
                confirmButtonText: 'OK',
                customClass: {
                    confirmButton: 'swal2-confirm'
                }
            });
        } else if (registerError === '3') {
            Swal.fire({
                icon: 'warning',
                title: 'Email Already Exists',
                text: 'The email you entered is already registered. Please use a different email.',
                confirmButtonText: 'OK',
                customClass: {
                    confirmButton: 'swal2-confirm'
                }
            });
        }
            </script>
            <script src="js/userregister.js"></script>
    </body>
</html>
