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
		<p><a href="<c:url value='/product/List/totalList' />" class="menu">상품전체보기</a></p>
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
		<c:if test="${totalCntOne != null}">
			<c:choose>
				<c:when test="${totalCntOne>100}"> 
					<c:if test="${(sectionOne)*100<totalCntOne}">
						<c:forEach var="pageOne" begin="1" end="10" step="1"> 
							<c:if test="${sectionOne > 1 && pageOne==1}"> 
								<a href="?sectionOne=${sectionOne-1}&pageNumOne=10"> ⏪ </a> 
							</c:if>
								<a href="?sectionOne=${sectionOne}&pageNumOne=${pageOne}">${(sectionOne-1)*10+pageOne}</a>
							<c:if test="${pageOne==10}">
								<a href="?sectionOne=${sectionOne+1}&pageNumOne=1"> ⏩ </a>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${(sectionOne)*100>totalCntOne}">
						<c:forEach var="pageOne" begin="1" end="${((totalCntOne+9)-(sectionOne-1)*100)/10}" step="1">
							<c:if test="${sectionOne > 1 && pageOne==1}">
								<a href="?sectionOne=${sectionOne-1}&pageNumOne=10"> ⏪ </a>
							</c:if>
								<a href="?sectionOne=${sectionOne}&pageNumOne=${pageOne}">${(sectionOne-1)*10+pageOne}</a>
						</c:forEach>
					</c:if>
				</c:when>
				<c:when test="${totalCntOne==100}">
					<c:forEach var="pageOne" begin="1" end="10" step="1">
						<a href="?sectionOne=${sectionOne}&pageNumOne=${pageOne}">${pageOne}</a>
					</c:forEach>
				</c:when>
				<c:when test="${totalCntOne<100}">
					<c:forEach var="pageOne" begin="1" end="${(totalCntOne+9)/10}" step="1">
						<a href="?sectionOne=${sectionOne}&pageNumOne=${pageOne}">${pageOne}</a>
					</c:forEach>
				</c:when>
			</c:choose>
		</c:if>
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
		<c:if test="${totalCntTwo != null}">
			<c:choose>
				<c:when test="${totalCntTwo>100}"> // 100개이상일시 실행
					<c:if test="${(sectionTwo)*100<totalCntTwo}"> // 100개이상일시 실행
						<c:forEach var="pageTwo" begin="1" end="10" step="1"> 
							<c:if test="${sectionTwo > 1 && pageTwo==1}"> 
								<a href="?sectionTwo=${sectionTwo-1}&pageNumTwo=10"> ⏪ </a> 
							</c:if>
								<a href="?sectionTwo=${sectionTwo}&pageNumTwo=${pageTwo}">${(sectionTwo-1)*10+pageTwo}</a>
							<c:if test="${pageTwo==10}">
								<a href="?sectionTwo=${sectionTwo+1}&pageNumTwo=1"> ⏩ </a>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${(sectionTwo)*100>totalCntTwo}">
						<c:forEach var="pageTwo" begin="1" end="${((totalCntTwo+9)-(sectionTwo-1)*100)/10}" step="1">
							<c:if test="${sectionTwo > 1 && pageTwo==1}">
								<a href="?sectionTwo=${sectionTwo-1}&pageNumTwo=10"> ⏪ </a>
							</c:if>
								<a href="?sectionTwo=${sectionTwo}&pageNumTwo=${pageTwo}">${(sectionTwo-1)*10+pageTwo}</a>
						</c:forEach>
					</c:if>
				</c:when>
				<c:when test="${totalCntTwo==100}"> 
					<c:forEach var="pageTwo" begin="1" end="10" step="1">
						<a href="?sectionTwo=${sectionTwo}&pageNumTwo=${pageTwo}">${pageTwo}</a>
					</c:forEach>
				</c:when>
				<c:when test="${totalCntTwo<100}">
					<c:forEach var="pageTwo" begin="1" end="${(totalCntTwo+9)/10}" step="1">
						<a href="?sectionTwo=${sectionTwo}&pageNumTwo=${pageTwo}">${pageTwo}</a>
					</c:forEach>
				</c:when>
			</c:choose>
		</c:if>
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