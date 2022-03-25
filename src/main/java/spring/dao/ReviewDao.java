package spring.dao;

import org.apache.ibatis.session.SqlSession;

public class ReviewDao {
	
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ReviewDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}

}
