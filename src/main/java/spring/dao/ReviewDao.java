package spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import spring.vo.Qna;
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

	public List<Review> selectReviewlist() {
		return sqlSession.selectList("mybatis.mapper.review.ReviewList");
	}

	public int selectAllNumBoard() {
		return sqlSession.selectOne("mybatis.mapper.review.selectAllNumBoard");
	}

	public List<Review> selectTargetBoard(int section, int pageNum) {
		Map<String, Integer> map1 = new HashMap<>();
		map1.put("section", section);
		map1.put("pageNum", pageNum);
		List<Review> list = sqlSession.selectList("mybatis.mapper.review.reviewPagingList",map1);
		return list;
	}

	public int selectAllNumReivew(long member_number) {
		return sqlSession.selectOne("mybatis.mapper.review.selectAllNumReview", member_number);
	}

	public List<Review> selectTargetReview(int section, int pageNum, long member_number) {
		Map<String, Integer> map1 = new HashMap<>();
		map1.put("section", section);
		map1.put("pageNum", pageNum);
		map1.put("member_number", (int) member_number);
		List<Review> list = sqlSession.selectList("mybatis.mapper.review.myReviewPagingList",map1);
		return list;
	}

}
