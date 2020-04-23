package blog.vo;

public class Commentid {
	private int commentidno;
	private int postno;
	private String memberid;
	private String cc;
	private String commentiddate;
	
	public int getCommentidno() {
		return commentidno;
	}
	public void setCommentidno(int commentidno) {
		this.commentidno = commentidno;
	}
	public int getPostno() {
		return postno;
	}
	public void setPostno(int postno) {
		this.postno = postno;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public String getCommentiddate() {
		return commentiddate;
	}
	public void setCommentiddate(String commentiddate) {
		this.commentiddate = commentiddate;
	}
}