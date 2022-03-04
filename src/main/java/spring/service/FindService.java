package spring.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;

import spring.dao.MemberDao;

public class FindService {

	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	// 아이디 찾기 실행
	public String findId(HttpServletResponse response, String member_email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = dao.findId(member_email);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
}
