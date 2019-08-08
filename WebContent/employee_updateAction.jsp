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
	String emp_no= request.getParameter("emp_no");
	String emp_social_no =   request.getParameter("emp_social_no");
	String emp_name =     request.getParameter("emp_name");
	String emp_position  =   request.getParameter("emp_position");
	String emp_phone_no = request.getParameter("emp_phone_no");
	String emp_address = request.getParameter("emp_address");
	String emp_hiredate = request.getParameter("emp_hiredate");
	
	Connection con=db_con.connect();
	Statement stmt = null;
	String query = "UPDATE" + " employee " + "SET emp_no='" + emp_no +
	"' , emp_social_no='" + emp_social_no	+
	"' , emp_name='" + emp_name +
	"' , emp_position='" + emp_position +
	"' , emp_phone_no='" + emp_phone_no +	
	"' , emp_address='" + emp_address +	
	"' , emp_hiredate='" + emp_hiredate +	
	"' WHERE emp_no='" + emp_no + "'";
	
	try{
  		stmt = db_con.stmt();
  		stmt.executeUpdate(query); //return 1.
  		stmt.close();
  	  	con.close();
  	  	response.sendRedirect("employee.jsp") ;
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