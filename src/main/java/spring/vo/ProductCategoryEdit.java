package spring.vo;

import java.util.ArrayList;

public class ProductCategoryEdit {

	public ProductCategoryEdit(){}
	private String classification;
	private String category_title;
	private String category_title_change;
	private String category_1;
	private String category_2;
	private ArrayList<ProductCategoryEditList> category_editList;
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public String getCategory_title() {
		return category_title;
	}
	public void setCategory_title(String category_title) {
		this.category_title = category_title;
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
	public ArrayList<ProductCategoryEditList> getCategory_editList() {
		return category_editList;
	}
	public void setCategory_editList(ArrayList<ProductCategoryEditList> category_editList) {
		this.category_editList = category_editList;
	}
	public String getCategory_title_change() {
		return category_title_change;
	}
	public void setCategory_title_change(String category_title_change) {
		this.category_title_change = category_title_change;
	}
	
	
}
