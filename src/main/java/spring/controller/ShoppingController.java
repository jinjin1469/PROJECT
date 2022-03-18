package spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.dao.ShoppingDao;
import spring.service.ShoppingService;
import spring.vo.AuthInfo;
import spring.vo.Cart;
import spring.vo.Member;
import spring.vo.Product;
import spring.vo.RegisterRequest;

@Controller
public class ShoppingController {

	@Autowired
	ShoppingDao dao;

	@Autowired
	private ShoppingService shoppingService;

	public void setShoppingService(ShoppingService shoppingService) {
		this.shoppingService = shoppingService;
	}
	
	//�옣諛붽뎄�땲 �긽�뭹�벑濡�
	@RequestMapping(value="/product/add_cart",method=RequestMethod.POST)
	public String modifyPwdFor(Cart cart, Model model, HttpServletResponse response) {
		
		shoppingService.myCart(cart);
		
		return "PRODUCT/productDetail";
	}
		 

}
