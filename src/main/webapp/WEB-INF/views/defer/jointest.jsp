<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../../../resources/jquery/jquery-3.6.0.js"></script>
<title>Insert title here</title>
</head>
<body>
		<h2>회원가입</h2>
			
	<form:form action="register" commandName="formData" onsubmit="return checkform()">

		<table>
			<tr>
				<td colspan="5">회원기본정보</td>

			</tr>
			<tr>
				<td>아이디</td>
				<td colspan="4"><form:input path="member_id"/>
			<form:errors path="member_id"/></td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td colspan="4"><form:password path="member_pwd"/>
								<form:errors path="member_pwd"/>
					4~12자리의 영문 대소문자와 숫자로만 입력</td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td colspan="5"><input type="password" id="rePassword"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td colspan="3"><form:input path="member_name"/>
								<form:errors path="member_name"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><form:input path="member_email"/>
			
			<input name="email1" type="text"> @
			 <input name="email2" type="text">
			  <select name="select_email"
					onChange="selectEmail(this)">
						<option value="" selected>선택하세요</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.com">hanmail.com</option>
						<option value="1">직접입력</option>
				</select></td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td colspan="3"><input type="text" name="phone" id="phone"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="4"><input type="text" id="text"></td>
			</tr>


		</table>

		<p align="center">
			<input type="submit" value="회원가입"> <input type="reset"
				value="다시입력">
		</p>

	</form:form>

	<script>
		//이메일 선택
		function selectEmail(ele) {
			var $ele = $(ele);
			var $email2 = $('input[name=email2]');
			// '1'인 경우 직접입력 
			if ($ele.val() == "1") {
				$email2.attr('readonly', false);
				$email2.val('');
			} else {
				$email2.attr('readonly', true);
				$email2.val($ele.val());
			}
		}

		function checkform() {
			// event.preventDefault();

			var idtext = document.getElementById("member_id");
			var patext = document.getElementById("member_pwd");
			var cpatext = document.getElementById("rePassword");
			var mtext = document.getElementById("member_email");
			var nametext = document.getElementById("member_name");

			var id = idtext.value;
			var password = patext.value;
			var cpassword = cpatext.value;
			var mail = mtext.value;
			var name = nametext.value;

			var regExp1 = /^[a-zA-Z0-9]{4,12}$/;
			//id와 비밀번호의 유효성 검사
			var regExp2 = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
			//e-mail의 유효성 검사
			var regname = /^[가-힝]{2,}$/;
			//이름의 유효성 검사

			if (!regExp1.test(idtext.value)) {

				alert("형식에 맞춰서 ID를 입력하십시오");
				idtext.value = "";
				idtext.focus();
				return false;
			}
			if (!regExp1.test(patext.value)) {
				alert("형식에 맞춰서 PW를 입력하십시오");
				patext.value = "";
				patext.focus();
				return false;
			}
			if (!(cpassword.slice(0, cpassword.length) === password.slice(0,
					password.length))) {
				alert("비밀번호가 일치 하지않습니다.");
				cpatext.value = "";
				cpatext.focus();
				return false;
			}
			if ((cpassword.slice(0, cpassword.length) === id
					.slice(0, id.length))) {
				alert("비밀번호가 ID가 동일합니다.");
				patext.value = "";
				patext.focus();
				cpatext.value = "";
				cpatext.focus();
				return false;
			}
			if (!regExp2.test(mtext.value)) {
				alert("이메일 형식을 다시 확인해주세요.");
				mtext.value = "";
				mtext.focus();
				return false;
			}
			if (!regname.test(nametext.value)) {
				alert("이름의 형식이 옳바르지 않습니다.");
				nametext.value = "";
				nametext.focus();
				return false;
			}

		}
	</script>

</body>
</html>