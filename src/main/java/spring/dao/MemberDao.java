package spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.jdbc.core.JdbcTemplate;


import spring.vo.Member;
import spring.vo.RegisterRequest;

public class MemberDao { 
	
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	public List<Member> memberAll() { 
		List<Member> list = sqlSession.selectList("mybatis.mapper.member.memberAll");
		return list;
	}
	
	public MemberDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//중복아이디가 있는지 확인
	public Member selectById(String member_id) {
		Member result = sqlSession.selectOne("mybatis.mapper.member.selectById", member_id);
		return result;
	}
	
	// 회원 가입
	public void insertMember(RegisterRequest reg) {
		sqlSession.insert("mybatis.mapper.member.insertMember", reg);

	}
	
}









