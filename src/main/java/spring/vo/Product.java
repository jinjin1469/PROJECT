package spring.vo;

import java.util.Date;

public class Product {

	private int product_number;
	private int option_join_number;
	private String product_name;
	private int product_price;
	private int product_count;
	private String product_cookingTime;
	private String product_weight;
	private String product_storage;
	private String product_m_image;
	private String product_d_image;
	private String product_i_image;
	private int product_salcount;
	private Date product_regdate;
	private String category_1;
	private String category_2;
	private int delete_check;
	
	
	public Product() {}
	
	public Product(int option_join_number,String product_name, int product_price, int product_count, String product_cookingTime,
			String product_weight, String product_storage) {
		this.option_join_number = option_join_number;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_count = product_count;
		this.product_cookingTime = product_cookingTime;
		this.product_weight = product_weight;
		this.product_storage = product_storage;
	}
	
	public Product(String product_name, int product_price, int product_count, String product_cookingTime,
			String product_weight, String product_storage) {
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_count = product_count;
		this.product_cookingTime = product_cookingTime;
		this.product_weight = product_weight;
		this.product_storage = product_storage;
	}

	
	public int getOption_join_number() {
		return option_join_number;
	}


	public void setOption_join_number(int option_join_number) {
		this.option_join_number = option_join_number;
	}


	public int getProduct_salcount() {
		return product_salcount;
	}


	public void setProduct_salcount(int product_salcount) {
		this.product_salcount = product_salcount;
	}


	public Date getProduct_regdate() {
		return product_regdate;
	}


	public void setProduct_regdate(Date product_regdate) {
		this.product_regdate = product_regdate;
	}


	public String getCategory_1() {
		return category_1;
	}

	public void setCategory_1(String category_1) {
		this.category_1 = category_1;
	}

	public String getCategory_2() {
		return category_2;
	}

	public void setCategory_2(String category_2) {
		this.category_2 = category_2;
	}
	
	public int getDelete_check() {
		return delete_check;
	}

	public void setDelete_check(int delete_check) {
		this.delete_check = delete_check;
	}

	public int getProduct_number() {
		return product_number;
	}

	public void setProduct_number(int product_number) {
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

	public int getProduct_count() {
		return product_count;
	}

	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}

	public String getProduct_cookingTime() {
		return product_cookingTime;
	}

	public void setProduct_cookingTime(String product_cookingTime) {
		this.product_cookingTime = product_cookingTime;
	}

	public String getProduct_weight() {
		return product_weight;
	}

	public void setProduct_weight(String product_weight) {
		this.product_weight = product_weight;
	}

	public String getProduct_storage() {
		return product_storage;
	}

	public void setProduct_storage(String product_storage) {
		this.product_storage = product_storage;
	}

	public String getProduct_m_image() {
		return product_m_image;
	}

	public void setProduct_m_image(String product_m_image) {
		this.product_m_image = product_m_image;
	}

	public String getProduct_d_image() {
		return product_d_image;
	}

	public void setProduct_d_image(String product_d_image) {
		this.product_d_image = product_d_image;
	}

	public String getProduct_i_image() {
		return product_i_image;
	}

	public void setProduct_i_image(String product_i_image) {
		this.product_i_image = product_i_image;
	}

	
}
