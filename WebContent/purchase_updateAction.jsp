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
	String buyer_name = request.getParameter("buyer_name");
	String emp_no = request.getParameter("emp_no");
	String buy_way = request.getParameter("buy_way");
	String buy_sum = request.getParameter("buy_sum");
	
	Connection con=db_con.connect();
	Statement stmt = null;
	String query = "UPDATE" + " buy " + "SET buy_no='" + buy_no +
	"' , buy_date='" + buy_date	+
	"' , buyer_name='" + buyer_name +
	"' , emp_no='" + emp_no +
	"' , buy_way='" + buy_way +
	"' , buy_sum='" + buy_sum +
	"' WHERE buy_no='" + buy_no + "'";
	
	try{
  		stmt = db_con.stmt();
  		stmt.executeUpdate(query); //return 1.
  		stmt.close();
  	  	con.close();
  	  	response.sendRedirect("purchase.jsp") ;
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