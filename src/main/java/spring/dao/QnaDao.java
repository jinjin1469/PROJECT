package spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import spring.vo.CommentWrite;
import spring.vo.Order;
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
	
	public Qna selectQna(long qna_number) {
		Qna qna = sqlSession.selectOne("mybatis.mapper.qna.selectQna", qna_number);
		return qna;
	}

	public long selectQnaNumber(long qna_number) {
		return sqlSession.selectOne("mybatis.mapper.qna.selectQnaNumber",qna_number);
	}

	public void delete(long qna_number) {
		sqlSession.delete("mybatis.mapper.qna.deleteQna", qna_number);	
	}

	public void update(Qna qna) {
		sqlSession.update("mybatis.mapper.qna.update", qna);
		
	}

	public List<Qna> selectlist() {
		List<Qna> list = sqlSession.selectList("mybatis.mapper.qna.selectList");
		return list;
	}
	
	public List<Qna> selectMylist(long member_number) {
		List<Qna> list = sqlSession.selectList("mybatis.mapper.qna.selectMyList", member_number);
		return list;
	}

	public void insertCom(CommentWrite commentWrite) {
		sqlSession.insert("mybatis.mapper.qna.insertCom", commentWrite);
	}

	public void updateState(long qna_number) {
		sqlSession.update("mybatis.mapper.qna.updateState", qna_number);
		
	}

	public CommentWrite selectComment(long qna_number) {
		CommentWrite comment = sqlSession.selectOne("mybatis.mapper.qna.selectComment", qna_number);
		return comment;
	}

	public int selectByNum(long qna_number) {
		return sqlSession.selectOne("mybatis.mapper.qna.selectNum",qna_number);
	}

	public void deleteCom(long comment_number) {
		sqlSession.delete("mybatis.mapper.qna.deleteCom", comment_number);
	}

	public void setStateWaiting(long qna_number) {
		sqlSession.update("mybatis.mapper.qna.setWaiting", qna_number);
	}

	public void updateComment(CommentWrite commentWrite) {
		sqlSession.update("mybatis.mapper.qna.updateComment", commentWrite);
	}

	public long selectCommentNumber(long comment_number) {
		return sqlSession.selectOne("mybatis.mapper.qna.selectCommentNumber", comment_number);
	}

	public long selectProNUM(long product_number) {
		return sqlSession.selectOne("mybatis.mapper.qna.selectProNUM", product_number);
	}
	
	public int selectAllNumBoard() {
		return sqlSession.selectOne("mybatis.mapper.qna.selectAllNumBoard");
	}

	public List<Qna> selectTargetBoard(int section, int pageNum) {
		Map<String, Integer> map1 = new HashMap<>();
		map1.put("section", section);
		map1.put("pageNum", pageNum);
		List<Qna> list = sqlSession.selectList("mybatis.mapper.qna.qnaPagingList",map1);
		return list;
	}

	public int selectByQnaNum(long qna_number) {
		return sqlSession.selectOne("mybatis.mapper.qna.selectByQnaNum", qna_number);
	}

	
	
}
