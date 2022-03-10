<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/mypage.css">
<title>ADMIN</title>
<style>


.menu{
	text-align: left;
	font-size: 12px;
	margin: 0 auto;
	padding: 0px;
	color: #696969;
}


</style>


</head>
<body>
<%@include file="../header.jsp"%>
<br>
<br>
<div id="content"> 

<aside>
<div class="menu">
	<p><strong>상품관리</strong></p>
	<hr>
		<p><a href="<c:url value='/product/insert' />" class="menu">상품등록</a></p>
		<p><a href="<c:url value='/member/login' />" class="menu">상품전체보기</a></p>
		<p><a href="<c:url value='/member/login' />" class="menu">장바구니</a></p>
		<p><a href="<c:url value='/member/login' />" class="menu">오늘본상품</a></p>
	<br>
	<p><strong>쇼핑관리</strong></p>
	<hr>
		<p><a href="<c:url value='/member/login' />" class="menu">1:1게시판</a></p>
		<p><a href="<c:url value='/member/login' />" class="menu">리뷰 모아보기</a></p>
		<p><a href="<c:url value='/notice/main' />" class="menu">F&Q</a></p>
	<br>
	<p><strong>회원관리</strong></p>
	<hr>
		<p><a href="<c:url value='/mypage/modify/${member.member_number}' />" class="menu">회원정보변경</a></p>
		<p><a href="<c:url value='/member/login' />" class="menu">회원정보 탈퇴신청</a></p>
</div>
</aside>

<section>

		<h2>MYPAGE📃</h2>
		<hr>
		
			<div class="user">
			<p class="green"><strong>${member.member_name}[${member.member_id}]님</strong><p>
			<p>전 화 : ${member.member_phone}</p>
			<p>이메일 : ${member.member_email}</p>
			<p>주 소 : ${member.member_address}</p>
			</div>
			<div class="order"></div>

		
		<table class="tbl">
			<tr>
				<th>주문일자</th>
				<th>상품명</th>
				<th>결제금액</th>
				<th>주문상세</th>
			</tr>
			<tr>
				<td colspan="4">주문 내역이 없습니다.</td>
			</tr>
		</table>
		
		<table class="tbl">
			<tr>
				<th>등록일자</th>
				<th>리뷰 내용</th>
				<th>상품명</th>
			</tr>
			<tr>
				<td colspan="3">작성한 리뷰가 없습니다.</td>
			</tr>
		</table>
		

</section>
	
	
	
</div>


<br>
<br>
<%@include file="../footer.jsp"%>
</body>
</html>