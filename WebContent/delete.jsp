<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="Config.db" %>
<%
	db db_con = new db();
	
	request.setCharacterEncoding("utf-8");
	String PrimaryAttr = request.getParameter("PrimaryAttr");
 	String primaryKey = request.getParameter("PrimaryKey");
	String tableName = request.getParameter("tablename");
	String tablePage= request.getParameter("tablepage");
	String num_key=request.getParameter("num_key");
	String query;
	query= "DELETE FROM "+ tableName + " where " + PrimaryAttr + "= '" + primaryKey + "' ";
	//System.out.println(query);
	//System.out.println(num_key);
	if(num_key.equals("2")){
		String PrimaryAttr2 = request.getParameter("PrimaryAttr2");
		String primaryKey2 = request.getParameter("PrimaryKey2");
		query = "DELETE FROM "+ tableName + " where " + PrimaryAttr + " = '" + primaryKey + "' and " 
				+ PrimaryAttr2 + " = '" + primaryKey2 + "'" ;
		//System.out.println(query);
	}
	else if(num_key.equals("3")){
		String PrimaryAttr2 = request.getParameter("PrimaryAttr2");
		String PrimaryAttr3 = request.getParameter("PrimaryAttr3");
		String primaryKey2 = request.getParameter("PrimaryKey2");
		String primaryKey3 = request.getParameter("PrimaryKey3");
		query = "DELETE FROM "+ tableName + " where " + PrimaryAttr + " = '" + primaryKey + "' and "
				+ PrimaryAttr2 + " = '" + primaryKey2 + "' and " 
				+ PrimaryAttr3 + " = '" + primaryKey3 + "'";
	}
	Connection con=db_con.connect();;
	Statement stmt = null;
	
	
	try{
  		stmt = db_con.stmt();
  		stmt.executeUpdate(query); //return 1.
  		stmt.close();
  	  	con.close();
  	  	response.sendRedirect(tablePage) ;
	}catch(SQLException e){
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('하위 내용을 먼저 삭제해주세요.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
  	stmt.close();
  	con.close();
 %>