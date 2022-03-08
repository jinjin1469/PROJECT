package spring.config;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration;

import org.springframework.context.annotation.Configuration;

@Configuration
public class WebConfig {
	
	protected void customizeRegistration(ServletRegistration.Dynamic registration) {
		
		registration.setInitParameter("trowExeptionIfNoHandlerFound", "true");
		
		MultipartConfigElement multipartConfig = new MultipartConfigElement("C:\\upload\\temp", 41943040,83886080,41943040);
		
		// 업로드 파일의 최대 용량
		// 파일데이터를 포함한 전체 요청 최대 크기
		// 메모리에서 파일을 전송할 때 만들어지는 임시 공간의 크기
		
		registration.setMultipartConfig(multipartConfig);
	}

}
