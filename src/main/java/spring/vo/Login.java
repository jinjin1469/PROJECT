package spring.vo;

public class Login { // 생성자 x

	private String member_id;
	private String member_pwd;
	private String member_name;
	private long member_number;
	private boolean rememberId;

	public boolean isRememberId() {
		return rememberId;
	}

	public void setRememberId(boolean rememberId) {
		this.rememberId = rememberId;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public long getMember_number() {
		return member_number;
	}

	public void setMember_number(long member_number) {
		this.member_number = member_number;
	}

}
