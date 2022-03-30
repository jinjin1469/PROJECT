package spring.vo;

import java.util.ArrayList;
import java.util.Date;

public class Order {
	
	private int order_number;
	private long member_number;
	private Date order_regdate;
	private long order_price;
	private String recipient;
	private String recipient_phone;
	private String recipient_address;
	private long use_point;
	private long earn_point;
	private String imp_uid;
	private String pay_status;
	private String order_status;
	private int order_join_number;
	private int recipient_check;
	private int delivery_cost;
	
	private ArrayList<OrderSub> order_sub;
	
	public Order() {}
	
	public Order(long member_number, ArrayList<OrderSub> order_sub) {
		this.member_number = member_number;
		this.order_sub = order_sub;
	}

	public int getOrder_number() {
		return order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	public long getMember_number() {
		return member_number;
	}
	public void setMember_number(long member_number) {
		this.member_number = member_number;
	}
	public Date getOrder_regdate() {
		return order_regdate;
	}
	public void setOrder_regdate(Date order_regdate) {
		this.order_regdate = order_regdate;
	}
	public long getOrder_price() {
		return order_price;
	}
	public void setOrder_price(long order_price) {
		this.order_price = order_price;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getRecipient_phone() {
		return recipient_phone;
	}
	public void setRecipient_phone(String recipient_phone) {
		this.recipient_phone = recipient_phone;
	}
	public String getRecipient_address() {
		return recipient_address;
	}
	public void setRecipient_address(String recipient_address) {
		this.recipient_address = recipient_address;
	}
	public long getUse_point() {
		return use_point;
	}
	public void setUse_point(long use_point) {
		this.use_point = use_point;
	}
	public long getEarn_point() {
		return earn_point;
	}
	public void setEarn_point(long earn_point) {
		this.earn_point = earn_point;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public int getOrder_join_number() {
		return order_join_number;
	}
	public void setOrder_join_number(int order_join_number) {
		this.order_join_number = order_join_number;
	}
	public ArrayList<OrderSub> getOrder_sub() {
		return order_sub;
	}
	public void setOrder_sub(ArrayList<OrderSub> order_sub) {
		this.order_sub = order_sub;
	}

	public int getRecipient_check() {
		return recipient_check;
	}

	public void setRecipient_check(int recipient_check) {
		this.recipient_check = recipient_check;
	}

	public int getDelivery_cost() {
		return delivery_cost;
	}

	public void setDelivery_cost(int delivery_cost) {
		this.delivery_cost = delivery_cost;
	}
	
	
	
}
