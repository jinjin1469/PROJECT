package spring.vo;

import java.sql.Date;

public class Review {
	private long review_number;
	private long product_number;
	private long member_number;
	private String review_content;
	private Date review_regdate;
	
	
	
	public long getReview_number() {
		return review_number;
	}
	public void setReview_number(long review_number) {
		this.review_number = review_number;
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
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_regdate() {
		return review_regdate;
	}
	public void setReview_regdate(Date review_regdate) {
		this.review_regdate = review_regdate;
	}

	

}
