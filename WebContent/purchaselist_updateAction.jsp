<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="Config.db" %>
<%
	Config.db db_con=new Config.db();
	
	request.setCharacterEncoding("utf-8");
	String PrimaryAttr = request.getParameter("PrimaryAttr");
 	String primaryKey = request.getParameter("PrimaryKey");
	String tableName = request.getParameter("tablename");
	String tablePage= request.getParameter("tablepage");
	String buy_no = request.getParameter("buy_no");
	String buy_date = request.getParameter("buy_date");
	String product_no = request.getParameter("product_no");
	int buy_amount = Integer.parseInt(request.getParameter("buy_amount"));
	String buy_price = request.getParameter("buy_price");
	
	Connection con=db_con.connect();
	Statement stmt = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	String query = "UPDATE" + " buylist " + "SET buy_no='" + buy_no +
	"' , buy_date='" + buy_date	+
	"' , product_no='" + product_no +
	"' , buy_amount='" + buy_amount +
	"' , buy_price='" + buy_price +
	"' WHERE "+ 
	"buy_no='" + buy_no + "' and " +
	"buy_date='" + buy_date + "' and " +
	"product_no='" + product_no + "'" ;
	
	String StoreQuesry = "select buy_amount from buylist where product_no='"+product_no+"'";
	//System.out.println(query);
	try{
  		stmt = db_con.stmt();
  	  	
		pstmt=con.prepareStatement(StoreQuesry);
		rs = pstmt.executeQuery();
		rs.next();
		int product_stock = rs.getInt(1); 
		
		String sql = "select product_stock from product where product_no='"+product_no+"'";
		rs= pstmt.executeQuery(sql);
		rs.next();
		
		int store_stock = rs.getInt(1);
		store_stock -= product_stock;
		store_stock += buy_amount;
		System.out.println(product_stock);
		System.out.println(buy_amount);
		System.out.println(store_stock);
		
		
		String sql2 = "update product set product_stock='" + store_stock +"'"+ " where product_no='"+product_no+"'";
		stmt.executeUpdate(sql2); //return 1.
		
		stmt.executeUpdate(query); //return 1.
		response.sendRedirect("purchaselist.jsp") ; 
		
	}catch(SQLException e){
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('수정이 불가능 합니다.')");
		script.println("history.back()");
		script.println("</script>");
	}//"DELETE FROM "+ tableName + " where " + PrimaryAttr + "='" + primaryKey + "'"
	
	
  	stmt.close();
  	con.close();
%>