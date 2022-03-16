package spring.service;

import org.springframework.beans.factory.annotation.Autowired;

import spring.dao.MemberDao;
import spring.dao.ShoppingDao;
import spring.exception.AlreadyExistingMemberException;
import spring.vo.Cart;
import spring.vo.Member;
import spring.vo.Product;
import spring.vo.RegisterRequest;

public class ShoppingService {
	
	@Autowired
	private ShoppingDao dao;

	public void setDao(ShoppingDao dao) {
		this.dao = dao;
	} 
	
	//카트에 상품 등록
	public void myCart(Cart cart) {
//		Cart newPo = dao.insertCart(cart.getProduct_number(), cart.getProduct_m_image(), cart.getProduct_price(), 
//								  cart.getProduct_selectCount(), cart.getProduct_name());
		dao.insertCart(cart);
		
	}
}
