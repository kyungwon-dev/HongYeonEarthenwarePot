<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String projectPath = request.getContextPath();
%>
<%@ page import="java.sql.*"%>
<%@ page import="Config.db" %>
<%@ page import="java.io.PrintWriter" %>
<!-- JSP에서 JDBC의 객체를 사용하기 위해 java.sql 패키지를 import 한다 -->
<%
	Config.db db_con=new Config.db();

	Connection conn = null; // null로 초기화 한다.
	PreparedStatement pstmt = null;
	request.setCharacterEncoding("utf-8");  //Set encoding
	
	int no;       
	Statement stmt = null;
	Statement stmt2 = null;
	ResultSet rs = null;
	
	String sell_no_selldate=request.getParameter("sell_no+sell_date");
    int idx = sell_no_selldate.indexOf(","); 
    String str_sell_no = sell_no_selldate.substring(0, idx);
    int sell_no= Integer.parseInt(str_sell_no);
    String sell_date = sell_no_selldate.substring(idx+2);
	
	String product_no = request.getParameter("product_no");
	int sell_amount  = Integer.parseInt(request.getParameter("sell_amount"));
	String sell_price = request.getParameter("sell_price");
	
	try {
		
		stmt = db_con.stmt();
		conn=db_con.connect();
		String sql = "insert into selllist VALUES('"+sell_no+"','"+sell_date+"','"+product_no+"','"+sell_amount+"','"+sell_price+"')"; // sql 쿼리
	      pstmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리 컴파일한다.
	      pstmt.executeUpdate(); // 쿼리를 실행한다.
	      
	      out.println("member 테이블에 새로운 레코드를 추가했습니다."); // 성공시 메시지 출력
	      
	      sql = "select product_stock from product where product_no='"+product_no+"'";
	      rs = pstmt.executeQuery(sql);
	      
	      rs.next();
	      int product_stock = rs.getInt(1); 
	      product_stock -=sell_amount;
	      sql = "update product set product_stock='" + product_stock +"'"+"where product_no='"+product_no+"'";
	      pstmt.execute(sql);
	      
	      sql = "select SUM(sell_amount*sell_price) from selllist";
	      rs = stmt.executeQuery(sql);
	      rs.next();
	      int sum = rs.getInt(1);
	      sql = "UPDATE sell set sell_num ='"+sum+"' where sell_no='"+sell_no+"' and sell_date='"+sell_date+"'";
	      
	      pstmt.execute(sql);
	      

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
		response.sendRedirect("selllist.jsp") ;

	}
%>