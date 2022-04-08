package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import spring.dao.ReviewDao;
import spring.vo.Qna;
import spring.vo.Review;

public class ReviewService {
	
	@Autowired
	private ReviewDao dao;

	public void setDao(ReviewDao dao) {
		this.dao = dao;
	}

	public void insert(Review review) {
		dao.insert(review);
	}

	public List<Review> listReview(long order_number) {
		return dao.listReview(order_number);
	}

	public List<Review> selectMylist(long member_number) {
		List<Review> list = dao.selectMylist(member_number);
		return list;
	}

	public List<Review> selectReviewlist() {
		List<Review> list = dao.selectReviewlist();
		return list;
	} 
	
}


