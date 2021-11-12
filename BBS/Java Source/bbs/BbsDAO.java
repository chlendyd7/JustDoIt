package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {
	
	private Connection conn;
	//private PreparedStatement pstmt; 함수 마찰이 없도록 지워줌
	private ResultSet rs;
	
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID ="root";
			String dbPassword="1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
	
			
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() { //현재의 시간을 넣어줌
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 실행 대기상태
			rs = pstmt.executeQuery(); //실행시켰을 때 결과를 가져옴
			if(rs.next()) {
				return rs.getString(1); //현재의 날짜를 그대로 반환
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	
	}
	
	public int getNext() { 
		String SQL = "SELECT bbsID FROM BBS order by bbsID DESC"; //내림차순
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 실행 대기상태
			rs = pstmt.executeQuery(); //실행시켰을 때 결과를 가져옴
			if(rs.next()) {
				return rs.getInt(1) + 1; //다음 게시글 +1해서 계속 불러옴
			}
			return 1;//첫 번째 게시물
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES(?, ?, ?, ?, ?, ?)"; //내림차순
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // 실행 대기상태
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			
			//INSERT의 경우 executeQuery문이 필요 없다 rs = pstmt.executeQuery(); 
			return pstmt.executeUpdate();//실행시켰을 때 결과를 가져옴
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	
	}
	
}
