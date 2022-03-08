package spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.vo.Notice;

public class NoticeDao {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Notice> noticeAll() { 
		List<Notice> list = sqlSession.selectList("mybatis.mapper.notice.noticeAll");
		return list;
	}
	
	public Notice detailView(Long num) { 
		Notice list = sqlSession.selectOne("mybatis.mapper.notice.detailView",num);
		return list;
	}
	
	public void insertNotice(Notice notice) { 
		sqlSession.insert("mybatis.mapper.notice.insertNotice",notice);
	}
	
	public void updateNotice(Notice notice) { 
		sqlSession.update("mybatis.mapper.notice.updateNotice",notice);
	}
	
	public void deleteNotice(Long num) { 
		sqlSession.delete("mybatis.mapper.notice.deleteNotice",num);
	}
	
	public List<Notice> noticeSearch(String search) { 
		List<Notice> list = sqlSession.selectList("mybatis.mapper.notice.noticeSearch",search);
		return list;
	}
	
	public NoticeDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
