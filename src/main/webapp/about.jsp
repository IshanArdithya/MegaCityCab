<%-- 
    Document   : about
    Created on : Mar 2, 2025, 2:43:23 PM
    Author     : IshanPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us</title>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet" />
    </head>
    <body>
        <%@ include file="components/header.jsp" %>
        <div class="about__hero">Abous Us</div>

        <div class="container">
            <div class="about__content-container">
                <div class="about__content-box">
                    <h2>Who We Are?</h2>
                    <div class="about__divider"></div>
                    <p>At Mega City Cab, we are committed to providing fast, reliable, and efficient cab services across Colombo City. Serving thousands of customers each month, we have established ourselves as a trusted name in urban transportation. Whether it's a quick ride across town or a scheduled trip to your destination, our fleet of well-maintained vehicles and professional drivers ensure a seamless travel experience.</p>
                    <p>Recognizing the challenges of manual order management, we are transforming the way our customers book and manage rides. Our goal is to integrate technology into our operations, making cab booking, billing, and ride management smoother than ever before.</p>
                </div>
                <div class="about__image-box">
                    <img src="images/gallery/about/about__taxi.jpg" alt="taxi image">
                </div>
            </div>

            <div class="about__content-container">
                <div class="about__content-box">
                    <h2>Our Mission</h2>
                    <div class="about__divider"></div>
                    <p>Our mission is to revolutionize urban mobility by implementing a computerized cab booking system that enhances efficiency, convenience, and customer satisfaction.<br /><br />We strive to:</p>

                    <div class="about__mission-points">
                        <div class="about__mission-item">
                            <div class="about__mission-item-wrapper"><i class="ri-taxi-fill"></i></div> <span>Provide a seamless booking experience</span>
                        </div>
                        <div class="about__mission-item">
                            <div class="about__mission-item-wrapper"><i class="ri-lock-2-fill"></i></div> <span>Ensure security & reliability</span>
                        </div>
                        <div class="about__mission-item">
                            <div class="about__mission-item-wrapper"><i class="ri-steering-2-fill"></i></div> <span>Streamline driver & vehicle management</span>
                        </div>
                        <div class="about__mission-item">
                            <div class="about__mission-item-wrapper"><i class="ri-book-open-fill"></i></div> <span>Enhance user experience</span>
                        </div>
                    </div>
                    <p>At Mega City Cab, we are dedicated to shaping the future of city travel, one ride at a time.</p>
                </div>
                <div class="about__content-box m-b-2-5rem">
                    <h2>Our Vision</h2>
                    <div class="about__divider"></div>
                    <p>At Mega City Cab, our vision is to be the leading smart transportation service in Colombo, offering a seamless, tech-driven, and customer-focused ride experience.<br /> <br />We envision a future where:</p>
                    <div class="about__mission-points">
                        <div class="about__mission-item">
                            <div class="about__mission-item-wrapper"><i class="ri-taxi-fill"></i></div> <span>Every ride is effortless</span>
                        </div>
                        <div class="about__mission-item">
                            <div class="about__mission-item-wrapper"><i class="ri-global-fill"></i></div> <span>Sustainability meets innovation</span>
                        </div>
                        <div class="about__mission-item">
                            <div class="about__mission-item-wrapper"><i class="ri-links-fill"></i></div> <span>Technology bridges convenience</span>
                        </div>
                        <div class="about__mission-item">
                            <div class="about__mission-item-wrapper"><i class="ri-group-fill"></i></div> <span>Customer trust & satisfaction drive us</span>
                        </div>
                    </div>
                    <p>We are committed to continuously evolving with technology and customer needs, ensuring Mega City Cab remains the go-to choice for urban mobility.</p>
                </div>
            </div>

            <div class="section-divider"></div>

            <section id="contact-us-section">
                <span class="features-badge">Contact Us</span>
                <h1 class="main-title about__title">Connect with Us</h1>

                <div class="contact-container">
                    <div class="contact-info">
                        <div>
                            <h2>Contact Information</h2>
                            <p>If you have any questions, Contact Us!</p>
                        </div>
                        <div class="contact-info-flex">
                            <div class="contact-info-icon">
                                <i class="ri-phone-fill"></i>
                            </div>
                            <div>
                                <p>+94 11 241 1231</p>
                                <p>+94 11 312 1561</p>
                            </div>
                        </div>
                        <div class="contact-info-flex">
                            <div class="contact-info-icon">
                                <i class="ri-mail-fill"></i>
                            </div>
                            <div>
                                <p>support@megacitycab.com</p>
                            </div>
                        </div>
                        <div class="contact-info-flex">
                            <div class="contact-info-icon">
                                <i class="ri-map-pin-2-fill"></i>
                            </div>
                            <div>
                                <p>Colombo, Sri Lanka</p>
                            </div>
                        </div>
                    </div>

                    <div class="contact-form">
                        <form class="contact-form-flex">

                            <div class="form-row">
                                <div class="form-group">
                                    <div class="entryarea">
                                        <input type="text" required>
                                        <div class="labelline">First Name *</div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="entryarea">
                                        <input type="text" required>
                                        <div class="labelline">Last Name *</div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <div class="entryarea">
                                        <input type="email" required>
                                        <div class="labelline">Email *</div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="entryarea">
                                        <input type="number" required>
                                        <div class="labelline">Mobile Number *</div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <div class="entryarea">
                                        <input type="text" required>
                                        <div class="labelline">Subject *</div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <div class="entryarea">
                                        <textarea></textarea>
                                        <div class="labelline">Message *</div>
                                    </div>
                                </div>
                            </div>

                            <button type="submit">Submit</button>
                        </form>
                    </div>
                </div>
            </section>
        </div>

        <%@ include file="components/footer.jsp" %>

    </body>
</html>
