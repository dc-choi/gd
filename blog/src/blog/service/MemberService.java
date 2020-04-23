package blog.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;
import blog.commons.DBUtil;
import blog.dao.MemberDao;
import blog.dao.MemberidDao;
import blog.vo.Member;

public class MemberService {
	
	private MemberDao memberDao;
	private MemberidDao memberidDao;
	
	public Member getMemberOne(Member member) {
		System.out.println(member + " <-- MemberService.getMemberOne member");
		
		Member returnMember = null;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			System.out.println(conn + " <-- MemberService.removeMember");
			
			memberDao = new MemberDao();
			returnMember = memberDao.selectMemberOne(conn, member);
			
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DBUtil.close(null, null, conn);
		}
		return returnMember;
	}
	
	public Member getMemberOne(String memberId) {
		System.out.println(memberId + " <-- MemberService.getMemberOne member");
		
		Member returnMember = null;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			System.out.println(conn + " <-- MemberService.removeMember");
			
			memberDao = new MemberDao();
			returnMember = memberDao.selectMemberOne(conn, memberId);
			
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DBUtil.close(null, null, conn);
		}
		return returnMember;
	}
	
	public void removeMember(Member member) {
		System.out.println(member.getMemberId() + " <-- MemberService.removeMember member.getMemberId()");
		System.out.println(member.getMemberPw() + " <-- MemberService.removeMember member.getMemberPw()");
		
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			System.out.println(conn + " <-- MemberService.removeMember");
			conn.setAutoCommit(false);
			
			memberDao = new MemberDao();
			int row = memberDao.deleteMember(conn, member);
			System.out.println(row + " <-- MemberService.removeMember row");
			
			if(row == 1) {
				memberidDao = new MemberidDao();
				memberidDao.insertMemberid(conn, member.getMemberId());
			}
			System.out.println(member.getMemberId() + " <-- MemberService.removeMember member.getMemberId()2");
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DBUtil.close(null, null, conn);
		}
	}
	
	// Member Modify
	public void modifyMemberLevel(Member member) {
		
		memberDao = new MemberDao();
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			memberDao.updateMember(conn, member);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public boolean addMember(Member member) {
		
		memberDao = new MemberDao();
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			// Dao에서 불러오는 값에 따라 if문을 실행시킨다
			if (memberDao.addMember(conn, member.getMemberId())) {
				memberDao.insertMember(conn, member);
				return true;
			}		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public Map<String, Object> getMemberList(int currentPage, int rowPerPage) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Connection conn = null;
		List<Member> list = null;
		int beginRow = (currentPage-1) * rowPerPage;
		System.out.println(beginRow + " <-- MemberService.getMemberList beginRow");
		
		try {
			conn = DBUtil.getConnection();
			
			memberDao = new MemberDao();
			list = memberDao.selectMemberList(conn, beginRow, rowPerPage);
			System.out.println(list.size() + " <-- MemberService.getMemberList list.size()");
			
			int totalRowCount = memberDao.selectCountMember(conn);
			System.out.println(totalRowCount + " <-- MemberService.getMemberList totalRowCount");
			int lastPage = totalRowCount / rowPerPage;
			System.out.println(lastPage + " <-- MemberService.getMemberList lastPage");
			
			if(totalRowCount % rowPerPage != 0) {
				lastPage += 1;
			}
			
			map.put("list", list);
			map.put("lastPage", lastPage);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return map;
	}
}



