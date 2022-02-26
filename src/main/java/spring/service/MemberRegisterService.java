package spring.service;


import org.springframework.beans.factory.annotation.Autowired;

import spring.dao.MemberDao;
import spring.exception.AlreadyExistingMemberException;
import spring.vo.Member;
import spring.vo.RegisterRequest;


public class MemberRegisterService {
	
	@Autowired
	private MemberDao dao; 
	
	public MemberRegisterService(MemberDao dao) { 
		this.dao = dao;
	}

	public void regist(RegisterRequest reg) {
		System.out.println("아이디값 :" + reg.getMember_id());
		
		Member newMember = dao.selectById(reg.getMember_id());
		
		if(newMember != null) {
			throw new AlreadyExistingMemberException("이미 존재하는 계정입니다.:"+reg.getMember_id());
		}
		
		dao.insertMember(reg); // 회원가입진행
		
	}

}
