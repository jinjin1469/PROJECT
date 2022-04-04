package spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.vo.Cart;
import spring.vo.CartOption;
import spring.vo.Option;


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


	 public List<Cart> cartMoney() {
	        return null;
	    }
	

	    public void insert(Cart cart) {
	   
	    sqlSession.insert("mybatis.mapper.shopping.insert", cart); 
	    }
	 
	   
	    public void insertOption(CartOption cartOption) {
	    	 sqlSession.insert("mybatis.mapper.shopping.optioninsert", cartOption); 	
	    }
	    
	    public void updateOption(CartOption cartOption) {
	    	sqlSession.update("mybatis.mapper.shopping.updateOption", cartOption);
	    }
	   
	    
	    public List<Cart> listCart(Long member_number) {
	        return sqlSession.selectList("mybatis.mapper.shopping.listCart", member_number);
	    }
		
	    /*
		 * public List<CartOption> listOptionCart(Long cartoption_number){ return
		 * sqlSession.selectList("mybatis.mapper.shopping.listOptionCart",
		 * cartoption_number); }
		 */
	    
		public List<Cart> listOptionCart(long cartoption_number) { 
			 List<Cart> list =  sqlSession.selectList("mybatis.mapper.shopping.listOptionCart",cartoption_number);
			 return list;
		}
		
	    
	    public void delete(long cart_number) {
	        sqlSession.delete("mybatis.mapper.shopping.delete", cart_number);
	    }
	    


	    public void deleteAll(long member_number) {
	        sqlSession.delete("mybatis.mapper.shopping.deleteAll", member_number);
	    }
	 

	    public void update(long cart_number) {
	        // TODO Auto-generated method stub
	 
	    }
	 

	    public int sumMoney(long member_number) {
	        return sqlSession.selectOne("mybatis.mapper.shopping.sumMoney", member_number); 
	    }
	 

	    public int countCart(long member_num, long product_number) {
	        // TODO Auto-generated method stub
	        return 0;
	    }


	    public void updateCart(Cart cart) {
	        // TODO Auto-generated method stub
	 
	    }
	 

	    public void modifyCart(Cart cart) {
	        sqlSession.update("cart.modify", cart);
	    }
	    
	    
	    public long selectCartNumber() {
	    	return sqlSession.selectOne("mybatis.mapper.shopping.selectNumber");
	    }
	    
	    public long waitingPayment(long member_number) {
	    	return sqlSession.selectOne("mybatis.mapper.shopping.waitingPayment",member_number);
	    }
	    
	    
	    
}
