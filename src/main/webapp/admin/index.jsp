<%-- 
    Document   : index
    Created on : Mar 8, 2025, 8:08:17 PM
    Author     : IshanPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin | Mega City Cab</title>

        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
            rel="stylesheet"
            />

        <link rel="stylesheet" href="../css/admindashboard.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </head>

    <body>

        <div class="container">
            <aside>
                <div class="sidebar">
                    <div class="toggle">
                        <div class="logo">
                            <h2>Mega City<span class="danger"> Cab</span></h2>
                        </div>
                    </div>
                    <div class="section-divider"></div>
                    <a href="admin">
                        <span class="icon"><i class="ri-user-fill"></i></span>
                        <h3>Dashboard</h3>
                    </a>
                    <a href="admin">
                        <span class="icon"><i class="ri-home-fill"></i></span>
                        <h3>Home</h3>
                    </a>
                    <a href="admin">
                        <span class="icon"><i class="ri-home-fill"></i></span>
                        <h3>Bookings</h3>
                    </a>
                    <a href="admin">
                        <span class="icon"><i class="ri-home-fill"></i></span>
                        <h3>Customers</h3>
                    </a>
                    <a href="manage">
                        <span class="icon"><i class="ri-home-fill"></i></span>
                        <h3>Manage</h3>
                    </a>
                    <a href="admin">
                        <span class="icon"><i class="ri-logout-box-fill"></i></span>
                        <h3>Logout</h3>
                    </a>
                </div>
            </aside>

            <main>
                <div class="header">
                    <div>
                        <div class="breadcrumb">
                            <span>/</span>
                            <a href="#">Index</a>
                        </div>
                        <div class="page-title">
                            Index Page
                        </div>
                    </div>
                    <div class="wrapper">
                        <div class="user-info">
                            <h2>Hi, Admin</h2>
                            <small>Admin</small>
                        </div>
                        <div class="avatar">
                            <img src="https://avatar.iran.liara.run/public" alt="Avatar">
                        </div>
                    </div>
                </div>


                <div class="recents">
                    <h2>Pending Reservations</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Reservation ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>No. of People</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Preferences</th>
                                <th>Note</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>

            </main>
        </div>
    </body>
</html>
