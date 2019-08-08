<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Config.db"%>
<%
	Config.db db_con= new Config.db();
	Connection conn=null;
	Statement stmt=null;
	
	ResultSet rs=null;
	final String projectPath = request.getContextPath(); //프로젝트 path 반환
	String primaryAttr = request.getParameter("PrimaryAttr");
	String primaryKey = request.getParameter("PrimaryKey");
	String tableName = request.getParameter("tablename");
	String tablePage = request.getParameter("tablepage");
	String query2 = "Select * FROM " + tableName + " Where " + primaryAttr + " ='" + primaryKey + "'";
%>

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
<title>구매/판매 관리 시스템 웹 사이트</title>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">구매/판매 관리 시스템 웹 사이트 - 변경</a>
		</div>
	</nav>
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">변경 화면</div>
			<div class="card-body">
				<form method="post" action="employee_updateAction.jsp">
				<%
				try {
					stmt = db_con.stmt();
					rs = stmt.executeQuery(query2);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				rs.next();
				%>
					<div class="form-group">
						<input type = "hidden"
							class="form-control" name="emp_no" type="text"
							value=<%=rs.getString(1)%>>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">주민번호</label> <input
							class="form-control" name="emp_social_no" type="text"
							value=<%=rs.getString(2)%>>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">이름</label> <input
							class="form-control" name="emp_name" type="text"
							value=<%=rs.getString(3)%>>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">직책</label> <input
							class="form-control" name="emp_position" type="text"
							value=<%=rs.getString(4)%>>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">전화번호</label> <input
							class="form-control" name="emp_phone_no" type="text"
							value=<%=rs.getString(5)%>>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">주소</label> <input
							class="form-control" name="emp_address" type="text"
							value=<%=rs.getString(6)%>>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">고용일</label> <input
							class="form-control" name="emp_hiredate" type="text"
							value=<%=rs.getString(7)%>>
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="변경">
				</form>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</body>
</html>

