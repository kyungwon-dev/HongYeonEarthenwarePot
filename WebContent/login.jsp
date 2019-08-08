<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String projectPath = request.getContextPath();
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
			<a class="navbar-brand" href="#">구매/판매 관리 시스템 웹 사이트</a>
		</div>
	</nav>
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">로그인 화면</div>
			<div class="card-body">
				<form method="post" action="loginAction.jsp">
					<div class="form-group">
						<label for="exampleInputEmail1">사용자 아이디</label> <input
							class="form-control" name="userID" type="text"
							placeholder="사용자 아이디">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">사용자 패스워드</label> <input
							class="form-control" name="userPassword" type="password"
							placeholder="사용자 패스워드">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="로그인">
				</form>
			</div>
		</div>
	</div>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/togi1.jpg" style="width: 100%;">
				</div>
				<div class="item">
					<img src="images/togi2.jpg" style="width: 100%;">
				</div>
				<div class="item">
					<img src="images/togi3.jpg" style="width: 100%;">
				</div>
				<div class="item">
					<img src="images/togi4.jpg" style="width: 100%;">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>
