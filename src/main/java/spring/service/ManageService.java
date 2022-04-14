package spring.service;

import java.util.List;

import spring.dao.MemberDao;
import spring.exception.AlreadyExistingEmailException;
import spring.exception.AlreadyExistingMemberException;
import spring.exception.MemberDeactivateAccount;
import spring.vo.Member;
import spring.vo.RegisterRequest;
import spring.vo.Review;

public class ManageService {

	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	// 회원 정보 읽어오기
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

	public List<Review> myReview(Long member_number) {
		List<Review> list = dao.myReview(member_number);
		return list;
	}

	public void update(RegisterRequest regReq) {
		
		Member output = dao.emailCheck(regReq.getMember_email());		
		
		if(output.getMember_state() == 1 && output.getMember_point() != 0) { //사용중
			throw new AlreadyExistingEmailException("이메일로 가입되어있는 계정이 존재합니다.:"+regReq.getMember_email());
		}else if(output.getMember_state() == 9 && output.getMember_point() != 0) { //탈퇴회원임
			throw new MemberDeactivateAccount();
		}else {
			dao.updateInfo(regReq);
		}
		

	}

	public int askStatus(long member_number) {
		int askStatus = dao.askStatus(member_number);
		return askStatus;
	}

	public void delete(long member_number) {
		dao.deleteAccount(member_number);

	}

	public int myPurchasesCount(long member_number) {
		int myPurchasesCount = dao.myPurchasesCount(member_number);
		return myPurchasesCount;
	}

	public int myAmount(long member_number) {
		int myAmount = dao.myAmount(member_number);
		return myAmount;
	}

	
	 public List<Review> ReviewList() { 
		 List<Review> list = dao.ReviewList();
	  return list; }
	  
	
	
}
