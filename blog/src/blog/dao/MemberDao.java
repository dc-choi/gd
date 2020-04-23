package blog.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import blog.commons.DBUtil;
import blog.vo.Member;

public class MemberDao {
	// 로그인하기위한 model
	public Member selectMemberOne(Connection conn, Member member) {
		System.out.println(member.getMemberId() + " <-- MemberDao.selectMemberOne member.getMemberId()");
		System.out.println(member.getMemberPw() + " <-- MemberDao.selectMemberOne member.getMemberPw()");
		
		Member returnMember = null;
		// SELECT member_id, member_pw, member_level FROM member WHERE member_id = ? AND
		// member_pw = ?
		String sql = "SELECT member_id, member_pw, member_level FROM member WHERE member_id = ? AND member_pw = ?";

		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, member.getMemberId());
			stmt.setString(2, member.getMemberPw());
			rs = stmt.executeQuery();

			if (rs.next()) {
				returnMember = new Member();
				returnMember.setMemberId(rs.getString("member_id"));
				returnMember.setMemberPw(rs.getString("member_pw"));
				returnMember.setMemberLevel(rs.getInt("member_level"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, stmt, null);
		}
		return returnMember;
	}

	// Member정보를 보기위한 메소드
	public Member selectMemberOne(Connection conn, String memberId) {
		
		Member member = null;
		
		String sql = "SELECT member_id, member_pw, member_level, member_date FROM member WHERE member_id = ?";

		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, memberId);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				member = new Member();
				member.setMemberId(rs.getString("member_id"));
				member.setMemberPw(rs.getString("member_pw"));
				member.setMemberLevel(rs.getInt("member_level"));
				member.setMemberDate(rs.getString("member_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, stmt, conn);
			System.out.println(member.getMemberId() + " <-- MemberDao.selectMemberOne() member.getMemberId()");
		}
		return member;
	}
	
	// 멤버 탈퇴시 삭제
	public int deleteMember(Connection conn, Member member) throws SQLException {
		
		PreparedStatement stmt = null;
		String sql = "DELETE FROM member WHERE member_id = ? AND member_pw = ?";
		int row = 0;
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, member.getMemberId());
			stmt.setString(2, member.getMemberPw());
			row = stmt.executeUpdate();
		} finally {
			stmt.close();
		}
		return row;
	}
	
	public void updateMember(Connection conn, Member member) throws SQLException {
		
		PreparedStatement stmt = null;
		String sql = "UPDATE member SET member_level = ? WHERE member_id = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, member.getMemberLevel());
			stmt.setString(2, member.getMemberId());
			stmt.executeUpdate();
		} finally {
			stmt.close();
		}
	}
	
	// 회원가입 전 id 사용 가능여부
	public boolean addMember(Connection conn, String memberId) throws Exception {
		// true = use ID
		// false = don't use ID
		boolean flag = true;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		// UNION, subquery, JOIN
		String sql1 = "SELECT mi FROM(SELECT member_id mi FROM member UNION SELECT memberid mi FROM memberid) t WHERE t.mi = ?";
		
		try {
			stmt = conn.prepareStatement(sql1);
			stmt.setString(1, memberId);
			System.out.println(stmt + " <-- MemberDao.addMember stmt");
			rs = stmt.executeQuery();
			if (rs.next()) {
				flag = false;
			}
		} finally {
			stmt.close();
			rs.close();
		}
		return flag;
	}
	
	// 회원가입
	public void insertMember(Connection conn, Member member) throws SQLException {
		System.out.println(member.getMemberId() + " <-- MemberDao.insertMember.member.getMemberId()");
		System.out.println(member.getMemberPw() + " <-- MemberDao.insertMember.member.getMemberPw()");
		
		PreparedStatement stmt = null;
		String sql = "INSERT INTO member(member_id, member_pw, member_level, member_date) VALUES(?, ?, 10, now())";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, member.getMemberId());
			stmt.setString(2, member.getMemberPw());
			stmt.executeUpdate();
			System.out.println(stmt + " <-- MemberDao.insertMember stmt");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			stmt.close();
		}
	}
	
	// Admin Member List + Page
	public List<Member> selectMemberList(Connection conn, int beginRow, int rowPerPage) throws SQLException {
		System.out.println(beginRow + " <-- MemberDao.selectMemberList beginRow");
		System.out.println(rowPerPage + " <-- MemberDao.selectMemberList rowPerPage");
		
		List<Member> list = new ArrayList<Member>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT member_id, member_level FROM member LIMIT ?, ?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Member m = new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberLevel(rs.getInt("member_level"));
				list.add(m);
			}
		} finally {
			rs.close();
			stmt.close();
		}
		return list;
	}
	
	// Member List Page Count
	public int selectCountMember(Connection conn) throws SQLException {
		int totalRowCount = 0;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM member";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				totalRowCount = rs.getInt("count(*)");
			}
			System.out.println(totalRowCount + " <-- MemberDao.selectCountMember totalRowCount");
		} finally {
			rs.close();
			stmt.close();
		}
		
		return totalRowCount;
	}
}




