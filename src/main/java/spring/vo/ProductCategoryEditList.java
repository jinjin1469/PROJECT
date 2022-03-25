package spring.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProductCategoryEditList {
	
	private int product_number;
	private int edit_check;
	private String product_name;
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public int getEdit_check() {
		return edit_check;
	}
	public void setEdit_check(int edit_check) {
		this.edit_check = edit_check;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
}