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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                            <div class="progress-bar progress-bar-top">
                                <div class="progress-step" data-step="1">
                                    <div class="circle"></div>
                                </div>
                                <div class="progress-line"></div>
                                <div class="progress-step" data-step="2">
                                    <div class="circle"></div>
                                </div>
                                <div class="progress-line"></div>
                                <div class="progress-step" data-step="3">
                                    <div class="circle"></div>
                                </div>
                                <div class="progress-line"></div>
                                <div class="progress-step" data-step="4">
                                    <div class="circle"></div>
                                </div>
                            </div>
                            <div class="progress-bar">
                                <span>Step 1</span>
                                <span>Step 2</span>
                                <span>Step 3</span>
                                <span>Step 4</span>
                            </div>
                            <form action="${pageContext.request.contextPath}/driver-signup" method="POST">

                            <div class="form-step" data-step="1">
                                <input type="text" name="registerFirstName" placeholder="First Name" required>
                                <input type="text" name="registerLastName" placeholder="Last Name" required>
                                <input type="text" name="registerGender" placeholder="Gender" required>
                                <button type="button" onclick="nextStep()">Next</button>
                            </div>

                            <div class="form-step" data-step="2">
                                <input type="tel" name="registerContactNumber" placeholder="Contact Number" required>
                                <input type="text" name="registerHomeAddress" placeholder="Home Address" required>
                                <input type="text" name="registerNIC" placeholder="NIC" required>
                                <button type="button" onclick="prevStep()">Back</button>
                                <button type="button" onclick="nextStep()">Next</button>
                            </div>

                            <div class="form-step" data-step="3">
                                <input type="text" name="registerVehicleName" placeholder="Vehicle Name" required>
                                <input type="number" name="registerPassengerCount" placeholder="Passenger Count" required>
                                <input type="text" name="registerVehicleNumber" placeholder="Vehicle Registration Number" required>
                                <button type="button" onclick="prevStep()">Back</button>
                                <button type="button" onclick="nextStep()">Next</button>
                            </div>

                            <div class="form-step" data-step="4">
                                <input type="email" name="registerEmail" placeholder="Email" required>
                                <input type="password" name="registerPassword" placeholder="Password" required>
                                <input type="password" name="registerConfirmPassword" placeholder="Password" required>
                                <div class="error-message driver-register__error2">Those passwords didn’t match. Try again.</div>
                                <button type="button" onclick="prevStep()">Back</button>
                                <button type="submit">Sign Up</button>
                            </div>
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
            let currentStep = 1;
            const formSteps = document.querySelectorAll('.form-step');
            const progressSteps = document.querySelectorAll('.progress-step');
            const progressLines = document.querySelectorAll('.progress-line');

            function showStep(step) {
                formSteps.forEach((formStep, index) => {
                    formStep.style.display = index + 1 === step ? 'block' : 'none';
                });

                progressSteps.forEach((progressStep, index) => {
                    if (index + 1 <= step) {
                        progressStep.classList.add('active');
                    } else {
                        progressStep.classList.remove('active');
                    }
                });

                progressLines.forEach((progressLine, index) => {
                    if (index + 1 < step) {
                        progressLine.classList.add('active');
                    } else {
                        progressLine.classList.remove('active');
                    }
                });
            }

            function nextStep() {
                if (currentStep < 4) {
                    currentStep++;
                    showStep(currentStep);
                }
            }

            function prevStep() {
                if (currentStep > 1) {
                    currentStep--;
                    showStep(currentStep);
                }
            }

            showStep(currentStep);
        </script>



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
        <script src="js/login-popup.js"></script>
        <script src="js/driverregister.js"></script>
    </body>
</html>

