package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import spring.dao.ReviewDao;
import spring.service.ReviewService;

@Configuration
public class ReviewController {
	
	@Autowired
	private ReviewDao dao;
	public void setDao(ReviewDao dao) {
		this.dao = dao;
	}
	
	@Autowired
	private ReviewService reviewService;
	
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
	

}
