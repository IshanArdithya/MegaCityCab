<% String staffFirstName = (String) session.getAttribute("staffFirstName");%>
<% String staffRole = (String) session.getAttribute("staffRole");%>

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
            <h2>Hi, <%= staffFirstName != null ? staffFirstName : "Staff"%></h2>
            <small><%= staffRole != null ? staffRole : ""%></small>
        </div>
        <div class="avatar">
            <img src="https://avatar.iran.liara.run/public" alt="Avatar">
        </div>
    </div>
</div>