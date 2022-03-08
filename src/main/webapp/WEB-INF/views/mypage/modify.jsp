<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/join.css">
<title>회원정보 수정</title>
</head>
<style>
input[type="text"], input[type="password"] {
	width: 50%;
	height: 30px;
	border: 0px;
	border-bottom: 1.5px solid gray;
	text-align: left;
}


</style>
<body>
<%@include file="../header.jsp"%>
<br>

	<h2 class="cen">회원 정보 수정🔏</h2>
<br>

	<form name="register" id="signform" action="register" commandName="formData" class="validation-form" method="post">

		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" class="form-control" id="member_name" name="member_name"  value="${member.member_name}"required>
				<br>
				<span class="member_name regex" style="text-align:left;"></span>
				<input type="hidden" id="nameDoubleChk">
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" class="form-control" id="member_nickname" name="member_nickname" 
				placeholder="한글/영문/숫자 포함  2~10자 " value="${member.member_nickname}" required>
				<br>
				<span class="point successNameChk"></span>
				<input type="hidden" id="nicknameDoubleChk"></td>


			</tr>
			<tr>
				<th>아이디</th>
				<td>${member.member_id} <input type="hidden" id="member_id" name="member_id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" class="form-control" id="member_pwd"
					placeholder="영문 /숫자 포함  8~20자 " name="member_pwd" required>
					<div class="member_pwd regex" style="text-align:left;"></div>
					<input type="hidden" id="pwdDoubleChk">
					</td>
				
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" class="form-control" id="rePassword"
					name="rePassword" style="text-align:left;" required>
					<div class="rePassword regex" style="text-align:left;"></div>
					<input type="hidden" id="rePwdDoubleChk">
					</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" id="email" value="" style="width:100px; text-align:left;">
				<span id="middle">@</span>
				<input type="text" name="domain" id="domain" value="" style="width: 100px;"> 
				<select style="width: 100px; margin-right: 10px" name="selectEmail" id="selectEmail">
						<option value="1">직접입력</option>
						<option value="" selected>선택하세요</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="nate.com">nate.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="empas.com">empas.com</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="freechal.com">freechal.com</option>
						<option value="lycos.co.kr">lycos.co.kr</option>
						<option value="korea.com">korea.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmir.com">hanmir.com</option>
						<option value="paran.com">paran.com</option>
					</select>
				<input type="hidden" id="member_email" name="member_email" value="">
				<input type="hidden" id="emailDoubleChk">
				</td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td><input type="text" class="form-control" id="member_phone"
					name="member_phone" placeholder="-를 제외한 숫자만 입력해주세요" style="text-align:left;" 
					value="${member.member_phone}" required>
					<br>
					<span class="member_phone regex" style="text-align:left;"></span>
					<input type="hidden" id="phoneDoubleChk">
					</td>
			</tr>
			<tr>
				<th>주소</th>

			<td><input class="form-control" style="width: 30%; display: inline;" type="text" name="postcode" id="postcode" placeholder="우편번호">
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
				<br>
				 <input class="form-control" type="text" name="address" id="address" style="width: 60%; display: inline; margin-top: 5px;"
					placeholder="도로명 주소" style="text-align:left;"> 
				<br>
				 <input class="form-control" style="width: 40%; display: inline; margin-top: 5px;" type="text"
				id="detailAddress" name="detailAddress" placeholder="상세주소" style="text-align:left;">
				<input type="hidden" name="member_address" id="member_address" value="">
				</td>
		</tr>
		</table>
		<br>
		<button class="btn btn-primary btn-lg btn-block" type="button" id="signupbtn" name="signup">수정하기</button>
	</form>
	<br>
	<br>



<%@include file="../footer.jsp"%>
</body>
</html>