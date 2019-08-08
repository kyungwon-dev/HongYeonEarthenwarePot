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
	String seller_name = request.getParameter("seller_name");
	String seller_phone = request.getParameter("seller_phone");
	String seller_address = request.getParameter("seller_address");
	String Receivable = request.getParameter("Receivable");
	
	Connection con=db_con.connect();
	Statement stmt = null;
	String query = "UPDATE" + " sellplace " + "SET seller_name='" + seller_name +
	"' , seller_phone='" + seller_phone	+
	"' , seller_address='" + seller_address +
	"' , Receivable='" + Receivable +
	"' WHERE seller_name='" + seller_name + "'";
	
	try{
  		stmt = db_con.stmt();
  		stmt.executeUpdate(query); //return 1.
  		stmt.close();
  	  	con.close();
  	  	response.sendRedirect("salePlace.jsp") ;
	}catch(SQLException e){
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('수정이 불가능 합니다.')");
		//script.println("history.back()");
		script.println("</script>");
	}//"DELETE FROM "+ tableName + " where " + PrimaryAttr + "='" + primaryKey + "'"
	
	
  	stmt.close();
  	con.close();
%>