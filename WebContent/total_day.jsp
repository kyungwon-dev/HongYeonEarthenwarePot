<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Config.db" %>
<%
	Config.db db_con=new Config.db();
	final String projectPath = request.getContextPath(); //프로젝트 path 반환
	final String currentPath = projectPath + request.getServletPath();
	final String tableName = "employee";
	final String PrimaryAttr = "emp_no";
	final String tablepage = "employee.jsp";
	String query = null;
	Connection conn = db_con.connect();
	Statement stmt = null;
	ResultSet rs = null;
	int a = 10;
%>
<%@ page import="java.sql.*"%>
<!-- JSP에서 JDBC의 객체를 사용하기 위해 java.sql 패키지를 import 한다 -->

<%-- 프로젝트 path 반환--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>구매/판매 관리 시스템</title>
<!-- Bootstrap core CSS-->
<link
	href="<%=projectPath%>/resources/sb_admin1/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link
	href="<%=projectPath%>/resources/sb_admin1/vendor/font-awesome/css/font-awesome.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link
	href="<%=projectPath%>/resources/sb_admin1/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<%=projectPath%>/resources/sb_admin1/css/sb-admin.css"
	rel="stylesheet">
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="main.jsp">구매/판매</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard"><a class="nav-link" href="main.jsp"> <i
						class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text">메인</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Example Pages"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseExamplePages" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa-file"></i> <span class="nav-link-text">메뉴</span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseExamplePages">
						<li><a href="product.jsp">상품 관리</a></li>
						<li><a href="employee.jsp">직원 관리</a></li>
						<li><a href="purchasePlace.jsp">구매처 관리</a></li>
						<li><a href="salePlace.jsp">판매처 관리</a></li>
						<li><a href="purchaselist.jsp">구매내역 관리</a></li>
						<li><a href="selllist.jsp">판매내역 관리</a></li>
						<li><a href="purchase.jsp">구매 관리</a></li>
						<li><a href="sale.jsp">판매 관리</a></li>
						<li class="nav-item" data-toggle="tooltip" data-placement="right"
							title="Example Pages2"><a
							class="nav-link nav-link-collapse collapsed"
							data-toggle="collapse" href="#collapseExamplePages2"
							data-parent="#exampleAccordion2"> <i class="fa fa-fw fa-file"></i>
								<span class="nav-link-text">결산 관리</span>
						</a>
							<ul class="sidenav-second-level collapse"
								id="collapseExamplePages2">
								<li><a href="total_day.jsp">일별 결산 관리</a></li>
								<li><a href="total_month.jsp">월별 결산 관리</a></li>
							</ul>
						</li>
					</ul></li>
			</ul>
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"></li>
				<li class="nav-item dropdown"></li>

				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#exampleModal"> <i class="fa fa-fw fa-sign-out"></i>로그아웃
				</a></li>
			</ul>
		</div>
	</nav>
	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="main.jsp">구매/판매</a></li>
				<li class="breadcrumb-item active">메뉴</li>
			</ol>
			<!-- Example DataTables Card-->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fa fa-table"></i> 일별 결산
				</div>
				
<script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>


<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
<div class="bootstrap-iso">
 <div class="container-fluid">
  <div class="row">
   <div class="col-md-6 col-sm-6 col-xs-12">
    <form action="total_day_search.jsp" class="form-horizontal" method="post">
     <div class="form-group ">
      <label class="control-label col-sm-2 requiredField" for="date">
       Date
       <span class="asteriskField">
        *
       </span>
      </label>
      <div class="col-sm-10">
       <div class="input-group">
        <div class="input-group-addon">
         <i class="fa fa-calendar">
         </i>
        </div>
        <input class="form-control" id="date" name="date" placeholder="YYYY-MM-DD" type="text"/>
       </div>
      </div>
     </div>
     <div class="form-group">
      <div class="col-sm-10 col-sm-offset-2">
       <input name="_honey" style="display:none" type="text"/>
       <button class="btn btn-primary " name="submit" type="submit">
        Submit
       </button>
      </div>
     </div>
    </form>
   </div>
  </div>
 </div>
</div>


<!-- Extra JavaScript/CSS added manually in "Settings" tab -->
<!-- Include jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Include Date Range Picker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<script>
	$(document).ready(function(){
		var date_input=$('input[name="date"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			format: 'yyyy-mm-dd',
			container: container,
			todayHighlight: true,
			autoclose: true,
		})
	})
</script>
				
	<!-- /.container-fluid-->
	<!-- /.content-wrapper-->
	<footer class="sticky-footer">
		<div class="container">
			<div class="text-center">
				<small>Copyright © 오경원</small>
			</div>
		</div>
	</footer>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fa fa-angle-up"></i>
	</a>
	<!-- Logout Modal-->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
					<a class="btn btn-primary" href="login.jsp">로그아웃</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script
		src="<%=projectPath%>/resources/sb_admin1/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=projectPath%>/resources/sb_admin1/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="<%=projectPath%>/resources/sb_admin1/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Page level plugin JavaScript-->
	<script
		src="<%=projectPath%>/resources/sb_admin1/vendor/chart.js/Chart.min.js"></script>
	<script
		src="<%=projectPath%>/resources/sb_admin1/vendor/datatables/jquery.dataTables.js"></script>
	<script
		src="<%=projectPath%>/resources/sb_admin1/vendor/datatables/dataTables.bootstrap4.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="<%=projectPath%>/resources/sb_admin1/js/sb-admin.min.js"></script>
	<!-- Custom scripts for this page-->
	<script
		src="<%=projectPath%>/resources/sb_admin1/js/sb-admin-datatables.min.js"></script>
	<script
		src="<%=projectPath%>/resources/sb_admin1/js/sb-admin-charts.min.js"></script>
	<!--  jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
	
</body>

</html>
