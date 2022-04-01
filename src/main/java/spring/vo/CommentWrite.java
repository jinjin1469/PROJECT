package spring.vo;

import java.sql.Date;

public class CommentWrite {
	private String comment_content;
	private Date comment_regdate;
	private long comment_number;
	private long member_number;
	private long qna_number;
	
	
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getComment_regdate() {
		return comment_regdate;
	}
	public void setComment_regdate(Date comment_regdate) {
		this.comment_regdate = comment_regdate;
	}
	public long getComment_number() {
		return comment_number;
	}
	public void setComment_number(long comment_number) {
		this.comment_number = comment_number;
	}
	public long getMember_number() {
		return member_number;
	}
	public void setMember_number(long member_number) {
		this.member_number = member_number;
	}
	public long getQna_number() {
		return qna_number;
	}
	public void setQna_number(long qna_number) {
		this.qna_number = qna_number;
	}

	


}
