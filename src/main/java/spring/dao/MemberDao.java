package spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.jdbc.core.JdbcTemplate;

import spring.vo.Category;
import spring.vo.Member;
import spring.vo.RegisterRequest;
import spring.vo.Review;

public class MemberDao { 
	
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	public MemberDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	public List<Member> memberAll() { 
		List<Member> list = sqlSession.selectList("mybatis.mapper.member.memberAll");
		return list;
	}
	
	
	// 로그인
	public Member selectById(String member_id) {
		Member member = sqlSession.selectOne("mybatis.mapper.member.selectById", member_id);
		return member;
	}
	
	// 회원 가입
	public void insertMember(RegisterRequest reg) {
		sqlSession.insert("mybatis.mapper.member.insertMember", reg);

	}
	
	//닉네임 중복검사 ajax
	public int nameCheck(String member_nickname){ 
		return sqlSession.selectOne("mybatis.mapper.member.nameCheck", member_nickname);
	}
	
	//아이디 중복검사 ajax
	public int idCheck(String member_id){ 
		return sqlSession.selectOne("mybatis.mapper.member.idCheck", member_id);
	}

	//아이디 찾기
	public String findId(Member memVo) throws Exception{
		return sqlSession.selectOne("mybatis.mapper.member.findId",memVo);
	}
	
	//비밀번호 찾기
	public String findPw(Member memVo) throws Exception{
			return sqlSession.selectOne("mybatis.mapper.member.findPwd",memVo);
	}
	
	//임시 비밀번호 전송
	public int updatePw(Member memVo) throws Exception {
		return sqlSession.update("mybatis.mapper.member.updatePw",memVo);
	}
	
	public Member selectByMemberNum(long member_number) {
		Member member = sqlSession.selectOne("mybatis.mapper.member.selectByMemberNum", member_number);
		return member;
	}
	
	//비밀번호 업데이트
	public void updatePwd(Member member) {
			sqlSession.update("mybatis.mapper.member.updatePwd",member);
		}


   public String pwdFind(Long member_number) {
		String member_pwd =  sqlSession.selectOne("mybatis.mapper.member.pwdFind", member_number);
	   return member_pwd;
		}

	
   public List<Review> myReview(Long member_number) {
		return sqlSession.selectList("mybatis.mapper.review.myReview", member_number);
   }

	
	public void updateInfo(RegisterRequest regReq) {
		sqlSession.update("mybatis.mapper.member.updateInfo", regReq);
	}


	public int askStatus(long member_number) {
		return sqlSession.selectOne("mybatis.mapper.order.orderCheck", member_number);
	}


	public void deleteAccount(long member_number) {
		sqlSession.delete("mybatis.mapper.member.deleteAccount",member_number);
		
	}


	public int myPurchasesCount(long member_number) {
		return sqlSession.selectOne("mybatis.mapper.order.myPurchasesCount",member_number);
	}


	public int myAmount(long member_number) {
		System.out.println("member_number" + member_number);
		return sqlSession.selectOne("mybatis.mapper.order.myAmount",member_number);
	}


	
	 public List<Review> ReviewList() { 
		List<Review> list =
	  sqlSession.selectList("mybatis.mapper.review.ReviewAllList"); return list; 
	  }
	 
	
	
		
	
}


	







