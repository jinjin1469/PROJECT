package spring.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


import spring.controller.LoginController;
import spring.controller.MainController;
import spring.controller.MemberFindController;
import spring.controller.MemberRegisterController;
import spring.controller.MyPageController;
import spring.dao.MemberDao;
import spring.service.AuthService;
import spring.service.FindService;
import spring.service.ManageService;
import spring.service.MemberRegisterService;


@Configuration
public class ControllerConfig {

	@Autowired
	private MemberDao dao;
	@Autowired
	private MemberRegisterService regSvc;
	@Autowired
	private AuthService authService;
	@Autowired
	private FindService findService;
	@Autowired
	private ManageService manageService;


	@Bean
	public MainController mainController() {
		MainController mController = new MainController();
		mController.setDao(dao);
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
	
//	
//	@Bean
//	public BoardController boardController() {
//		BoardController bController = new BoardController();
//		bController.setDao(dao);
//		return bController;
//	}
//	
//	@Bean
//	public MemberManageController memberManageController() {
//		MemberManageController mmController = new MemberManageController();
//		mmController.setDao(dao);
//		return mmController;
//	}
//	
//	@Bean
//	public MemberEditController memberEditController() {
//		MemberEditController meController = new MemberEditController();
//		meController.setDao(dao);
//		meController.setMemberRegisterService(regSvc);
//		return meController;
//	}
//	
//	@Bean
//	public QnaManageController qnaManageController() {
//		QnaManageController qController = new QnaManageController();
//		qController.setDao(dao);
//		return qController;
//	}
//	
//	@Bean
//	public CommentController commentController() {
//		CommentController cController = new CommentController();
//		cController.setDao(dao);
//		return cController;
//	}
	
//	@Bean // 사용할 인터셉터 빈
//	public AuthCheckIntercepter authCheckIntercepter() {
//		return new AuthCheckIntercepter();
//	}
}
