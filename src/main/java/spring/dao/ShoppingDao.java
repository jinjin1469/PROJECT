package spring.dao;

import org.apache.ibatis.session.SqlSession;

import spring.vo.Cart;


public class ShoppingDao {
	
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ShoppingDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void insertCart(Cart cart) { 
		sqlSession.insert("mybatis.mapper.shopping.insertCart",cart);
	}


}
