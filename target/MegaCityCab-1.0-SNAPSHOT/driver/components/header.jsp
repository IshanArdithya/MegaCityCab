<% String driverFirstName = (String) session.getAttribute("driver_firstName");%>

<div class="header">
    <div class="wrapper column">
        <div class="breadcrumb">
            <span>/</span>
            <a href="#"><%= pageTitle%></a>
        </div>
        <div class="page-title">
            <%= pageTitle%>
        </div>
    </div>
    <div class="wrapper">
        <div class="user-info">
            <h2>Hi, <%= driverFirstName != null ? driverFirstName : "Driver"%></h2>
            <small>Driver</small>
        </div>
        <div class="avatar">
            <img src="/MegaCityCab/images/person1.png" alt="Avatar">
        </div>
    </div>
</div>