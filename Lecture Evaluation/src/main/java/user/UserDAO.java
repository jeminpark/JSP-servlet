package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {

	public int login(String userID, String userPassword) {	//아이디와 비밀번호를 받아서 로그인을 시도 하여 결과를 정수로
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();		//데이터베이스에서 조회할때 씀.
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;		//로그인성공
				}
				else {
					return 0;		//비밀번호 틀림
				}
				
			}
			return -1;				//아이디 없음
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
		return -2;					//데이터베이스 오류
	}
	public int join(UserDTO user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, false)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserEmailHash());
			
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
		return -1;	//회원가입 실패
	}
	
	//이메일 검증함수
	public boolean getUserEmailChecked(String userID) {
		String SQL = "SELECT userEmailChecked FROM USER WHERE userID = ?";		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getBoolean(1);
			}		
						
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
		return false;	//데이터베이스 오류
	}
	
	
	public String getUserEmail(String userID) {
		String SQL = "SELECT userEmail FROM USER WHERE userID = ?";		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();  
			
			if(rs.next()) {
				return rs.getString(1);
			}
			
						
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
		return null;	//데이터베이스 오류
	}
	
	public boolean setUserEmailChecked(String userID) {
		String SQL = "UPDATE USER SET userEmailChecked = true WHERE userID = ?";		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();   //한번 인증이 된 사용자라도 추가적으로 인증을 할수있도록 특정한 이메일 확인 링크 눌러서 이미 인증이된 사용자라도 다시 인증이 되도록.
			
			return true;
						
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
		return false;	//데이터베이스 오류
	}
}
