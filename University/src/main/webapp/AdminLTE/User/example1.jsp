
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="crud.User" %>
<%@ page import="pagecreate.pageUserDAO" %>
<%@ page import="pagecreate.pageUser" %>
<%@ page import="java.util.ArrayList" %>

<%
    // Get distinct university names
    List<String> distinctUniNames = new pageUserDAO().getDistinctUniNames();
%>
<%
int userId = Integer.parseInt(request.getParameter("id"));
pageUser user1 = new pageUserDAO().getUserById(userId);
String[] paragraphArray = user1.getDesc().split("\\n");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>University Guide</title>
  <!-- External CSS -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
  
  <!-- Internal CSS -->
  <style>
    .color-ful {
      display: flex;
      flex-direction: column;
      justify-content: start;
      align-items: start;
      max-width: 900px;
      margin: 0px auto;
      padding: 20px;
      background-color: #FFFFFF; /* Change this to the desired color */
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
  
    .name {
      color: #FFFFFF;
    }
    h1 {
      font-size: 24px;
      margin: 30px 0;
    }
    p {
      text-align: justify;
      line-height: 1.6;
      margin-bottom: 20px;
    }
    .my-img {
      width: 100%;
      height: 450px;
      object-fit: cover;
      border-radius: 10px;
    }
    .logo {
      width: 65px;
      height: 65px;
      border-radius: 50%;
      line-height: 45px;
    }
    .container {
      background-color: #36384E;
      padding: 15px;
      color: white;
    }
    .container p {
      text-align: center;
    }
    .main-footer {
      background-color: #198057;
      color: #FFFFFF;
    }
    .form-control::placeholder {
      font-size: 0.95rem;
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
    .content-wrapper {
    background-color: #FCFCFC;
}
  .two{
    width: 50px;
    height : 50px;
    border-radius: 50%;}
  </style>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="${pageContext.request.contextPath}/AdminLTE/User/userHome.jsp" class="nav-link">Home</a>
      </li>
    
    </ul>
  </nav>
  
  <!-- Sidebar -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="../index3.html" class="brand-link">
      <img src="l.jpg" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">University Guide</span>
    </a>
    <div class="sidebar">
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
       
        <div class="info">
          <a href="#" class="d-block">University Guide</a>
        </div>
      </div>
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
          <!-- Iterate over distinct university names -->
          <% for(String uniName : distinctUniNames) { %>
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="fas fa-university nav-icon"></i>
                <p><%= uniName %><i class="right fas fa-angle-left"></i></p>
              </a>
              <ul class="nav nav-treeview">
                <!-- Retrieve user list for each university -->
                <% List<pageUser> userList = new pageUserDAO().getUserByName(uniName); %>
                <% for(pageUser user : userList) { %>
                  <li class="nav-item">
                    <a href="example1.jsp?id=<%= user.getId() %>" class="nav-link">
                      <i class="fas fa-map-marker-alt nav-icon"></i>
                      <p><%= user.getLocation() %></p>
                    </a>
                  </li>
                <% } %>
              </ul>
            </li>
          <% } %>
          
        </ul>
      </nav>
    </div>
  </aside>
  
  <!-- Content Wrapper -->
  <div class="content-wrapper">
    <div class="color-ful">
      <img class="my-img" src="../../img/<%= user1.getImage() %>" alt="">
      <h1><img class="two" src="../../img/<%= user1.getLogo() %>" alt=""><%= user1.getLocation() %><%= user1.getUniname() %></h1>
      <% 
        // Iterate over paragraph array
        for (String paragraph : paragraphArray) {
      %>
        <p><%= paragraph %></p>
      <%
        }
      %>
    </div>
  </div>
  
  <!-- Main Footer -->
  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      
    </div>
    <strong>Copyright &copy; 2023-2024 <a href="https://adminlte.io">University Admissions Guide</a>.</strong> All rights reserved.
  </footer>
  
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark"></aside>
</div>

<!-- Scripts -->
<script src="../plugins/jquery/jquery.min.js"></script>
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../dist/js/adminlte.min.js"></script>
<script src="../dist/js/demo.js"></script>
</body>
</html>