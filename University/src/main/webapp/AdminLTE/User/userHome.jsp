
<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="crud.User" %>
<%@ page import="pagecreate.pageUserDAO" %>
<%@ page import="pagecreate.pageUser" %>
<%@ page import="java.util.ArrayList" %>
<%
List<String> distinctUniNames = new pageUserDAO().getDistinctUniNames();

%>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>University Guide</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
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

         body {
            background-color: #8cb3d9;
            color: black;
        }

        .header {
            color: white;
        }

        .intro {
            margin-left: 5px;
        }

        p {
            text-indent: 15px;
        }

        .carousel-inner img {
            max-width: 100%;
            height: auto;
            margin: auto;
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
      <li class="nav-item d-none d-sm-inline-block">
        <a href="${pageContext.request.contextPath}/AdminLTE/User/userHome.jsp" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
      </li>
    </ul>
    
  </nav>
  <!-- /.navbar -->
  
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="../index3.html" class="brand-link">
      <img src="l.jpg" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">University Guide</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
     


<!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <li class="nav-item">
          <a href="three.jsp" class="nav-link">
              <i class="nav-icon fas fa-search"></i>
              <p>
                Search
               
              </p>
            </a>
            
          </li>
          <% for(String a : distinctUniNames){ %>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fas fa-university nav-icon"></i>
              <p>
                <%= a %>
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <%
        List<pageUser> userList = new pageUserDAO().getUserByName(a);
    %>
            <% for(pageUser user : userList) {%>
              <li class="nav-item">
                <a href="example1.jsp?id=<%= user.getId()%>" class="nav-link">
                 <i class="fas fa-map-marker-alt nav-icon"></i>
                 
                  <p><%= user.getLocation() %></p>
                </a>
              </li>
              <%} %>
            </ul>
          </li>
          <%} %>
          
            </ul>
          </li>
          </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <center>
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1 style="text-align:center">University Admissions Guide</h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        Welcome to our Website
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
    </center>
</div>
  <!-- /.content-wrapper -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
    </div>
    <strong>Copyright &copy; 2023-2024 <a href="https://adminlte.io">University Admissions Guide</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>

</body>
</html>