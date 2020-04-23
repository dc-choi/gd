package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import commons.*;
import vo.*;
import java.util.*;

public class MemberDao {
	public Member login(Member member) {
		
		Member remember = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM member WHERE member_id = ? and member_pw = ?");
			stmt.setString(1, member.getMemberId());
			stmt.setString(2, member.getMemberPw());
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				remember = new Member();
				remember.setMemberId(rs.getString("member_id"));
				remember.setMemberPw(rs.getString("member_pw"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, stmt, conn);
		}
		return remember;
	}
	
	public ArrayList<Member> selectMemberListAll() {
		
		ArrayList<Member> list = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM member");
			rs = stmt.executeQuery();

			list = new ArrayList<Member>();
			while (rs.next()) {
				Member member = new Member();
				member.setMemberId(rs.getString("member_id"));
				member.setMemberPw(rs.getString("member_pw"));
				list.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, stmt, conn);
		}
		return list;
	}
	
	public void insertMember(Member member) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("INSERT INTO member(member_id, member_pw) VALUES(?, ?)");
			stmt.setString(1, member.getMemberId());
			stmt.setString(2, member.getMemberPw());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔창에 예외메시지 출력바람
		} finally {
			DBUtil.close(null, stmt, conn);
		}
	}

	public Member selectMemberOne(String memberId) {
		
		System.out.println(memberId + " <--MemberDao.selectMemberOne(String memberId)");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Member member = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM member WHERE member_id = ?");
			stmt.setString(1, memberId);
			rs = stmt.executeQuery();

			member = new Member();
			if (rs.next()) {
				member.setMemberId(rs.getString("member_id"));
				member.setMemberPw(rs.getString("member_pw"));
			}
		} catch (Exception e) {
			System.out.println("MemberDao.selectMemberOne() ERROR");
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, stmt, conn);
		}
		return member;
	}
	
	public void updateMember(Member member) {
		
		System.out.println(member.getMemberId() + " <-- MemberDao.updateMember() member.getMemberId()");
		System.out.println(member.getMemberPw() + " <-- MemberDao.updateMember() member.getMemberPw()");
		
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("UPDATE member SET member_pw = ? WHERE member_id = ?");
			stmt.setString(1, member.getMemberPw());
			stmt.setString(2, member.getMemberId());
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("MemberDao.updateMember() ERROR");
			e.printStackTrace();
		} finally {
			DBUtil.close(null, stmt, conn);
		}
	}
}