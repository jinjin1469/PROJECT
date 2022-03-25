package spring.service;

import org.springframework.beans.factory.annotation.Autowired;

import spring.dao.QnaDao;
import spring.vo.Qna;

public class QnaService {

	@Autowired
	private QnaDao dao;

	public void setDao(QnaDao dao) {
		this.dao = dao;
	}
	
	
	public String selectByNumber(long product_number) {
		String product_name = dao.selectByNumber(product_number);
		return product_name;
	}
	
	public void insert(Qna qna) {
		dao.insert(qna);
	}
	
}
