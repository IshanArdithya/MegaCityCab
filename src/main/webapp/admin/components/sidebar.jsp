<aside>
    <div class="sidebar">
        <div class="sidebar-flex">
            <div class="toggle">
                <div class="logo">
                    <a href="/MegaCityCab/admin/index.jsp">
                        <img src="/MegaCityCab/images/logo.png" alt="Mega City Cab Logo">
                    </a>
                </div>
            </div>
            <div class="section-divider"></div>
            <div class="aside-links">
                <a href="/MegaCityCab/admin/bookings.jsp">
                    <span class="icon"><i class="ri-taxi-fill"></i></span>
                    <h3>Bookings</h3>
                </a>
                <a href="/MegaCityCab/admin/inquiries.jsp">
                    <span class="icon"><i class="ri-booklet-fill"></i></span>
                    <h3>Inquiries</h3>
                </a>
                <a href="/MegaCityCab/admin/feedback.jsp">
                    <span class="icon"><i class="ri-feedback-fill"></i></span>
                    <h3>Feedback</h3>
                </a>
                <a href="/MegaCityCab/admin/customers.jsp">
                    <span class="icon"><i class="ri-group-fill"></i></span>
                    <h3>Customers</h3>
                </a>
                <a href="/MegaCityCab/admin/drivers.jsp">
                    <span class="icon"><i class="ri-group-fill"></i></span>
                    <h3>Drivers</h3>
                </a>
                <%
                    String staffRoleSidebar = (String) session.getAttribute("staffRole");
                        if ("Admin".equals(staffRoleSidebar)) {
                %>
                <a href="/MegaCityCab/admin/staff.jsp">
                    <span class="icon"><i class="ri-user-settings-line"></i></span>
                    <h3>Staff</h3>
                </a>
                <% }%>
            </div>
        </div>
        <a class="aside-logout" href="${pageContext.request.contextPath}/staff-logout">
            <span class="icon"><i class="ri-logout-box-fill"></i></span>
            <h3>Logout</h3>
        </a>

    </div>
</aside>