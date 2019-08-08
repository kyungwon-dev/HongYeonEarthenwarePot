<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Config.db" %>
<%@ page import="java.io.PrintWriter" %>
<%
	Config.db db_con=new Config.db();
	final String projectPath = request.getContextPath(); //프로젝트 path 반환
	final String currentPath = projectPath + request.getServletPath();
	final String tableName = "employee";
	final String PrimaryAttr = "emp_no";
	final String tablepage = "employee.jsp";
	String date=request.getParameter("date");
	
    
	String query = null;
	Connection conn = db_con.connect();
	Statement stmt = null;
	ResultSet rs = null;
	int a = 10;
	int total=0;
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
					<i class="fa fa-table"></i> 월별 결산
				</div>
				<nav class="navbar navbar-default">
					<form class="form-inline" role="form">
						<div class="modal-footer">
							
						</div>
					</form>
				</nav>

				<%
				 Statement stmt2 = null;
	               ResultSet rs2 = null;
	               String query2 = null;

					try {
						stmt = conn.createStatement();
						query = "SELECT * FROM selllist where Date(sell_date) BETWEEN '"+date+"-01'"+" AND "+"'"+date+"-31'";
						//DATE(us_reg_date) BETWEEN '2000-07-05' AND '2011-11-10'
						System.out.println(query);
						rs = stmt.executeQuery(query);
				%>
				<!--<form action="delete_do.jsp" method="post"> -->
				<form>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable">
								<thead>
									<tr>
										<th>판매번호</th>
										<th>판매날짜</th>
										<th>상품번호</th>
										<th>판매수량</th>
										<th>판매가</th>
										<th>총합</th>
									</tr>
								</thead>
								<%
									while (rs.next()) { //rs 를 통해 테이블 객체들의 필드값을 넘겨볼 수 있다.
										query2 = "select sell_num from sell where sell_date='"+ rs.getString(2) +"'";
			                              rs2 = stmt.executeQuery(query);
								%><tr>
									<td><%=rs.getString(1)%></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(4)%></td>
									<td><%=rs.getString(5)%></td>
									<td>rs2.getInt(1)</td>
								</tr>
								<% total+=Integer.parseInt(rs.getString(4))*Integer.parseInt(rs.getString(5));
									} // end while
								%>
								<tfoot>
								 <th>판매 합계</th>
								 <td><%=total%></td>
								</tfoot>
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
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('YYYY-MM 형식으로 입력해주세요')");
						//script.println("history.back()");
						script.println("</script>");
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
				<small>Copyright ©오경원</small>
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
	
</body>

</html>
