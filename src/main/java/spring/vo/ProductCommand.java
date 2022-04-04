package spring.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProductCommand {

	private String category_1;
	private String category_2;
	private String product_Name;
	private int option_join_number; 
	private int product_Price;
	private int product_Count;
	private String product_CookingTime;
	private String product_weight;
	private String product_Storage;
	private ArrayList<MultipartFile> uploadFile;
	private ArrayList<Option> product_Option;
	private int option_loop;
	
	public ProductCommand() {}
	
	public ProductCommand(String category_1, String category_2, String product_Name,int option_join_number, int product_Price,
			int product_Count, String product_CookingTime, String product_weight, String product_Storage) {
		this.category_1 = category_1;
		this.category_2 = category_2;
		this.product_Name = product_Name;
		this.option_join_number = option_join_number;
		this.product_Price = product_Price;
		this.product_Count = product_Count;
		this.product_CookingTime = product_CookingTime;
		this.product_weight = product_weight;
		this.product_Storage = product_Storage;
	}
	
	public ProductCommand(String category_1, String category_2, String product_Name,int option_join_number, int product_Price,
			int product_Count, String product_CookingTime, String product_weight, String product_Storage, ArrayList<Option> product_Option,int option_loop) {
		this.category_1 = category_1;
		this.category_2 = category_2;
		this.product_Name = product_Name;
		this.option_join_number = option_join_number;
		this.product_Price = product_Price;
		this.product_Count = product_Count;
		this.product_CookingTime = product_CookingTime;
		this.product_weight = product_weight;
		this.product_Storage = product_Storage;
		this.product_Option = product_Option;
		this.option_loop = option_loop;
	}
	
	public ProductCommand(String category_1, String category_2, String product_Name, int product_Price,
			int product_Count, String product_CookingTime, String product_weight, String product_Storage,
			ArrayList<MultipartFile> uploadFile, ArrayList<Option> product_Option) {
		this.category_1 = category_1;
		this.category_2 = category_2;
		this.product_Name = product_Name;
		this.product_Price = product_Price;
		this.product_Count = product_Count;
		this.product_CookingTime = product_CookingTime;
		this.product_weight = product_weight;
		this.product_Storage = product_Storage;
		this.uploadFile = uploadFile;
		this.product_Option = product_Option;
	}
	
	
	public int getOption_join_number() {
		return option_join_number;
	}

	public void setOption_join_number(int option_join_number) {
		this.option_join_number = option_join_number;
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
	public String getProduct_Name() {
		return product_Name;
	}
	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}
	public int getProduct_Price() {
		return product_Price;
	}
	public void setProduct_Price(int product_Price) {
		this.product_Price = product_Price;
	}
	public int getProduct_Count() {
		return product_Count;
	}
	public void setProduct_Count(int product_Count) {
		this.product_Count = product_Count;
	}
	public String getProduct_CookingTime() {
		return product_CookingTime;
	}
	public void setProduct_CookingTime(String product_CookingTime) {
		this.product_CookingTime = product_CookingTime;
	}
	public String getProduct_weight() {
		return product_weight;
	}
	public void setProduct_weight(String product_weight) {
		this.product_weight = product_weight;
	}
	public String getProduct_Storage() {
		return product_Storage;
	}
	public void setProduct_Storage(String product_Storage) {
		this.product_Storage = product_Storage;
	}
	public ArrayList<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(ArrayList<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public ArrayList<Option> getProduct_Option() {
		return product_Option;
	}
	public void setProduct_Option(ArrayList<Option> product_Option) {
		this.product_Option = product_Option;
	}

	public int getOption_loop() {
		return option_loop;
	}

	public void setOption_loop(int option_loop) {
		this.option_loop = option_loop;
	}
	
	
}
