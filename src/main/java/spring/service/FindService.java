package spring.service;

import java.io.PrintWriter;
import java.util.Properties;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.dao.MemberDao;
import spring.exception.MemberDeactivateAccount;
import spring.exception.MemberNotFoundException;
import spring.vo.Member;

public class FindService {

	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	// 아이디 찾기 실행
	public Member findId(HttpServletResponse response, Member memVo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Member member = dao.findId(memVo);
		if(member == null) {
			throw new MemberNotFoundException();
		}
		else if(member.getMember_state() == 9){
			out.println("<script>");
			out.println("alert('탈퇴한 계정입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		return member;
	}
	
	//임시 비밀번호 전송
	public void sendEmail(Member memVo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; 
		String hostSMTPid = "withmealkit@gmail.com";
		String hostSMTPpwd = "alftbffod^^1234";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "withmealkit@gmail.com";
		String fromName = "밀슐랭";
		String subject = "";
		String msg = "";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.ssl.trust","smtp.gmail.com");

		if(div.equals("findpwd")) {
			subject = "밀슐랭 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: black;'>";
			msg += memVo.getMember_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += memVo.getMember_pwd() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = memVo.getMember_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //네이버 이용시 465 , 구글 465

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
// 비밀번호 찾기 실행
//	public String findPwd(HttpServletResponse response, Member memVo) throws Exception {
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();
//		String id = dao.findPwd(memVo);
//		
//		if (id == null) {
//			out.println("<script>");
//			out.println("alert('가입된 정보가 없습니다.');");
//			out.println("history.go(-1);");
//			out.println("</script>");
//			out.close();
//			return null;
//		} else {
//			return id;
//		}
//	}
//			
	public void findPwd(HttpServletResponse response, Member memVo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Member member = dao.findPw(memVo);
		
		// 가입된 아이디가 없으면
		if(member == null) {
			out.println("<script>");
			out.println("alert('등록되지 않은 정보입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();

		}else if(member.getMember_state() == 9){
			out.println("<script>");
			out.println("alert('탈퇴한 계정입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String member_pwd = "";
			for (int i = 0; i < 12; i++) {
				member_pwd += (char) ((Math.random() * 26) + 97);
			}
			memVo.setMember_pwd(member_pwd);
			// 비밀번호 변경
			dao.updatePw(memVo);
			// 비밀번호 변경 메일 발송
			sendEmail(memVo, "findpwd");
			
			out.println("<script>");
			out.println("alert('임시 비밀번호가 메일로 발송 완료되었습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}

	}
}

