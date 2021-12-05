package mypage;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberDAO {
	public static int modifyPass(String id, String name, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		System.out.println(id+ name+ pass);
		try{
			con = getConnection();
			
			
			String sql="UPDATE test SET name=?, pass=? WHERE id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, pass);
			pstmt.setString(3, id);
			
			rows = pstmt.executeUpdate();
			System.out.println(rows);
			
			
			} catch(Exception e){
				System.out.println("메소드 오류" + e.toString());
			} finally{
				if(pstmt!=null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				if(con!=null)
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		
		return rows;
	}



	private static Connection getConnection() {
		
		Connection conn = null;
		try {
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();
		}catch (Exception e){
			e.printStackTrace();
		}
		return conn;
	}

	
}
