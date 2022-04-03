<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/order.css">
<title>Insert title here</title>
<script src="../../../resources/jquery/jquery-3.6.0.js"></script>
</head>
<body>
<p class="ordermain">주문 상세정보</p>
<table class="tbl">
	<tr>
		<th style="text-align:center;">주문번호</th>
		<th>상품정보</th>
		<th>상품내역</th>
	</tr>
	
	<c:forEach var="productList" items="${info.order_sub}">
		<tr>
		<td style="text-align:center;">${info.order_number}</td>
	 	<td><img src="/uploadedIMG/${productList.product_m_image}" class="imgSize"></td>
	 	<td><label class="menuname">${productList.product_name} * ${productList.product_count} EA </label><br>
	 		<c:if test="${!empty productList.option_sub}">
	  			&nbsp;&nbsp;&nbsp;&nbsp;[추가상품]
	  		</c:if> 
	 		<c:forEach var="optionList" items="${productList.option_sub}">
	 			&nbsp;&nbsp;${optionList.option_Name} * ${optionList.option_Count} EA 
	 		</c:forEach></td>
	 	 </tr>
	 </c:forEach>
</table>
<br>

<p class="ordermain">주문/결제 금액 정보</p>
<hr>
	<table class="ordertbl">
		<tr>
			<th class="orderth"> 총 결제 금액   </th>
				<td><label class="money"><fmt:formatNumber value="${info.order_price}" pattern="#,###,###" />원  </label> </td>
		</tr> 
		
		<c:if test="${info.use_point!=0}">
		<tr>
	 		<th class="orderth">포인트사용금액 </th> 
	 			<td><fmt:formatNumber value="${info.use_point}" pattern="#,###,###" />&nbsp;point</td>	
	 	</tr>
	 	</c:if>
		<c:if test="${!empty info.delivery_cost}">
	 	<tr>
	 		<th class="orderth">배송료 </th>
	 			<td><fmt:formatNumber value="${info.delivery_cost}" pattern="#,###,###" />원</td>
	 	</tr>
		</c:if>
		<c:if test="${info.earn_point!=0}">
		<tr>
			<th class="orderth">포인트적립금액</th>
				<td><fmt:formatNumber value="${info.earn_point}" pattern="#,###,###" />&nbsp;point</td>
		</c:if>
	
	</table>
<br>
<p class="ordermain">배송지 정보</p>
<hr>
<table class="ordertbl">
	<tr>
		<th class="orderth">수령인</th>
			<td> ${info.recipient}</td>
	</tr>
	<tr>
		<th class="orderth">연락처</th>
			<td>${info.recipient_phone}</td>
	</tr>
	<tr>
		<th class="orderth">주소</th>
			<td>${info.recipient_address}</td>
	</tr>
</table>
</body>
</html>