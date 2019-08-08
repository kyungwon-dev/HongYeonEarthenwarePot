<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String projectPath = request.getContextPath();
%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<!-- JSP에서 JDBC의 객체를 사용하기 위해 java.sql 패키지를 import 한다 -->
<%@ page import="Config.db" %>
<%
	Config.db db_con=new Config.db();

	Connection conn = null; // null로 초기화 한다.
	PreparedStatement pstmt = null;
	request.setCharacterEncoding("utf-8");  //Set encoding
	
	      
	Statement stmt = null;
	ResultSet rs = null;
	
	String no = request.getParameter("Input_no");
	String social_no =   request.getParameter("Input_jumin");
	String name =     request.getParameter("Input_name");
	String position  =   request.getParameter("Input_position");
	String phone_no = request.getParameter("Input_phone_no");
	String address = request.getParameter("Input_address");
	String hiredate = request.getParameter("Input_hiredate");
	
	
	try {
		conn = db_con.connect(); 
		stmt = db_con.stmt();
		String query2 = "SELECT * FROM employee";
		rs = stmt.executeQuery(query2);
		

		String sql = "insert into employee VALUES('"+no+"','"+social_no+"','"+name+"','"+position+"','"+phone_no+"','"+address+"','"+hiredate+"')"; // sql 쿼리
		pstmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리 컴파일한다.		
		pstmt.executeUpdate(); // 쿼리를 실행한다.
		out.println("member 테이블에 새로운 레코드를 추가했습니다."); // 성공시 메시지 출력
		response.sendRedirect("employee.jsp") ;

	} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('등록 양식이 잘못 되었습니다.')");
		script.println("history.back()");
		script.println("</script>");

	} finally { // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)
		if (pstmt != null)
	try {
		pstmt.close();
	} catch (SQLException sqle) {
	} // PreparedStatement 객체 해제

		if (conn != null)
	try {
		conn.close();
	} catch (SQLException sqle) {
	} // Connection 해제

	}
%>