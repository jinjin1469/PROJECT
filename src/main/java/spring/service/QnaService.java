package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import spring.dao.QnaDao;
import spring.vo.CommentWrite;
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
	
	public Qna selectQna(long qna_number) {
		Qna view = dao.selectQna(qna_number);
		return view;
	}


	public long selectQnaNumber(long qna_number) {
		long Writer = dao.selectQnaNumber(qna_number);
		return Writer;
	}


	public void deleteQue(long qna_number) {
		dao.delete(qna_number);
		
	}


	public void update(Qna qna) {
		dao.update(qna);
		
	}


	public List<Qna> selectlist() {
		List<Qna> list = dao.selectlist();
		return list;
	}

	public void insertCom(CommentWrite commentWrite) {
		dao.insertCom(commentWrite);		
		
	}


	public void setState(long qna_number) {
		dao.updateState(qna_number);
		
	}


	public CommentWrite selectComment(long qna_number) {
		CommentWrite comment = dao.selectComment(qna_number);
		return comment;
	}


	public int selectByNum(long qna_number) {
		int selectByNum = dao.selectByNum(qna_number);
		return selectByNum;
	}


	public void deleteCom(long comment_number) {
		dao.deleteCom(comment_number);
		
	}


	public void setStateWaiting(long qna_number) {
		dao.setStateWaiting(qna_number);
	}


	public void updateComment(CommentWrite commentWrite) {
		dao.updateComment(commentWrite);
		
	}


	public long selectCommentNumber(long comment_number) {
		long qna_number = dao.selectCommentNumber(comment_number);
		return qna_number;
	}
	
}
