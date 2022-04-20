package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.MemberDao;
import spring.dao.ShoppingDao;
import spring.exception.AlreadyExistingMemberException;
import spring.vo.Cart;
import spring.vo.CartOption;
import spring.vo.Member;
import spring.vo.Product;
import spring.vo.RegisterRequest;

@Service
public class ShoppingService {
	
	@Autowired
	private ShoppingDao dao;

	public void setDao(ShoppingDao dao) {
		this.dao = dao;
	} 

    public List<Cart> cartMoney() {
        return null;
    }
    
    public long waitingPayment(long member_number) {
        return dao.waitingPayment(member_number);
    }

    //移댄듃�뿉 ���옣
    public void insert(Cart cart) {
        dao.insert(cart);
    }
 
    //移댄듃 紐⑸줉 異쒕젰
    public List<Cart> listCart(long member_number) {
        return dao.listCart(member_number);
    }
    
	/*
	 * public List<CartOption> listOptionCart(long cartoption_number){ return
	 * dao.listOptionCart(cartoption_number); }
	 */
    public void delete(long cart_number) {
        dao.delete(cart_number);
    }
 

    public void deleteAll(long member_number) {
        dao.deleteAll(member_number);
    }
 

    public void update(long cart_number) {
        // TODO Auto-generated method stub
 
    }
 
    //移댄듃�뿉 �떞湲� �젅肄뷀듃 �빀怨�
    public int sumMoney(long member_number) {
        return dao.sumMoney(member_number);
    }
 

    public int countCart(long member_number, long product_number) {
        // TODO Auto-generated method stub
        return 0;
    }
 

    public void updateCart(Cart cart) {
        // TODO Auto-generated method stub
 
    }

    public void modifyCart(Cart cart) {
        dao.modifyCart(cart);
    }
 
	public void deleteChecked(long cart_number) {
		dao.deleteChecked(cart_number);
	}
	
	
}
