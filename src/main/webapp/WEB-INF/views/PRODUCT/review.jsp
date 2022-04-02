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

member_number : ${info.member_number}
<c:forEach var="productList" items="${info.order_sub}">
	productNumber : ${productList.product_number}<br>
	 <img src="/uploadedIMG/${productList.product_m_image}" class="p_img"> ${productList.product_name} * ${productList.product_count} EA <br>
	 	<c:if test="${!empty productList.option_sub}">
	  		&nbsp;&nbsp;&nbsp;&nbsp;[추가상품]<br>
	  	</c:if>
	 	<c:forEach var="optionList" items="${productList.option_sub}">
	 		optionNumber : ${optionList.option_number}<br> 
	 		${optionList.option_Name} * ${optionList.option_Count} EA <br>
	 	</c:forEach>
</c:forEach>


<script>

</script>

</body>
</html>