package spring.vo;

public class Option {

	private int option_number;
	private int option_Join_Number;
	private String option_Name;
	private int option_Price;
	private int option_Count;	
	private int option_salcount;
	private int delete_check;
	
	
	public Option() {}
	public Option(int option_number, int option_Join_Number, String option_Name, int option_Price, int option_Count,
			int option_salcount) {
		this.option_number = option_number;
		this.option_Join_Number = option_Join_Number;
		this.option_Name = option_Name;
		this.option_Price = option_Price;
		this.option_Count = option_Count;
		this.option_salcount = option_salcount;
	}
	
	

	public int getDelete_check() {
		return delete_check;
	}
	public void setDelete_check(int delete_check) {
		this.delete_check = delete_check;
	}
	public int getOption_salcount() {
		return option_salcount;
	}

	public void setOption_salcount(int option_salcount) {
		this.option_salcount = option_salcount;
	}

	public int getOption_number() {
		return option_number;
	}
	
	public void setOption_number(int option_number) {
		this.option_number = option_number;
	}

	public int getOption_Join_Number() {
		return option_Join_Number;
	}
	public void setOption_Join_Number(int option_Join_Number) {
		this.option_Join_Number = option_Join_Number;
	}
	public String getOption_Name() {
		return option_Name;
	}
	public void setOption_Name(String option_Name) {
		this.option_Name = option_Name;
	}
	public int getOption_Price() {
		return option_Price;
	}
	public void setOption_Price(int option_Price) {
		this.option_Price = option_Price;
	}
	public int getOption_Count() {
		return option_Count;
	}
	public void setOption_Count(int option_Count) {
		this.option_Count = option_Count;
	}
	@Override
	public String toString() {
		
		return this.option_Name;
	}
	
}
