<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="crud.User" %>
<%@ page import="crud.UserDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
    HttpSession aa = request.getSession();
    if(aa.getAttribute("name") == null){
        response.sendRedirect("login.jsp");
    } 
%>

<%
    String searchQuery = request.getParameter("search");
    List<User> userList;
    if (searchQuery != null && !searchQuery.isEmpty()) {
        userList = new UserDAO().searchUsers(searchQuery);
    } else {
        userList = new UserDAO().getAllUsers();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>University Guide</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../dist/css/adminlte.min.css">
</head>
<style>
    .main-footer {
        background-color: #198057;
        color: #FFFFFF;
    }

    .form-control::placeholder {
        font-size: 0.95rem; /* Change this value to your desired font size */
    }

    [class*=sidebar-dark-] {
        background-color: #568a54;
    }

    [class*=sidebar-dark-] .sidebar a {
        color: #FFFFFF;
    }

    .content-wrapper {
        background-color: white;
    }

    .card-header {
        background-color: #229985;
    }

    .card-title {
        color: white;
    }
</style>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                    <i class="fas fa-search"></i>
                </a>
                <div class="navbar-search-block">
                    <form class="form-inline" method="get" action="">
                        <div class="input-group input-group-sm">
                            <input class="form-control form-control-navbar" name="search" type="search" placeholder="Search" aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn btn-navbar" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </li>
        </ul>
    </nav>
    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="index3.html" class="brand-link">
            <img src="l.jpg" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
            <span class="brand-text font-weight-light">University Guide</span>
        </a>
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="lull.jpg" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">Admin</a>
                </div>
            </div>
            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>Pages<i class="right fas fa-angle-left"></i></p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/AdminLTE/PageCreate/home.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>pageCreate</p>
                                </a>
                            </li>
                        </ul>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/AdminLTE/User/userHome.jsp" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>User</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="../loginAndregister/logout.jsp" class="nav-link">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>Logout</p>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0"></h1>
                    </div>
                    <br>
                </div>
            </div>
        </div>
        <!-- /.content-header -->
        <!-- Main content -->
        <div class="content">
            <% if (userList.isEmpty()) { %>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="alert alert-info text-center" role="alert">
                        ပြသရန်မရှိပါ
                        <a href="${pageContext.request.contextPath}/AdminLTE/PageCreate/add.jsp" class="nav-link">Create</a>
                    </div>
                </div>
            </div>
            <% } else { %>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">တက္ကသိုလ်ဝင်ခွင့်အမှတ်များ</h3>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="width: 20px">အမှတ်စဉ်</th>
                                        <th>တက္ကသိုလ် အမည်</th>
                                        <th>တည်နေရာ</th>
                                        <th>ဝင်ခွင့်အမှတ်</th>
                                        <th>Link</th>
                                        <th style="width: 40px">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (User user : userList) { %>
                                    <tr>
                                        <td><%= user.getId() %></td>
                                        <td><%= user.getUniname() %></td>
                                        <td><%= user.getLocation() %></td>
                                        <td><%= user.getMark() %></td>
                                        <td><%= user.getLink() %></td>
                                        <td><a href="edit.jsp?id=<%= user.getId() %>">Edit</a></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                            <br>
                        </div>
                        <!-- /.card-body -->
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
        <div class="p-3">
            <h5>Title</h5>
            <p>Sidebar content</p>
        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="float-right d-none d-sm-inline">
            
        </div>
        <!-- Default to the left -->
    <strong>Copyright &copy; 2023-2024 <a href="https://adminlte.io">University Admissions Guide</a>.</strong> All rights reserved.
    </footer>
</div>
<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>
</body>
</html>