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
	
	public CategoryDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
