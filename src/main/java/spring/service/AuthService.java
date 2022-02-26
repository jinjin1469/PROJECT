package spring.service;

import org.springframework.stereotype.Service;

import spring.dao.MemberDao;


public class AuthService {

	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	public AuthInfo authenticate(String memberId, String memberPassword) {
		Member member = dao.selectById(memberId);
		
		if(member==null) {
			throw new IdPasswordNotMatchingException();
		}
		if(!member.getMemberPassword().equals(memberPassword)) {
			throw new IdPasswordNotMatchingException();
		}
		
		return new AuthInfo(member.getMemberNum(),member.getMemberId(),member.getMemberName());
		
	}

	
}
