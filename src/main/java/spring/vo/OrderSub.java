package spring.vo;

import java.util.ArrayList;
import java.util.Date;

public class OrderSub {
	
	private int cartoption_number;
	private String product_name;
	private int product_number;
	private int product_count;
	private int product_price;
	private int check_box;
	private ArrayList<Option> option_sub;
	private int cart_number;
	private int option_join_number;
	private int order_join_number;
	private String product_m_image;
	
	public int getCartoption_number() {
		return cartoption_number;
	}
	public void setCartoption_number(int cartoption_number) {
		this.cartoption_number = cartoption_number;
	}
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public int getCheck_box() {
		return check_box;
	}
	public void setCheck_box(int check_box) {
		this.check_box = check_box;
	}
	public ArrayList<Option> getOption_sub() {
		return option_sub;
	}
	public void setOption_sub(ArrayList<Option> option_sub) {
		this.option_sub = option_sub;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getCart_number() {
		return cart_number;
	}
	public void setCart_number(int cart_number) {
		this.cart_number = cart_number;
	}
	public int getOption_join_number() {
		return option_join_number;
	}
	public void setOption_join_number(int option_join_number) {
		this.option_join_number = option_join_number;
	}
	public int getOrder_join_number() {
		return order_join_number;
	}
	public void setOrder_join_number(int order_join_number) {
		this.order_join_number = order_join_number;
	}
	public String getProduct_m_image() {
		return product_m_image;
	}
	public void setProduct_m_image(String product_m_image) {
		this.product_m_image = product_m_image;
	}
	

}
