package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {

	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	public JDBConnect() throws SQLException {
		try {
			Class.forName("oracle.jdbc.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id = "musthave";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);

			System.out.println("DB 연결 성공 (기본생성자)");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // jdbc 드라이버 로드
	}

	public JDBConnect(String driver, String url, String id, String pw) throws SQLException {
		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, id, pw);

			System.out.println("Db연결 성공(커스텀 생성자1)");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public JDBConnect(ServletContext application) throws SQLException {
		String driver = application.getInitParameter("OracleDriver");
		try {
			Class.forName(driver);

			String url = application.getInitParameter("OracleUrl");
			String id = application.getInitParameter("OracleId");
			String pw = application.getInitParameter("OraclePw");
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB연결 성공(커스텀생성자2)");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
