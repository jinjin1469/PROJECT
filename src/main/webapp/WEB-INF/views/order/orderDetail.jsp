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
<link rel="stylesheet" href="../../../resources/css/shopping.css">
<title>Insert title here</title>
<script src="../../../resources/jquery/jquery-3.6.0.js"></script>
<style>
imgSize{width:0.5rem; height:0.5rem;}
</style>
</head>
<body>
💲 ${info.order_price} 
<c:forEach var="productList" items="${info.order_sub}">
 	<img src="/uploadedIMG/${productList.product_m_image}" class="p_img"> ${productList.product_name} * ${productList.product_count} EA <br>
 		<c:if test="${!empty productList.option_sub}">
  			&nbsp;&nbsp;&nbsp;&nbsp;[추가상품]<br>
  		</c:if>
 		<c:forEach var="optionList" items="${productList.option_sub}">
 			&nbsp;&nbsp;&nbsp;&nbsp; ${optionList.option_Name} * ${optionList.option_Count} EA <br>
 		</c:forEach>
 </c:forEach>
 <c:if test="${info.use_point!=0}">
 	포인트사용금액 : ${info.use_point} <br>
 </c:if>
 <c:if test="${!empty info.delivery_cost}">
 	배송료 : ${info.delivery_cost} <br>
 </c:if>
수령인 : ${info.recipient} <br>
연락처 : ${info.recipient_phone} <br>
주소 : ${info.recipient_address}



</body>
</html>