package spring.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import spring.controller.CategoryController;
import spring.controller.LoginController;
import spring.controller.MainController;
import spring.controller.MemberFindController;
import spring.controller.MemberRegisterController;
import spring.controller.MyPageController;
import spring.controller.NoticeController;
import spring.controller.PaymentController;
import spring.controller.ProductController;
import spring.dao.MemberDao;
import spring.dao.NoticeDao;
import spring.dao.ProductDao;
import spring.service.AuthService;
import spring.service.FindService;
import spring.service.ManageService;
import spring.service.MemberRegisterService;


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
	private NoticeDao ndao;
	@Autowired
	private ProductDao pdao;
	


	@Bean
	public MainController mainController() {
		MainController mController = new MainController();
		mController.setDao(mdao);
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
		cController.setDao(pdao);
		return cController;
	}
	
	@Bean
	public PaymentController paymentController() {
		PaymentController payController = new PaymentController();

		return payController;
	}

}

	
