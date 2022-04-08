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
.th-1{width:300px;}
.th-2{width:400px;}
.th-3{width:200px;}


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
		<p><a href="<c:url value='/product/insert'/>" class="menu">상품등록</a></p>
		<p><a href="<c:url value='/product/totalList' />" class="menu">상품전체보기</a></p>
		
	<br>
	<p><strong>쇼핑관리</strong></p>
	<hr>

		<p><a href="<c:url value='/mypage/qnalist' />" class="menu">1:1 문의 모아보기</a></p>
		<p><a href="<c:url value='/admin/orderStatus' />" class="menu">배송관리</a></p>
		<p><a href="<c:url value='/admin/adminReviewList' />" class="menu">리뷰 모아보기</a></p>
		<p><a href="<c:url value='/notice/main' />" class="menu">F&Q</a></p>
	<br>
	<p><strong>매출관리</strong></p>
	<hr>
		<p><a href="<c:url value='/admin/totalSales' />" class="menu">전체매출</a></p>
		<p><a href="<c:url value='/admin/categorySales' />" class="menu">카테고리별 매출</a></p>
		<p><a href="<c:url value='/admin/productSales' />" class="menu">상품별 매출</a></p>
		
	<br>

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
		<br>
		<div class="recentBox">*최근 3개 내역에 대한 내용입니다.</div>
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
				<th class="th-1">상품이름</th>
				<th class="th-2">리뷰 내용</th>
				<th class="th-3">등록일자</th>
			</tr>
			<c:if test="${empty list}">
			<tr>
				<td colspan="3">아직 작성한 리뷰가 없습니다.</td>
			</tr>
		</c:if>
	
		<c:if test="${!empty list}">
		<c:forEach var="review" items="${list}">
			<tr>
				<td>${review.product_name}</td>
				<td>${review.review_content}</td>
				<td>${review.review_regdate}</td>
			</tr>
		</c:forEach>
		</c:if>
		</table>
		

</section>
	
	
	
</div>


<br>
<br>
<%@include file="../footer.jsp"%>
</body>
</html>