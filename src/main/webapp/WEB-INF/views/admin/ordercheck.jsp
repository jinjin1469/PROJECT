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
		<p><a href="<c:url value='/product/insert'/>" class="menu">상품등록</a></p>
		<p><a href="<c:url value='/member/login' />" class="menu">상품전체보기</a></p>
		<p><a href="<c:url value='/member/login' />" class="menu">장바구니</a></p>
		<p><a href="<c:url value='/member/login' />" class="menu">오늘본상품</a></p>
	<br>
	<p><strong>쇼핑관리</strong></p>
	<hr>
		<p><a href="<c:url value='/mypage/qnalist' />" class="menu">1:1 문의 모아보기</a></p>
		<p><a href="<c:url value='/admin/orderStatus' />" class="menu">배송관리</a></p>
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
<c:if test="${!empty msg}">
	<script> 
		alert('잘못된 접근입니다.');
	</script>
</c:if>

		<h2>배송대기📃</h2>
		<hr>

		<table class="tbl">
			<tr>
				<th>주문일자</th>
				<th>주문상세</th>
				<th>결제금액</th>
				<th>주문취소</th>
				<th>배송완료시</th>
			</tr>
			<c:if test="${empty orderwaitList}">
			<tr>
				<td colspan="4">주문 내역이 없습니다.</td>
			</tr>
			</c:if>
			<c:if test="${!empty orderwaitList}">
				<c:forEach var="list" items="${orderwaitList}">
					<tr>
						<td><fmt:formatDate value="${list.order_regdate}" pattern="yyyy-MM-dd" /></td>
						<td><a href="javascript:orderDetail(${list.order_number});">상세보기</a></td>
						<td>💲<fmt:formatNumber value="${list.order_price}" pattern="#,###,###"/>원</td>
						<td><a href="/order/adminCancle/${list.order_number}">취소</a></td>
						<td><a href="/admin/delivery/${list.order_number}"><c:if test="${list.order_status=='배송준비중'}">배송</c:if></a></td>
					</tr>
				</c:forEach>
			</c:if>	
		</table>
		<br>
		<br>
		
		<h2>배송완료📃</h2>
		<hr>

		<table class="tbl">
			<tr>
				<th>주문일자</th>
				<th>주문상세</th>
				<th>결제금액</th>
				<th>주문현황</th>
			</tr>
			<c:if test="${empty deliveryCompleteList}">
			<tr>
				<td colspan="4">주문 내역이 없습니다.</td>
			</tr>
			</c:if>
			<c:if test="${!empty deliveryCompleteList}">
				<c:forEach var="list" items="${deliveryCompleteList}">
					<tr>
						<td><fmt:formatDate value="${list.order_regdate}" pattern="yyyy-MM-dd" /></td>
						<td><a href="javascript:orderDetail(${list.order_number});">상세보기</a></td>
						<td>💲<fmt:formatNumber value="${list.order_price}" pattern="#,###,###"/>원</td>
						<td>${list.order_status}</td>
					</tr>
				</c:forEach>
			</c:if>	
		</table>

</section>
	
	
	
</div>

<script>
function orderDetail(order_number){
	window.open('/order/orderDetail/'+order_number,'주문 상세보기',"width=500,height=600,top=200,left=200,toolbar=no,menubar=no,scrollbars=no,status=no");
}



</script>
<br>
<br>

<%@include file="../footer.jsp"%>

</body>
</html>