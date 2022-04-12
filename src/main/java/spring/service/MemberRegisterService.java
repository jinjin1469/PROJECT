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
	
	//닉네임 중복체크 
		public int nameCheck(String member_nickname) {
			Member output = dao.nameCheck(member_nickname);
			int outputData = 0;
			//member_point가 아이디 중복 체크 ! member_state가 현재 멤버 가입상태(2번 비활, 1번 활)
			
			if(output.getMember_state() == 0 && output.getMember_point() == 0) { //가입 된 아이디도 없고 탈퇴한 아이도 없을때 회원가입 가능
				outputData = 0;
			}else if(output.getMember_state() == 1 && output.getMember_point() != 0) { //사용중
				outputData = 1;
			}else if(output.getMember_state() == 9 && output.getMember_point() != 0) { //탈퇴회원임
				outputData = 2;
			}
			

			return outputData;
		
		}
		
		/*
		 * //아이디 중복체크 public int idCheck(String member_id) { return
		 * dao.idCheck(member_id); }
		 * 
		 */
		
		//아이디 중복체크 
	public int idCheck(String member_id) { // member_point가 아이디 중복 체크 1이면 가입안되고 0이면 가입됨! member_state가 현재 멤버 가입상태(9번 비활, 1번 활) 말해줌!! 
		Member output = dao.idCheck(member_id);
		int outputData = 0;
		
		if(output.getMember_state() == 0 && output.getMember_point() == 0) { //가입 된 아이디도 없고 탈퇴한 아이도 없을때 회원가입 가능
			outputData = 0;
		}else if(output.getMember_state() == 1 && output.getMember_point() != 0) { //사용중
			outputData = 1;
		}else if(output.getMember_state() == 9 && output.getMember_point() != 0) { //탈퇴회원임
			outputData = 2;
		}
		
			return outputData;
	
	}
	//회원가입진행
	public void regist(RegisterRequest reg) {
		System.out.println("아이디값 :" + reg.getMember_id());
		
		Member newMember = dao.selectById(reg.getMember_id());
		
		if(newMember != null) {
			throw new AlreadyExistingMemberException("이미 존재하는 계정입니다.:"+reg.getMember_id());
		}
		
		dao.insertMember(reg); 
		
	}
	
	

}
