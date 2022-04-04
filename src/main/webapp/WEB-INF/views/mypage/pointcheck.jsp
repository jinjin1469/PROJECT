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
	<p><strong>쇼핑정보</strong></p>
	<hr>
		<p><a href="<c:url value='/mypage/orderStatus' />" class="menu">주문내역</a></p>
		<p><a href="<c:url value='/mypage/pointStatus' />" class="menu">포인트현황</a></p>
		<p><a href="<c:url value='/member/login' />" class="menu">장바구니</a></p>
		<p><a href="<c:url value='/member/login' />" class="menu">오늘본상품</a></p>
	<br>
	<p><strong>쇼핑문의</strong></p>
	<hr>
		<p><a href="<c:url value='#' />" class="menu">내 1:1 문의</a></p>
		<p><a href="<c:url value='/member/login' />" class="menu">리뷰 모아보기</a></p>
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
<c:if test="${!empty msg}">
	<script> 
		alert('잘못된 접근입니다.');
	</script>
</c:if>
		<h2>포인트현황📃</h2>
		<hr>
		<c:if test="${!empty memberPoint}">
			<div style="float:right;">현재 포인트 : ${memberPoint}</div>
			<br>
		</c:if>
		<table class="tbl">
			<tr>
				<th>날짜</th>
				<th>포인트차감</th>
				<th>포인트적립</th>
				<th>주문상세</th>
				<th>비고</th>
			</tr>
			<c:if test="${empty info}">
			<tr>
				<td colspan="4">주문 내역이 없습니다.</td>
			</tr>
			</c:if>
			<c:if test="${!empty info}">
				<c:forEach var="list" items="${info}">
					<tr>
						<td><fmt:formatDate value="${list.order_regdate}" pattern="yyyy-MM-dd" /></td>
						<td><c:if test="${list.use_point==0}">-</c:if>
						<c:if test="${list.use_point!=0}">
						<fmt:formatNumber value="${list.use_point}" pattern="#,###,###"/>
						</c:if>
						</td>
						<td><c:if test="${list.earn_point==0}">-</c:if>
						<c:if test="${list.earn_point!=0}">
						<fmt:formatNumber value="${list.earn_point}" pattern="#,###,###"/>
						</c:if>
						</td>
						<td><a href="javascript:orderDetail(${list.order_number});">상세보기</a></td>
						<c:choose>
							<c:when test="${list.order_status=='배송준비중'}">
								<td>주문확정시 적립[배송준비중]</td>
							</c:when>
							<c:when test="${list.order_status=='주문취소'}">
								<td>주문취소[포인트원복]</td>
							</c:when>
							<c:when test="${list.order_status=='관리자주문취소'}">
								<td>주문취소[포인트원복]</td>
							</c:when>
							<c:when test="${list.order_status=='배송완료'}">
								<td>주문확정시 적립[배송완료]</td>
							</c:when>
							<c:when test="${list.order_status=='구매확정'}">
								<td>적립완료</td>
							</c:when>
						</c:choose>
					</tr>
				</c:forEach>
			</c:if>	
		</table>
		<c:if test="${totalCnt != null}">
			<c:choose>
				<c:when test="${totalCnt>150}">
					<c:if test="${(section)*150<totalCnt}">
						<c:forEach var="page" begin="1" end="10" step="1">
							<c:if test="${section > 1 && page==1}">
								<a href="?section=${section-1}&pageNum=10"> ⏪ </a>
							</c:if>
								<a href="?section=${section}&pageNum=${page}">${(section-1)*10+page}</a>
							<c:if test="${page==10}">
								<a href="?section=${section+1}&pageNum=1"> ⏩ </a>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${(section)*150>totalCnt}">
						<c:forEach var="page" begin="1" end="${((totalCnt+14)-(section-1)*150)/10}" step="1">
							<c:if test="${section > 1 && page==1}">
								<a href="?section=${section-1}&pageNum=10"> ⏪ </a>
							</c:if>
								<a href="?section=${section}&pageNum=${page}">${(section-1)*10+page}</a>
						</c:forEach>
					</c:if>
				</c:when>
				<c:when test="${totalCnt==150}"> 
					<c:forEach var="page" begin="1" end="10" step="1">
						<a href="?section=${section}&pageNum=${page}">${page}</a>
					</c:forEach>
				</c:when>
				<c:when test="${totalCnt<150}">
					<c:forEach var="page" begin="1" end="${(totalCnt+14)/15}" step="1">
						<a href="?section=${section}&pageNum=${page}">${page}</a>
					</c:forEach>
				</c:when>
			</c:choose>
		</c:if>
		<br>
		<br>

</section>
	
	
	
</div>

<script>
function orderDetail(order_number){
	window.open('/order/orderDetail/'+order_number,'주문 상세보기',"width=500,height=800,top=200,left=200,toolbar=no,menubar=no,scrollbars=no,status=no");
}
function review(order_number){
	open('/order/review/'+order_number,'리뷰 쓰기','width=300px,height=300px,status=false');
}
</script>
<br>
<br>

<%@include file="../footer.jsp"%>

</body>
</html>