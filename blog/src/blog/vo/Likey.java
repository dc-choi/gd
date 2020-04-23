package blog.vo;

public class Likey {
	private int likeNo;
	private int postNo;
	private String memberId;
	private int likeyCk;
	private int likeyUnck;
	private String likeyDate;
	
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getLikeyCk() {
		return likeyCk;
	}
	public void setLikeyCk(int likeyCk) {
		this.likeyCk = likeyCk;
	}
	public int getLikeyUnck() {
		return likeyUnck;
	}
	public void setLikeyUnck(int likeyUnck) {
		this.likeyUnck = likeyUnck;
	}
	public String getLikeyDate() {
		return likeyDate;
	}
	public void setLikeyDate(String likeyDate) {
		this.likeyDate = likeyDate;
	}
}