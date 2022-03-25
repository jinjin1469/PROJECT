<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../../../resources/jquery/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="../../../resources/css/qna.css">
<title>Insert title here</title>
<style>

 textarea {
    width: 100%;
    height: 10rem;
    border: none;
    resize: none;
  }
.btn {
	margin-left:1rem;
	width: 300px;
	display: inline-block;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	text-align: center;
	text-decoration: none;
	vertical-align: middle;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
	background-color: transparent;
	border: 1px solid transparent;
	padding: 0.375rem 0.75rem;
	font-size: 0.5rem;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}


.w-100 {
	width: 100% !important;
}

.btn-lg, .btn-group-lg>.btn {
	padding: 0.5rem 1rem;
	font-size: 0.6rem;
	border-radius: 0.3rem;
}

.btn-primary {
	color: #fff;
	background-color: #a4e25e;
	border-color: #d1f779;
	float: right;
    margin-right: 1rem;
    margin-top: -10px;
}
}

.btn-primary:hover {
	color: #fff;
	background-color: #73c431;
	border-color: #1ad123;
}

.ct{padding:0px;}

.a_option{padding:0px;}

.nav-link {
	display: block;
	padding: 0.5rem 1rem;
	color: green;
	text-decoration: none;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out;
}


.name{font-weight:bold;}


</style>
</head>
<body>
<%@include file="../header.jsp" %>
<br>
<br>
<h3>상품질문작성</h3>
<br>
<form:form commandName="Qna" action="qnainsert" method="POST" enctype="multipart/form-data">
<table>

<tr>
	<th><label class="name">문의남기는 상품 이름</label></th>
	
		<td>${product_name}</td>
</tr>
<tr>
	<th>제목</th>
		<td><input type="text" class="title" name="qna_title" id="qna_title"></td>
</tr>
<tr>
	<th>내용</th>
		<td><textarea name="qna_content" id="qna_content"></textarea></td>
</tr>
<tr>
	<th>작성 글 비밀번호</th>
		<td><input type="text" class="pwd" id="qna_pwd" name="qna_pwd"><label class="pwdlabel">*비밀번호는 숫자 4글자로만 설정해주세요.</label>
		<input type="hidden" value="${product_number}" id="product_number" name="product_number"></td>
</tr>
</table>

<br>
<div class="subbtn">
<input type="submit" class="btn3 btn-primary btn-lg btn-block" value="작성하기">
<input type="reset" class="btn3 btn-primary btn-lg btn-block" value="취소하기">
</div>
</form:form>
<br>
<br>
<%@include file="../footer.jsp" %>
</body>
</html>