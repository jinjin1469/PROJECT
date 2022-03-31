package spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import spring.vo.Category;
import spring.vo.Notice;
import spring.vo.Option;
import spring.vo.Product;
import spring.vo.ProductCategoryEdit;
import spring.vo.ProductCategoryEditList;
import spring.vo.ProductCommand;

public class AdminDao {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
	
	
	public AdminDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
