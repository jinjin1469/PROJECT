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
<title>Insert title here</title>
<script src="../../../resources/jquery/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	.b{
		border : solid 1px black;
	}
	.imgSize {
	  width: 10em;
	  height: 10em;
	}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<a href="<c:url value='/product/update/${Product.option_join_number}'/>">수정</a>
<div>
	<div>
		${Product.product_name}<br>
		${Product.product_price}<br>
		${Product.product_count}<br>
		${Product.product_cookingTime}<br>
		${Product.product_weight}<br>
		${Product.product_storage}<br>
		<c:if test="${Product.delete_check!=0}">
			<p>판매 중지 된 상품입니다.</p>
		</c:if>
		<c:if test="${Product.delete_check==0}">
			<p>주문버튼</p>
		</c:if>
		<c:forEach var="ProductOption" items="${ProductOption}">
			<p>${ProductOption.option_Name}</p>
			<p>${ProductOption.option_Price}</p>
			<p>${ProductOption.option_Count}</p>
		</c:forEach>
		<img src="/uploadedIMG/${Product.product_m_image}" class="card-img-top" alt="...">
		<img src="/uploadedIMG/${Product.product_d_image}" class="card-img-top" alt="...">
		<img src="/uploadedIMG/${Product.product_i_image}" class="card-img-top" alt="...">
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js">
</script>
<%@include file="../footer.jsp" %>
</body>
</html>