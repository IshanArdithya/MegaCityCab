<% String staffFirstName = (String) session.getAttribute("staffFirstName");%>

<div class="header">
    <div>
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
            <h2>Hi, <%= staffFirstName != null ? staffFirstName : "Staff"%></h2>
            <small>Admin</small>
        </div>
        <div class="avatar">
            <img src="https://avatar.iran.liara.run/public" alt="Avatar">
        </div>
    </div>
</div>