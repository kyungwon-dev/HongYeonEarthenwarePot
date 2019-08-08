<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="Config.db" %>
<%
	Config.db db_con = new Config.db();
	final String projectPath = request.getContextPath(); //프로젝트 path 반환
	final String currentPath = projectPath+request.getServletPath();
	final String tableName="buyplace";
	final String PrimaryAttr = "buyer_name";
	final String tablepage = "purchasePlace.jsp";
	Connection conn = db_con.connect();
	String query=null;
	Statement stmt = null;
	ResultSet rs = null;
	int a = 10;
%>
<%
	response.setContentType("text/html;charset=UTF-8;");
	request.setCharacterEncoding("UTF-8"); //charset, Encoding 설정
	 // load the drive
%>
<!DOCTYPE html>
<html>
	<head>
 		<meta charset="utf-8">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  		<meta name="description" content="">
  		<meta name="author" content="">
  		<title>구매/판매 관리 시스템</title>
  		
  		<!-- Bootstrap core CSS-->
  		<link href="<%=projectPath%>/resources/sb_admin1/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
  		<!-- Custom fonts for this template-->
  		<link href="<%=projectPath%>/resources/sb_admin1/vendor/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
  		<link href="<%=projectPath%>/resources/sb_admin1/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  		<link href="<%=projectPath%>/resources/sb_admin1/css/sb-admin.css" rel="stylesheet">

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
					<i class="fa fa-table"></i> 구매처 관리
				</div>
				<nav class="navbar navbar-default">
					<form class="form-inline" role="form">
						<div class="modal-footer">
							<p>
								<a class="btn btn-secondary" data-target="#modal_enrol"
									data-toggle="modal">등록</a>
							</p>
						</div>
					</form>
				</nav>
				<%
					try {
						stmt = conn.createStatement();
						query = "SELECT * FROM buyplace";
						rs = stmt.executeQuery(query);
				%>
				<!--<form action="delete_do.jsp" method="post"> -->
				<form>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable">
								<thead>
									<tr>
										<th>구매처이름</th>
										<th>구매처연락처</th>
										<th>구매처주소</th>
										<th>삭제버튼</th>
										<th>변경버튼</th>
									</tr>
								</thead>
								<%
									while (rs.next()) { //rs 를 통해 테이블 객체들의 필드값을 넘겨볼 수 있다.
								%><tr>
									<td><%=rs.getString(1)%></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><a
										href="delete.jsp?num_key=1&PrimaryKey=<%=rs.getString(1)%>&tablename=<%=tableName%>&PrimaryAttr=<%=PrimaryAttr%>&tablepage=<%=tablepage%>">삭제</a>
									</td>
									<td><a
                                		href="purchasePlace_update.jsp?PrimaryKey=<%=URLEncoder.encode(rs.getString(1),"UTF-8")%>&tablename=<%=tableName%>&PrimaryAttr=<%=PrimaryAttr%>&tablepage=<%=tablepage%>">변경</a>
                                 	</td>
								</tr>
								<%
									} // end while
								%>
							</table>
						</div>
					</div>
				</form>
				<%
					rs.close(); // ResultSet exit
						stmt.close(); // Statement exit
						conn.close(); // Connection exit
					} catch (SQLException e) {
						out.println("err:" + e.toString());
					}
				%>
			</div>
		</div>
	</div>
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
			src="<%=projectPath%>/resources/sb_admin1/js/sb-admin-datatables.js"></script>
		<script
			src="<%=projectPath%>/resources/sb_admin1/js/sb-admin-charts.min.js"></script>
		<!--  등록 -->
	<div class="row">
		<div class="modal" id="modal_enrol" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						구매처 등록
						<button class="btn btn-primary" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<form method="post" action="purchasePlace_enroll.jsp">
							<div class="form-group">
								<label for="exampleInputEmail1">구매처이름</label> <input type="text"
									class="form-control" name="buyer_name" placeholder="구매처이름">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">구매처연락처</label> <input
									type="text" class="form-control" name="buyer_phone"
									placeholder="구매처연락처">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">구매처주소</label> <input type="text"
									class="form-control" name="buyer_address" placeholder="구매처주소">
							</div>
							
							<button type="submit" class="btn btn-default">등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
