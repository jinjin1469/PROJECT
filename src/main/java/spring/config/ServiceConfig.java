package spring.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import spring.dao.MemberDao;
import spring.service.MemberRegisterService;

@Configuration
public class ServiceConfig {


	@Autowired
	private MemberDao dao;
	
	@Bean
	public MemberRegisterService memberRegisterService() {
		MemberRegisterService regSvc = new MemberRegisterService(dao);
		return regSvc;
	}
}
