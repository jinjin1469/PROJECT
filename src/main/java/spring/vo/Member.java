package spring.vo;

public class Member {

	private long member_number;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_nickname;
	private String member_phone;
	private String member_email;
	private String member_address;
	private long member_point;

	public Member() {
	}
	

	public Member(String member_id, String member_pwd, String member_name, String member_nickname, String member_phone,
			String member_email, String member_address) {
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_nickname = member_nickname;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_address = member_address;
	}
	
	
	

	public Member(long member_number, String member_id, String member_name) {
		this.member_number = member_number;
		this.member_id = member_id;
		this.member_name = member_name;
	}


	public long getMember_number() {
		return member_number;
	}

	public void setMember_number(long member_number) {
		this.member_number = member_number;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String memer_id) {
		this.member_id = memer_id;
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

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public long getMember_point() {
		return member_point;
	}

	public void setMember_point(long member_point) {
		this.member_point = member_point;
	}



}
