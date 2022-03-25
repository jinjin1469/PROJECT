package spring.service;

import org.springframework.beans.factory.annotation.Autowired;

import spring.dao.ReviewDao;

public class ReviewService {
	
	@Autowired
	private ReviewDao dao;

	public void setDao(ReviewDao dao) {
		this.dao = dao;
	} 

}
