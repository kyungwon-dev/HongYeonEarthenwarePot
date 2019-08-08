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
	String sell_no = request.getParameter("sell_no");
	String sell_date = request.getParameter("sell_date");
	String seller_name = request.getParameter("seller_name");
	String emp_no = request.getParameter("emp_no");
	String sell_way = request.getParameter("sell_way");
	String sell_num = request.getParameter("sell_num");
	String Receivable_ = request.getParameter("Receivable_");
	
	Connection con=db_con.connect();
	Statement stmt = null;
	String query = "UPDATE" + " sell " + "SET sell_no='" + sell_no +
	"' , sell_date='" + sell_date	+
	"' , seller_name='" + seller_name +
	"' , emp_no='" + emp_no +
	"' , sell_way='" + sell_way +
	"' , sell_num='" + sell_num +
	"' , Receivable_='" + Receivable_ +
	"' WHERE sell_no='" + sell_no + "'";
	
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