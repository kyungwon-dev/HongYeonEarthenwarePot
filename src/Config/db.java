package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class db {
	public Connection conn;
	public Statement stmt;
	
	String dbURL;
	String dbID;
	String dbPassword;
	String update_key;
	
	public db() {
		try {
			dbURL="jdbc:mysql://localhost:3306/db";
			dbID="root";
			dbPassword="dhruddnjs";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public Connection connect() {
		return conn;
	}
	public Statement stmt() throws SQLException {
		stmt=conn.createStatement();
		return stmt;
	}
	
	public void update(String str) {
		update_key=str;
	}
	public String update_return() {
		return update_key;
	}
}



