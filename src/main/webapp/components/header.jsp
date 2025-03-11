<%
    String headerRequestURI = request.getRequestURI();
    boolean headerIsLoginPage = headerRequestURI.endsWith("/login.jsp");
        boolean headerIsAdminLoginPage = headerRequestURI.endsWith("/adminlogin.jsp");

    String firstName = (String) session.getAttribute("firstName");
%>

<header>
    <div class="navbar">
        <div class="container">
            <nav>
                <div class="logo">
                    <a href="/MegaCityCab/index.jsp"><img src="https://placehold.co/500x100" alt=""></a>
                </div>
                <ul>
                    <li class="main-navigation"><a href="/MegaCityCab/index.jsp">Home</a></li>
                    <li class="main-navigation"><a href="/MegaCityCab/about.jsp">About</a></li>
                    <li class="main-navigation"><a href="/MegaCityCab/bookings.jsp">Bookings</a></li>
                    <li class="nav-divider">|</li>
                    <li class="main-navigation main-nav-li"><a href="/MegaCityCab/index.jsp#get-started">Get Started</a></li>
                </ul>

                <% if (!headerIsLoginPage && !headerIsAdminLoginPage) {
                        if (sessionEmail != null) {%>
                <div class="avatar-container">
                    <a href="#" class="avatar-link">
                        <img src="https://avatar.iran.liara.run/public" alt="User Avatar" class="avatar" id="avatar">
                    </a>
                    <div class="dropdown-menu" id="dropdownMenu">
                        <div class="dropdown-header">
                            <img src="https://avatar.iran.liara.run/public" alt="User Avatar" class="dropdown-avatar">
                            <div class="dropdown-greeting">Hi, <%= firstName != null ? firstName : "User"%></div>
                        </div>
                        <a href="/MegaCityCab/user/profile.jsp" class="dropdown-item">
                            <i class="ri-user-line"></i>
                            <span>My Profile</span>
                        </a>
                            <a href="${pageContext.request.contextPath}/user-logout" class="dropdown-item">
                                <i class="ri-logout-box-r-line"></i>
                            <span>Logout</span>
                        </a>
                    </div>
                </div>
                <% } else { %>
                <a href="/MegaCityCab/login.jsp">
                    <button class="sign-in-btn">Sign In</button>
                </a>
                <% }
                    }%>
            </nav>
        </div>
    </div>
</header>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const avatar = document.getElementById("avatar");
        const dropdownMenu = document.getElementById("dropdownMenu");

        avatar.addEventListener("click", function (e) {
            e.preventDefault();
            dropdownMenu.style.display = dropdownMenu.style.display === "block" ? "none" : "block";
                    });
                    document.addEventListener("click", function (e) {
                        if (!avatar.contains(e.target) && !dropdownMenu.contains(e.target)) {
                            dropdownMenu.style.display = "none";
                        }
                    });
                });
</script>