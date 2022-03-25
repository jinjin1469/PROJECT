package spring.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;



import spring.dao.MemberDao;
import spring.dao.QnaDao;
import spring.dao.ReviewDao;
import spring.dao.ShoppingDao;
import spring.service.AuthService;
import spring.service.FindService;
import spring.service.ManageService;
import spring.service.MemberRegisterService;
import spring.service.QnaService;
import spring.service.ReviewService;
import spring.service.ShoppingService;

@Configuration
public class ServiceConfig {


	@Autowired
	private MemberDao dao;
	
	@Autowired
	private ShoppingDao sdao;
	
	@Autowired
	private ReviewDao rdao;
	
	@Autowired
	private QnaDao qdao;
	
	
	@Bean
	public MemberRegisterService memberRegisterService() {
		MemberRegisterService regSvc = new MemberRegisterService(dao);
		return regSvc;
	}

	@Bean
	public AuthService authService() {
		AuthService auth = new AuthService();
		auth.setDao(dao);
		return auth;
	}
	
	@Bean 
	public FindService findService() {
		FindService findService = new FindService();
		findService.setDao(dao);
		return findService;
		
	}
	
	@Bean
	public ManageService manageService() {
		ManageService manageService = new ManageService();
		manageService.setDao(dao);
		return manageService;
	}
	
	@Bean
	public ShoppingService shoppingService() {
		ShoppingService shoppingService = new ShoppingService(); 
		shoppingService.setDao(sdao);
		return shoppingService;
	}
	
	@Bean
	public ReviewService reviewService() {
		ReviewService reviewService = new ReviewService();
		reviewService.setDao(rdao);
		return reviewService;
	}
	
	@Bean
	public QnaService qnaService() {
		QnaService qnaService = new QnaService ();
		qnaService.setDao(qdao);
		return qnaService;
	}
	
}
