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
	String buyer_name = request.getParameter("buyer_name");
	String buyer_phone = request.getParameter("buyer_phone");
	String buyer_address = request.getParameter("buyer_address");
	
	Connection con=db_con.connect();
	Statement stmt = null;
	String query = "UPDATE" + " buyplace " + "SET buyer_name='" + buyer_name +
	"' , buyer_phone='" + buyer_phone	+
	"' , buyer_address='" + buyer_address +
	"' WHERE buyer_name='" + buyer_name + "'";
	
	try{
  		stmt = db_con.stmt();
  		stmt.executeUpdate(query); //return 1.
  		stmt.close();
  	  	con.close();
  	  	response.sendRedirect("purchasePlace.jsp") ;
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