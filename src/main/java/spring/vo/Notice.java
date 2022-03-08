package spring.vo;

import java.util.Date;

public class Notice {

	private long NOTICE_NUMBER;
	private String CLASSIFICATION;
	private String NOTICE_TITLE;
	private String NOTICE_CONTENT;
	private Date REGDATE;
	
	public Date getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(Date rEGDATE) {
		REGDATE = rEGDATE;
	}
	public long getNOTICE_NUMBER() {
		return NOTICE_NUMBER;
	}
	public void setNOTICE_NUMBER(long nOTICE_NUMBER) {
		NOTICE_NUMBER = nOTICE_NUMBER;
	}
	public String getCLASSIFICATION() {
		return CLASSIFICATION;
	}
	public void setCLASSIFICATION(String cLASSIFICATION) {
		CLASSIFICATION = cLASSIFICATION;
	}
	public String getNOTICE_TITLE() {
		return NOTICE_TITLE;
	}
	public void setNOTICE_TITLE(String nOTICE_TITLE) {
		NOTICE_TITLE = nOTICE_TITLE;
	}
	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}
	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}
	
	
	
}
