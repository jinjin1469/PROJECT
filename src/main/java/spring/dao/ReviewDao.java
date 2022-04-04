package spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.vo.Review;

public class ReviewDao {
	
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ReviewDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}

	public void insert(Review review) {
		sqlSession.insert("mybatis.mapper.review.insertReview", review);
		
	}

	public List<Review> listReview(long order_number) {
		 return sqlSession.selectList("mybatis.mapper.review.listReview", order_number);
	}

	public List<Review> selectMylist(long member_number) {
	 return sqlSession.selectList("mybatis.mapper.review.listMyReview", member_number);
	}

}
