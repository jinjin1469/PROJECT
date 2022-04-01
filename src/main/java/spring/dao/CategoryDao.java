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
	
	public int categorySeq(Category category) { 
		return sqlSession.selectOne("mybatis.mapper.category.categorySeq",category);
	}
	
	public void categoryInsert(Category category) {
		sqlSession.insert("mybatis.mapper.category.categoryInsert",category);
	}
	
	public void categoryDelete(Category category) {
		sqlSession.delete("mybatis.mapper.category.categoryDelete",category);
	}
	
	public void categorySeqUpdate(Category category) { 
		sqlSession.update("mybatis.mapper.category.categorySeqUpdate",category);
	}
	
	public void productCategoryNameNull1(Category category) { 
		sqlSession.update("mybatis.mapper.category.productCategoryNameNull1",category);
	}
	public void productCategoryNameNull2(Category category) { 
		sqlSession.update("mybatis.mapper.category.productCategoryNameNull2",category);
	}
	public void deleteBysortNumUpdate(int num,String classification) { 
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("classification", classification);
		sqlSession.update("mybatis.mapper.category.deleteBysortNumUpdate",map);
	}
	public List<ProductCategoryEditList> nullCategorySelect(ProductCategoryEdit pce) { 
		List<ProductCategoryEditList> list = sqlSession.selectList("mybatis.mapper.ProductCategoryEditList.nullCategorySelect",pce);
		return list;
	}
	public List<ProductCategoryEditList> categorySelect(ProductCategoryEdit pce) { 
		List<ProductCategoryEditList> list = sqlSession.selectList("mybatis.mapper.ProductCategoryEditList.categorySelect",pce);
		return list;
	}
	
	
	
	public CategoryDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
