package spring.service;

import spring.dao.MemberDao;
import spring.vo.Member;
import spring.vo.RegisterRequest;

public class ManageService {

	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	//회원 정보 읽어오기
	public Member myPage(Long member_number) {
		Member memInfo = dao.selectByMemberNum(member_number);
			return memInfo;
	}
	
	// 비밀번호
		public void pwdModify(Long member_number, RegisterRequest regReq) {

			Member member = dao.selectByMemberNum(member_number); 
			member.setMember_pwd(regReq.getMember_pwd());
			dao.updatePwd(member);

		}

		public String pwdFind(Long member_number) {
		    String member_pwd = dao.pwdFind(member_number);
			return member_pwd;
		}
	
	
}
