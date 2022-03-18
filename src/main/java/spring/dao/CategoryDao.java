package spring.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.vo.Category;
import spring.vo.Notice;
import spring.vo.Option;
import spring.vo.Product;
import spring.vo.ProductCommand;

public class CategoryDao {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Category> menu1() { 
		List<Category> list = sqlSession.selectList("mybatis.mapper.category.menu1");
		return list;
	}
	public List<Category> menu2() { 
		List<Category> list = sqlSession.selectList("mybatis.mapper.category.menu2");
		return list;
	}
	public List<Category> menu3() { 
		List<Category> list = sqlSession.selectList("mybatis.mapper.category.menu3");
		return list;
	}
	public int menu1Count() { 
		return sqlSession.selectOne("mybatis.mapper.category.menuCount1");
	}
	public int menu2Count() { 
		return sqlSession.selectOne("mybatis.mapper.category.menuCount2");
	}
	public int menu3Count() { 
		return sqlSession.selectOne("mybatis.mapper.category.menuCount3");
	}
	
	public void categoryInsert(Category insertDate) {
		sqlSession.update("mybatis.mapper.category.categoryInsert",insertDate);
	}
	
	public void categorySeqUpdate(Category updateDate) { 
		sqlSession.update("mybatis.mapper.category.categorySeqUpdate",updateDate);
	}
	
	public CategoryDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
