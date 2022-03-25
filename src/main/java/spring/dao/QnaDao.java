package spring.dao;

import org.apache.ibatis.session.SqlSession;

import spring.vo.Qna;

public class QnaDao {
	
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public QnaDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	
	public String selectByNumber(long product_number) { 
		return sqlSession.selectOne("mybatis.mapper.qna.selectNumber",product_number);
	}
	
	public void insert(Qna qna) {
		sqlSession.insert("mybatis.mapper.qna.insertQna", qna);
	}
	
	
}
