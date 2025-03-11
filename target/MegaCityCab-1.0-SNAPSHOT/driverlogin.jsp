<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@include file="sessionCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/style.css">
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
            rel="stylesheet"
            />
    </head>
    <body>
        <div class="nav-a-dark">
            <%@ include file="components/header.jsp" %>
            <div class="driver__flex-container">
                <div class="driver__container">
                    <div class="driver__image-box">
                        <img src="/MegaCityCab/images/driver-login-bg.png" alt="image">
                    </div>

                    <div class="driver__login-box" id="loginBox">
                        <h2>Driver Login</h2>
                        <p>Enter your account details to sign in</p>
                        <form action="${pageContext.request.contextPath}/driver-login" method="POST">
                            <input type="email" name="email" placeholder="Enter Email" required>
                            <input type="password" name="password" placeholder="Enter Password" required>
                            <button type="submit">Sign in</button>
                        </form>
                        <p class="driver__register-text">
                            Don't have an account? <a href="#" onclick="showSignup()">Sign Up</a>
                        </p>
                    </div>

                        <div class="driver__login-box" id="signupBox" style="display: none;">
                            <h2>Driver Sign Up</h2>
                            <p>Fill in your details to create an account</p>
                            <form action="${pageContext.request.contextPath}/driver-signup" method="POST">
                                <div class="driver__input-row">
                                    <input type="text" name="registerFirstName" placeholder="First Name" required>
                                    <input type="text" name="registerLastName" placeholder="Last Name" required>
                                </div>
                                <div class="driver__input-row">
                                    <input type="email" name="registerEmail" placeholder="Enter Email" required>
                                    <input type="tel" name="registerContactNumber" placeholder="Contact Number" required>
                                </div>
                                <div class="driver__input-row">
                                    <input type="text" name="registerHomeAddress" placeholder="Home Address" required>
                                    <input type="text" name="registerNIC" placeholder="NIC" required>
                                </div>
                                <div class="driver__input-row">
                                    <input type="password" name="registerPassword" placeholder="Enter Password" required>
                                    <input type="password" name="registerConfirmPassword" placeholder="Confirm Password" required>
                                </div>
                                <div class="error-message driver-register__error2">Those passwords didn’t match. Try again.</div>
                                <button type="submit">Sign Up</button>
                            </form>
                            <p class="driver__register-text">
                                Already have an account? <a href="#" onclick="showLogin()">Sign In</a>
                            </p>
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

        <%
//            String success = request.getParameter("success");
//            String error = request.getParameter("error");
//            if (success != null && success.equals("1")) {
//                out.println("<p style='color: green;'>Driver account created successfully! Please sign in.</p>");
//            }
//            if (error != null) {
//                if (error.equals("1")) {
//                    out.println("<p style='color: red;'>Failed to create driver account. Please try again.</p>");
//                } else if (error.equals("2")) {
//                    out.println("<p style='color: red;'>Passwords do not match. Please try again.</p>");
//                }
//            }
        %>

        <script>
            function showSignup() {
                document.getElementById("loginBox").style.display = "none";
                document.getElementById("signupBox").style.display = "block";
            }

            function showLogin() {
                document.getElementById("signupBox").style.display = "none";
                document.getElementById("loginBox").style.display = "block";
            }

        </script>
        <script src="js/driverregister.js"></script>
    </body>
</html>

