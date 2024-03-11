<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="crud.User" %>
<%@ page import="crud.UserDAO" %>
<%@ page import="pagecreate.pageUserDAO" %>
<%@ page import="pagecreate.pageUser" %>
<%@ page import="java.util.ArrayList" %>

<%
List<String> distinctUniNames = new pageUserDAO().getDistinctUniNames();

String unisearchQuery = request.getParameter("unisearch");
String lsearchQuery = request.getParameter("lsearch");
String msearchQuery = request.getParameter("msearch");
List<User> userList;

if (msearchQuery != null && msearchQuery.isEmpty()) {
    userList = new UserDAO().searchUniNameAndLocation(unisearchQuery, lsearchQuery);// not include mark
} else if (unisearchQuery != null && unisearchQuery.isEmpty()) {
    userList = new UserDAO().searchLocationAndMark(lsearchQuery, msearchQuery);// not include  uniname
} else if (msearchQuery != null && !msearchQuery.isEmpty() && lsearchQuery != null && !lsearchQuery.isEmpty() && unisearchQuery != null && !unisearchQuery.isEmpty()) {
    userList = new UserDAO().searchAnd(unisearchQuery, lsearchQuery, msearchQuery);// include all
} else if (lsearchQuery != null && lsearchQuery.isEmpty()) {
    userList = new UserDAO().searchUniNameAndMark(unisearchQuery, msearchQuery);
} else {
    userList = new UserDAO().getAllUsers();
}
%>

<%
for(User a: userList){System.out.println("" +a.getUniname());}%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Search</title>

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
      <span class="brand-text font-weight-light"> University Guide</span>
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
				List<pageUser> userdata = new pageUserDAO().getUserByName(a);
		%>
            <% for(pageUser user : userdata) {%>
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
    <!-- Main content -->
    <br> <br> <br>
    <section class="content">
        <div class="container-fluid">
          
            <form action="" class="search" method="get">
                <div class="row">
                    <div class="col-md-10  offset-md-1">
                        <div class="row">
                            <div class="col-6">
                                
                            </div>
                            <div class="col-3">
                                
                            </div>
                            <div class="col-3">
                                
                            </div>
                        </div>
                        <div class="form-group d-flex justify-content-between">
                            <div class="input-group input-group-lg">
                                <input type="search" class="form-control form-control-lg" name="unisearch" placeholder="တက္ကသိုလ်အမည်ရိုက်ထည့်ရန်" value="">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-lg btn-default">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <div class="input-group input-group-lg">
                                <input type="search" class="form-control form-control-lg" name="lsearch" placeholder="တည်နေရာရိုက်ထည့်ရန် " value="">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-lg btn-default">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <div class="input-group input-group-lg">
                                <input type="search" class="form-control form-control-lg" name="msearch" placeholder="အမှတ်ရိုက်ထည့်ရန်" value="">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-lg btn-default">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <br>
        <br>
        
        <br>
        <div class="content">
            <% if(userList.isEmpty()){ %>
            <div class="row justify-content-center mt-5"> <!-- Added mt-5 class for top margin -->
                <div class="col-md-6">
                    <div class="alert alert-info text-center" role="alert">
                        ပြသရန်မရှိပါ
                    </div>
                </div>
            </div>
            <%}else{ %>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">ဝင်ခွင့်တက္ကသိုလ်အမှတ်ပြဇယား</h3>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped ">
                                <thead>
                                    <tr>
                                        <th>တက္ကသိုလ် အမည်</th>
                                        <th>တည်နေရာ</th>
                                        <th>ဝင်ခွင့်အမှတ်</th>
                                        <th>Link</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (User user : userList) { %>
                                    <tr>
                                        <td><%= user.getUniname() %></td>
                                        <td><%= user.getLocation() %></td>
                                        <td><%= user.getMark() %></td>
                                        <td>
                                            <a href="example.jsp?id=<%= user.getLink() %>">Go to page</a>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </section>
</div>
<footer class="main-footer">
    <div class="float-right d-none d-sm-block">
       
    </div>
    <strong>Copyright &copy; 2023-2024 <a href="https://adminlte.io">University Admissions Guide</a>.</strong> All rights reserved.
</footer>
<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
</aside>
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