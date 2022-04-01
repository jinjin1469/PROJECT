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
<style>
	.b{
		border : solid 1px black;
	}
	.imgSize {
	  width: 18rem;
	  height: 18rem;
	  margin: 0px;
	}
	
	.card{
	border: none;
	width: 20rem;
	height: 25rem;
	margin:0auto;
	text-align:left;
	float:left;
	}
	.card-body{width:100%;height:30%; text-align:left;}
	
	.pInfo{margin: 0px; font-weight:bold; font-size: 15px; text-align:left; padding:0px;}
	.card-text{margin:0px; font-size: 13px; text-align:left; padding:1rem;}

	.wrap{
	width:100%;
	margin: 0auto;
	overflow: hidden;
	padding-top:10px;
	}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="container">
	<div class="wrap">
		<c:forEach var="product" items="${Product}">
			<div class="col">
				<div class="card">
				<a href="<c:url value='/product/detail/${product.option_join_number}'/>"><img src="/uploadedIMG/${product.product_m_image}" class="card-img-top imgSize" alt="..."></a>
				    <div class="card-body">
				      <a href="<c:url value='/product/detail/${product.option_join_number}'/>"><label class="pInfo">${product.product_name}</label></a>
				      <p class="card-text">${product.product_price}원</p>
				    </div>
			    </div>
		  	</div>
		</c:forEach>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js">
</script>
<%@include file="../footer.jsp" %>
</body>
</html>