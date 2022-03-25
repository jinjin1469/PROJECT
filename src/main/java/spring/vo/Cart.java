package spring.vo;

import java.util.ArrayList;



public class Cart {
	
	private String option_name;
	private int option_price;
	private long cart_number;
	private long optionlist_number;
	private long option_number;
	private int option_selectCount;
	private Long member_number;
	private String member_name;
	private Long product_number;
	private String product_name;
	private int product_price;
	private int product_selectCount;
	private String product_m_image;
	private int money;
	private int sumoption;
	private long cartoption_number;
	private ArrayList<CartOption> change_option;
	private ArrayList<CartOption> optionList;
	
	public ArrayList<CartOption> getChange_option() {
		return change_option;
	}
	public void setChange_option(ArrayList<CartOption> change_option) {
		this.change_option = change_option;
	}
	
	public int getSumoption() {
		return sumoption;
	}
	public void setSumoption(int sumoption) {
		this.sumoption = sumoption;
	}
	
	public String getOption_name() {
		return option_name;
	}
	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}
	public int getOption_price() {
		return option_price;
	}
	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}
	
	public long getOptionlist_number() {
		return optionlist_number;
	}
	public void setOptionlist_number(long optionlist_number) {
		this.optionlist_number = optionlist_number;
	}
	
	public long getOption_number() {
		return option_number;
	}
	public void setOption_number(long option_number) {
		this.option_number = option_number;
	}
	public long getCart_number() {
		return cart_number;
	}
	public void setCart_number(long cart_number) {
		this.cart_number = cart_number;
	}
	public int getOption_selectCount() {
		return option_selectCount;
	}
	public void setOption_selectCount(int option_selectCount) {
		this.option_selectCount = option_selectCount;
	}
	public Long getMember_number() {
		return member_number;
	}
	public void setMember_number(Long member_number) {
		this.member_number = member_number;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public Long getProduct_number() {
		return product_number;
	}
	public void setProduct_number(Long product_number) {
		this.product_number = product_number;
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
	public int getProduct_selectCount() {
		return product_selectCount;
	}
	public void setProduct_selectCount(int product_selectCount) {
		this.product_selectCount = product_selectCount;
	}
	public String getProduct_m_image() {
		return product_m_image;
	}
	public void setProduct_m_image(String product_m_image) {
		this.product_m_image = product_m_image;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public long getCartoption_number() {
		return cartoption_number;
	}
	public void setCartoption_number(long cartoption_number) {
		this.cartoption_number = cartoption_number;
	}
	public ArrayList<CartOption> getOptionList() {
		return optionList;
	}
	public void setOptionList(ArrayList<CartOption> optionList) {
		this.optionList = optionList;
	}
	
	

}
