package spring.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import spring.controller.AdminController;
import spring.controller.CategoryController;
import spring.controller.LoginController;
import spring.controller.MainController;
import spring.controller.MemberFindController;
import spring.controller.MemberRegisterController;
import spring.controller.MyPageController;
import spring.controller.NoticeController;
import spring.controller.OrderController;
import spring.controller.PaymentController;
import spring.controller.ProductController;
import spring.controller.QnaController;
import spring.controller.ReviewController;
import spring.controller.ShoppingController;
import spring.dao.AdminDao;
import spring.dao.CategoryDao;
import spring.dao.MemberDao;
import spring.dao.NoticeDao;
import spring.dao.OrderDao;
import spring.dao.ProductDao;
import spring.intercepter.AuthCheckIntercepter;
import spring.intercepter.CategoryIntercepter;
import spring.service.AuthService;
import spring.service.FindService;
import spring.service.ManageService;
import spring.service.MemberRegisterService;
import spring.service.QnaService;
import spring.service.ReviewService;
import spring.service.ShoppingService;


@Configuration
public class ControllerConfig {

	@Autowired
	private MemberDao mdao;
	@Autowired
	private MemberRegisterService regSvc;
	@Autowired
	private AuthService authService;
	@Autowired
	private FindService findService;
	@Autowired
	private ManageService manageService;
	@Autowired
	private ShoppingService shoppingService;
	@Autowired
	private NoticeDao ndao;
	@Autowired
	private ProductDao pdao;
	@Autowired
	private CategoryDao cdao;
	@Autowired
	private OrderDao odao;
	@Autowired
	private AdminDao adao;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private QnaService qnaService;
	

	@Bean
	public MainController mainController() {
		MainController mController = new MainController();
		mController.setDao(pdao);
		return mController;
	}
 	
	@Bean
	public MemberRegisterController memberRegisterController() {
		MemberRegisterController  regCon = new MemberRegisterController ();
		regCon.setMemberRegisterService(regSvc);
		return regCon;
	}

	@Bean
	public LoginController loginController() {
		LoginController loginCon = new LoginController();
		loginCon.setAuthService(authService);
		return loginCon;
	}
	
	@Bean
	public MemberFindController memberFindController() {
		MemberFindController memberFindCon = new MemberFindController();
		memberFindCon.setFindService(findService);
		return memberFindCon;
	}
	
	@Bean
	public MyPageController myPageController() {
		MyPageController myPageController = new MyPageController();
		myPageController.setManageService(manageService);
		myPageController.setDao(odao);		
		return myPageController;
	}
	
	@Bean
	public NoticeController noticeController() {
		NoticeController nController = new NoticeController();
		nController.setDao(ndao);
		return nController;
	}
	
	@Bean
	public ProductController productController() {
		ProductController pController = new ProductController();
		pController.setDao(pdao);
		return pController;
	}
	
	@Bean
	public CategoryController categoryController() {
		CategoryController cController = new CategoryController();
		cController.setDao(cdao);
		return cController;
	}
	
	@Bean
	public PaymentController paymentController() {
		PaymentController payController = new PaymentController();
		payController.setDao(odao);
		return payController;
	}
	
	@Bean
	public AuthCheckIntercepter authCheckIntercepter() {
		 return new AuthCheckIntercepter();
	}
	
	@Bean
	public CategoryIntercepter categoryIntercepter() {
		CategoryIntercepter  category = new CategoryIntercepter();
		category.setDao(cdao);
		 return category;
	}
	
	@Bean
	public ShoppingController shoppingController() {
		ShoppingController shoppingController = new ShoppingController();
		shoppingController.setShoppingService(shoppingService);
		return shoppingController;
	}
	
	
	@Bean
	public ReviewController reviewController() {
		ReviewController reviewController = new ReviewController();
		reviewController.setReviewService(reviewService);
		return reviewController;
	}
	
	@Bean
	public QnaController qnaController() {
		QnaController qnaController = new QnaController();
		qnaController.setQnaService(qnaService);
		return qnaController;
	}
	
	@Bean
	public OrderController orderController() {
		OrderController orderController = new OrderController();
		orderController.setDao(odao);
		return orderController;
	}
	
	@Bean
	public AdminController adminController() {
		AdminController adminController = new AdminController();
		adminController.setDao(adao);
		adminController.setDao(odao);
		return adminController;
	}
}

	
