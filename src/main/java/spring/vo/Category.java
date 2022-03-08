package spring.vo;

public class Category {

	private int category_number;
	private int menu_join_number;
	private String category_title;
	private int category_sort;
	
	
	public int getMenu_join_number() {
		return menu_join_number;
	}
	public void setMenu_join_number(int menu_join_number) {
		this.menu_join_number = menu_join_number;
	}
	public String getCategory_title() {
		return category_title;
	}
	public void setCategory_title(String category_title) {
		this.category_title = category_title;
	}
	public int getCategory_number() {
		return category_number;
	}
	public void setCategory_number(int category_number) {
		this.category_number = category_number;
	}
	public int getCategory_sort() {
		return category_sort;
	}
	public void setCategory_sort(int category_sort) {
		this.category_sort = category_sort;
	}
	
	
}
