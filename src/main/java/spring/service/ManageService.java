package spring.service;

import spring.dao.MemberDao;
import spring.vo.Member;

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
	
	
	
	
}
