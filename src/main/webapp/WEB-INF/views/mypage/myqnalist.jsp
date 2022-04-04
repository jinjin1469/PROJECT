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
<link rel="stylesheet" href="../../../resources/css/mypage.css">
<title>내 질문 모아보기</title>
<style>
.menu{
	text-align: left;
	font-size: 12px;
	margin: 0 auto;
	padding: 0px;
	color: #696969;
}
.th-2{border-bottom: 0.7px solid #DCDCDC;}
table {
	align-items: center;
	margin: 0 auto;
	text-align: center;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	width: 900px;
	font-size: 13px;
	text-align: left;
}

th, td {
	border-bottom: 1px solid #444444;
	text-align: center;
}

.th-1{width: 400px; height:40px;border-bottom: 1px solid #E6E6E6;}

.td-1{height:40px;
border-bottom: 1px solid #E6E6E6;}

th {
	background-color: #F5F5F5;
}

.line{border:none; margin: 4px;}
</style>
</head>
<body>
<%@include file="../header.jsp"%>
<br>
<br>
<div id="content"> 

	<aside>
	<div class="menu">
		<p><strong>쇼핑정보</strong></p>
		<hr>
			<p><a href="<c:url value='/mypage/orderStatus' />" class="menu">주문내역</a></p>
			<p><a href="<c:url value='/member/login' />" class="menu">포인트내역</a></p>
			<p><a href="<c:url value='/product/cart/list.do' />" class="menu">장바구니</a></p>
			<p><a href="<c:url value='/member/login' />" class="menu">오늘본상품</a></p>
		<br>
		<p><strong>쇼핑문의</strong></p>
		<hr>
			<p><a href="<c:url value='/mppage/myqnalist' />" class="menu">1:1게시판</a></p>
			<p><a href="<c:url value='/mypage/myreviewlist' />" class="menu">내 리뷰 모아보기</a></p>
			<p><a href="<c:url value='/notice/main' />" class="menu">F&Q</a></p>
		<br>
		<p><strong>회원정보</strong></p>
		<hr>
			<p><a href="<c:url value='/mypage/modify/${member.member_number}' />" class="menu">회원정보변경</a></p>
			<p><a href="<c:url value='/mypage/modifyPwd/${member.member_number}' />" class="menu">비밀번호변경</a></p>
			<p><a href="<c:url value='/member/login' />" class="menu">회원탈퇴</a></p>
	</div>
	</aside>

<section>
	<h2>내 질문 모아보기</h2>
	
			<hr class="line">
	
		 		  <table>
			 		  	<tr>
			 		  		<th class="th-2">답변 등록 상태</th>
			 		  		<th class="th-2">상품이름</th>
			 		  		<th class="th-1">제목</th>
			 		  		<th class="th-2">작성자</th>
			 		  		<th class="th-2">작성일</th>
			 		 	</tr>
			 		 	<c:forEach var="qna" items="${qna}" varStatus="status">
			 		 	<tr>
			 		 		<td class="td-1">${qna.qna_state}</td>
			 		 		<td class="td-1">${qna.product_name}</td>
			 		 		<td class="td-1">
			 		 			<input type="hidden" name="qna_number" id="qna_number" value="${qna.qna_number}">
			 		 			<a href="<c:url value='/product/qna/${qna.qna_number}' />" >${qna.qna_title}</a>
			 		 		 </td>
			 		 		<td class="td-1">${qna.member_nickname}</td>
			 		 		<td class="td-1">${qna.qna_regdate}</td>
			 		 	</tr>
			 					
			 		 	</c:forEach>
		 		  </table>


</section>





</div>
<br>
<br>
<%@include file="../footer.jsp"%>
</body>
</html>