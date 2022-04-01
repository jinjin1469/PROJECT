package spring.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.vo.Category;
import spring.vo.Notice;
import spring.vo.Option;
import spring.vo.Product;
import spring.vo.ProductCommand;
import spring.vo.Qna;

public class ProductDao {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Product> productAll() { 
		List<Product> list = sqlSession.selectList("mybatis.mapper.product.productAll");
		return list;
	}
	public List<Product> category(String category) { 
		List<Product> list = sqlSession.selectList("mybatis.mapper.product.category",category);
		return list;
	}
	
	public int seqNumber() { 
		return sqlSession.selectOne("mybatis.mapper.product.seqNumber");
	}
	
	public int updateProductNumber(int option_join_number) { 
		return sqlSession.selectOne("mybatis.mapper.product.updateProductNumber",option_join_number);
	}
	
	public void insertProduct(Product product) { 
		sqlSession.insert("mybatis.mapper.product.insertProduct",product);
	}
	

	public int selectJoinNumber(String name) { 
		return sqlSession.selectOne("mybatis.mapper.product.selectJoinNumber",name);
	}
	
	public void insertOption(Option option) { 
		sqlSession.insert("mybatis.mapper.option.insertOption",option);
	}
	
	public Product productSelect(int num) { 
		return sqlSession.selectOne("mybatis.mapper.product.productSelect",num);
	}
	
	public List<Option> productOptionSelect(int num) { 
		 List<Option> list =  sqlSession.selectList("mybatis.mapper.option.productOptionSelect",num);
		 return list;
	}
	
	public List<Category> categoryAll() { 
		List<Category> list = sqlSession.selectList("mybatis.mapper.category.categoryAll");
		return list;
	}
	
	public List<Qna> qnaList(long product_number){
		List<Qna> list = sqlSession.selectList("mybatis.mapper.qna.qnaList", product_number);
		return list;
	}
	
	public void updateProduct(Product product) { 
		sqlSession.update("mybatis.mapper.product.updateProduct",product);
	}
	
	public void updateOption(Option option) { 
		sqlSession.update("mybatis.mapper.option.updateOption",option);
	}
	
	public void optionDelete(Option option) { 
		sqlSession.update("mybatis.mapper.option.optionDelete",option);
	}
	
	public ProductDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public long productNum(int num) {
		return sqlSession.selectOne("mybatis.mapper.product.productNum",num);
	}
	
}
