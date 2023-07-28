package com.test.test1.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.test.test1.dto.MemberDTO;

// DAO = ( Data Access Object ) Repository Class
public class MemberDAO {
	Connection con = null; // DB 접속 관련 처리를 위한 객체
	PreparedStatement pstmt = null; // 쿼리문 전송 관련 처리를 위한 객체
	ResultSet rs = null; // select 결과를 담기 위한 객체

	// DB에 접속하기 위한 메서드. Repository 클래스의 모든 메서드가 시작전에 이 메서드를 호출해야 DB 작업 수행 가능.
	public Connection getConnection() throws Exception {
		// 이 메서드의 내용은 보통 평가지에서 제시함. (사용자 계정만 잘 구분하면 됨.)

		// 클래스를 로드 하는 역할(매개변수로 넘기는 클래스가 가지고 있는 필드, 메서드 종류, 클래스 이름 등을 JVM에 할당)
		// 인스턴스 생성 및 초기화를 해줌.
		// 컴파일 시점이 아니라 런타임 시점에 로딩을 할 수 있게 해줌.(DI랑 비슷한 역할)
		Class.forName("oracle.jdbc.OracleDriver"); // 사용할 DB 드라이버 로드
		// 접속할 DB 주소, 사용자 계정, 비밀번호
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "user1", "1234");
		return con;
	}
	
	public List<MemberDTO> findMember(String searchType, String idValue, String deptValue) throws Exception {
		con = getConnection();
		String sql = "";
		List<MemberDTO> findResult = new ArrayList<>();
		if(searchType.equals("id")) {
			sql = "SELECT * FROM PERSONNEL WHERE ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idValue);	
		}else if(searchType.equals("dept")) {
			sql = "SELECT * FROM PERSONNEL WHERE DEPT=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, deptValue);		
		}
		rs = pstmt.executeQuery(); // select 쿼리 수행할 때만 executeQuery() 호출
		while (rs.next()) {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(rs.getString(1));
			memberDTO.setName(rs.getString(2));
			memberDTO.setDept(rs.getString(3));
			memberDTO.setPosition(rs.getString(4));
			memberDTO.setDuty(rs.getString(5));
			memberDTO.setPhone(rs.getString(6));
			findResult.add(memberDTO);
		}
		return findResult;
	}
	
	public int saveMember(String name, String id, String dept, String duty, String position, String phone) throws Exception {
		con = getConnection();
		String sql = "INSERT INTO PERSONNEL(name,id,dept,duty,position,phone) VALUES(?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		pstmt.setString(3, dept);
		pstmt.setString(4, duty);
		pstmt.setString(5, position);
		pstmt.setString(6, phone);
		int result = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return result;
	}
	public boolean findMember(String id) throws Exception {
	    con = getConnection();
	    String sql = "SELECT * FROM PERSONNEL WHERE ID=?";
	    pstmt = con.prepareStatement(sql);
	    pstmt.setString(1, id);
	    rs = pstmt.executeQuery();
	    if(rs.next()) {
	        pstmt.close();
	        con.close();
	    	return true;
	    }else {
	        pstmt.close();
	        con.close();
	    	return false;
	    }
	}
	public void updateMember(String name, String id, String dept, String duty, String position, String phone) throws Exception {
	    con = getConnection();
	    String sql = "UPDATE PERSONNEL SET name=?, dept=?, duty=?, position=?, phone=? WHERE id=?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, name);
	        pstmt.setString(2, dept);
	        pstmt.setString(3, duty);
	        pstmt.setString(4, position);
	        pstmt.setString(5, phone);
	        pstmt.setString(6, id);
	        // executeUpdate는 성공시 1이상, 실패하면 0을 반환한다.
	        pstmt.executeUpdate();
	        pstmt.close();
	        con.close();
	}
	
	public int deleteMember(String name, String id) throws Exception{
		con = getConnection();
		String sql = "DELETE FROM PERSONNEL WHERE name=? AND id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, id);
        int result = pstmt.executeUpdate();
        pstmt.close();
        con.close();
        return result;
	}

}
