package spring.vo;

import java.sql.Date;

public class Qna {
	private long qna_number;
	private long product_number;
	private long member_number;
	private String qna_title;
	private String qna_content;
	private Date qna_regdate;
	private String product_name;
	private String member_nickname;
	private String qna_state;
	private String comment_content;
	private Date comment_regdate;
	private long comment_number;
	private int option_join_number;

	public int getOption_join_number() {
		return option_join_number;
	}

	public void setOption_join_number(int option_join_number) {
		this.option_join_number = option_join_number;
	}

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

	public String getQna_state() {
		return qna_state;
	}

	public void setQna_state(String qna_state) {
		this.qna_state = qna_state;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public long getQna_number() {
		return qna_number;
	}

	public void setQna_number(long qna_number) {
		this.qna_number = qna_number;
	}

	public long getProduct_number() {
		return product_number;
	}

	public void setProduct_number(long product_number) {
		this.product_number = product_number;
	}

	public long getMember_number() {
		return member_number;
	}

	public void setMember_number(long member_number) {
		this.member_number = member_number;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getQna_regdate() {
		return qna_regdate;
	}

	public void setQna_regdate(Date qna_regdate) {
		this.qna_regdate = qna_regdate;
	}

}
