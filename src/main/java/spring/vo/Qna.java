package spring.vo;

import java.sql.Date;

public class Qna {
	private long qna_number;
	private long product_number;
	private String qna_pwd;
	private long member_number;
	private String qna_title;
	private String qna_content;
	private Date qna_regdate;
	private String product_name;
	
	
	
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
	public String getQna_pwd() {
		return qna_pwd;
	}
	public void setQna_pwd(String qna_pwd) {
		this.qna_pwd = qna_pwd;
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
