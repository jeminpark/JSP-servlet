package likey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class LikeyDAO {

	public int like(String userID, String evaluationID, String userIP) {
		String SQL = "INSERT INTO LIKEY VALUES (?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, evaluationID);
			pstmt.setString(3, userIP);			
			
			return pstmt.executeUpdate();  //insert update delete 할때 씀.				
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {		//자원을 해제해 주어야함.
			try {
				if(conn != null) conn.close();   //만약 커넥션 객체가 null값이 아니라면 커넥션객체를 닫아라.  try-catch문으로 감싸야함.
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();   
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) rs.close();   
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return -1;	//추천중복오류
	}
}
