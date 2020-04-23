package blog.vo;

public class Postid {
	private int postidNo;
	private String memberid;
	private String subjectname;
	private String posttitle;
	private String postcontent;
	private String postidDate;
	
	public int getPostidNo() {
		return postidNo;
	}
	public void setPostidNo(int postidNo) {
		this.postidNo = postidNo;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getSubjectname() {
		return subjectname;
	}
	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}
	public String getPosttitle() {
		return posttitle;
	}
	public void setPosttitle(String posttitle) {
		this.posttitle = posttitle;
	}
	public String getPostcontent() {
		return postcontent;
	}
	public void setPostcontent(String postcontent) {
		this.postcontent = postcontent;
	}
	public String getPostidDate() {
		return postidDate;
	}
	public void setPostidDate(String postidDate) {
		this.postidDate = postidDate;
	}
}