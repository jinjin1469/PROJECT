package spring.vo;

import java.util.List;

public class CategoryCommand {

	private int category_number;
	private List<String> category_title;
	private String classification;
	private List<Integer> category_sort;
	public int getCategory_number() {
		return category_number;
	}
	public void setCategory_number(int category_number) {
		this.category_number = category_number;
	}
	public List<String> getCategory_title() {
		return category_title;
	}
	public void setCategory_title(List<String> category_title) {
		this.category_title = category_title;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public List<Integer> getCategory_sort() {
		return category_sort;
	}
	public void setCategory_sort(List<Integer> category_sort) {
		this.category_sort = category_sort;
	}
	
}
