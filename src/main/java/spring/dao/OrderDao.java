package spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.vo.CartOption;
import spring.vo.Category;
import spring.vo.Member;
import spring.vo.Option;
import spring.vo.Order;
import spring.vo.OrderSub;
import spring.vo.Product;
import spring.vo.Qna;

public class OrderDao {
	
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void paymentWait(OrderSub orderSub) {
    	sqlSession.update("mybatis.mapper.shopping.paymentWait", orderSub);
    }
	
	public long membershipPoint(long member_number) { 
		return sqlSession.selectOne("mybatis.mapper.order.membershipPoint",member_number);
	}
	
	public List<OrderSub> productList(long member_number) { 
		List<OrderSub> list = sqlSession.selectList("mybatis.mapper.orderSub.productList",member_number);
		return list;
	}
	
	public List<Option> optionList(int cartoption_number) { 
		List<Option> list = sqlSession.selectList("mybatis.mapper.option.optionList",cartoption_number);
		return list;
	}
	public Member selectByMemberNum(long member_number) {
		Member member = sqlSession.selectOne("mybatis.mapper.member.selectByMemberNum", member_number);
		return member;
	}

	
	public void productCountUpdate(OrderSub orderSub) {
		sqlSession.update("mybatis.mapper.order.productCountUpdate", orderSub);
	}
	
	public void paymentCancel(long member_number) {
		sqlSession.update("mybatis.mapper.order.paymentCancel", member_number);
	}
	
	public void insertOrder(Order order) {
		sqlSession.insert("mybatis.mapper.order.insertOrder", order);
	}
	
	public void deleteCart(int cartoption_number) {
        sqlSession.delete("mybatis.mapper.order.deleteCart", cartoption_number);
    }
	
	public void deleteCartOption(int cartoption_number) {
        sqlSession.delete("mybatis.mapper.order.deleteCartOption", cartoption_number);
    }
	
	public int order_join_number(String imp_uid) { 
		return sqlSession.selectOne("mybatis.mapper.order.order_join_number",imp_uid);
	}
	
	public void insertProductList(OrderSub orderSub) {
		sqlSession.insert("mybatis.mapper.order.insertProductList", orderSub);
	}
	public int option_join_number(int order_join_number) { 
		return sqlSession.selectOne("mybatis.mapper.order.option_join_number",order_join_number);
	}
	
	public String search_uid(int orderNum) { 
		return sqlSession.selectOne("mybatis.mapper.order.search_uid",orderNum);
	}
	
	public String payment_status(int orderNum) { 
		return sqlSession.selectOne("mybatis.mapper.order.payment_status",orderNum);
	}
	
	public void insertOptionList(Option option) {
		sqlSession.insert("mybatis.mapper.order.insertOptionList", option);
	}
	
	public void pointDeduction(Order order) {
		sqlSession.update("mybatis.mapper.order.pointDeduction", order);
	}
	
	public void pointRollBack(Order order) {
		sqlSession.update("mybatis.mapper.order.pointRollBack", order);
	}
	
	public List<Order> selectOrderinfo(long member_number) { 
		List<Order> list = sqlSession.selectList("mybatis.mapper.order.selectOrderinfo",member_number);
		return list;
	}
	public Order orderinfo(int orderNum) {
		return sqlSession.selectOne("mybatis.mapper.order.orderinfo",orderNum);
	}
	
	public void productDeduction(OrderSub orderSub) {
		sqlSession.update("mybatis.mapper.order.productDeduction", orderSub);
	}
	
	public void productRollBack(OrderSub orderSub) {
		sqlSession.update("mybatis.mapper.order.productRollBack", orderSub);
	}
	
	public void optionDeduction(Option option) {
		sqlSession.update("mybatis.mapper.order.optionDeduction", option);
	}
	
	public void optionRollBack(Option option) {
		sqlSession.update("mybatis.mapper.order.optionRollBack", option);
	}
	
	public void payment_status_edit(int orderNum) {
		sqlSession.update("mybatis.mapper.order.payment_status_edit", orderNum);
	}
	
	public String recipient(long member_number) { 
		return sqlSession.selectOne("mybatis.mapper.order.recipient",member_number);
	}
	public String recipient_phone(long member_number) { 
		return sqlSession.selectOne("mybatis.mapper.order.recipient_phone",member_number);
	}
	public String recipient_address(long member_number) { 
		return sqlSession.selectOne("mybatis.mapper.order.recipient_address",member_number);
	}
	public List<OrderSub> productListinfo(int order_join_number) { 
		return sqlSession.selectList("mybatis.mapper.orderSub.productListinfo",order_join_number);
	}
	public List<Option> optionListinfo(int option_join_number) { 
		return sqlSession.selectList("mybatis.mapper.option.optionListinfo",option_join_number);
	}
	
	public OrderDao(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
}
