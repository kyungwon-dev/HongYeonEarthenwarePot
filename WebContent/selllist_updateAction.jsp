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
	String product_no = request.getParameter("product_no");
	int sell_amount = Integer.parseInt(request.getParameter("sell_amount"));
	int sell_price =Integer.parseInt(request.getParameter("sell_price"));
	
	Connection con=db_con.connect();
	Statement stmt = null;
	String query = "UPDATE" + " selllist " + "SET " + 
	"sell_amount='" + sell_amount +
	"' , sell_price='" + sell_price +
	"' WHERE sell_no='" + sell_no + "' and " +
	"sell_date ='" + sell_date	+ "' and " +
	"product_no ='" + product_no + "'";
	
	System.out.println(query);
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	try{
  		stmt = db_con.stmt();
  		stmt.executeUpdate(query); //return 1.
  				
  		query = "select SUM(sell_amount*sell_price) from selllist";
	      rs = stmt.executeQuery(query);
	      rs.next();
	      int sum = rs.getInt(1);
	      query = "UPDATE sell set sell_num ='"+sum+"' where sell_no='"+sell_no+"' and sell_date='"+sell_date+"'";
	      pstmt.execute(query);
  		stmt.close();
  	  	con.close();
  	  	response.sendRedirect("selllist.jsp") ;
	}catch(SQLException e){
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('양식이 잘못 입력됬습니다.')");
		//script.println("history.back()");
		script.println("</script>");
	}//"DELETE FROM "+ tableName + " where " + PrimaryAttr + "='" + primaryKey + "'"
	
	
  	stmt.close();
  	con.close();
%>