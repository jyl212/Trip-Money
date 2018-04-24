package fw;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//DB연동과 관련된 기능을 유틸리티처럼 제공하는 클래스 - static메소드로 구현
public class DBUtil {
	// 1. 드라이버로딩 - 클래스가 로딩될때 한 번 실행된다.
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// 2. DB서버와 연결해서 연결정보(Connection)를 리턴하는 메소드
	public static Connection getConnection() {
		// 실제로 커넥션을 만들어서 리턴하도록 구현
		Connection con = null;
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "trip";
		String password = "trip";
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	// 3. 자원반납메소드 - 각각의 자원을 반납할 수 있도록 메소드를 구현
	// => 한꺼번에 반납
	public static void close(ResultSet rs, Statement ptmt, Connection con) {
		try {
			if (rs != null)
				rs.close();
			if (ptmt != null)
				ptmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// ResultSet반납
	public static void close(ResultSet rs) {
		try {
			if (rs != null)rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// Statement반납
	public static void close(Statement stmt) {
		try {
			if (stmt != null)stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//Connection반납
	public static void close(Connection con) {
		try {
			if (con != null)con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}










