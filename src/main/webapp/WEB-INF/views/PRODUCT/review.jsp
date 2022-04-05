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
<link rel="stylesheet" href="../../../resources/css/review.css">
<title>Insert title here</title>
<script src="../../../resources/jquery/jquery-3.6.0.js"></script>
<style>
 textarea {
    width: 100%;
    height: 10rem;
    border-bottom: 0.5px solid black;
    resize: none;
    text-align:left; 
  }
 	
.btn {
	width: 200px;
	display: inline-block;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	text-align: center;
	text-decoration: none;
	vertical-align: middle;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
	background-color: transparent;
	border: 1px solid transparent;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.w-100 {
	width: 100% !important;
}

.btn-lg, .btn-group-lg>.btn {
	padding: 0.5rem 1rem;
	font-size: 1.25rem;
	border-radius: 0.3rem;
}

.btn-primary {
	color: #fff;
	background-color: #a4e25e;
	border-color: #d1f779;
}

.btn-primary:hover {
	color: #fff;
	background-color: #73c431;
	border-color: #1ad123;
}

.subbtn{width:530px; margin-top:10px;text-align:center;}

 
</style>
</head>
<body>
<%-- 
member_number : ${info.member_number}
<c:forEach var="productList" items="${info.order_sub}">
	productNumber : ${productList.product_number}<br>
	 ${productList.product_name} * ${productList.product_count} EA <br>
	 	<c:if test="${!empty productList.option_sub}">
	  		&nbsp;&nbsp;&nbsp;&nbsp;[추가상품]<br>
	  	</c:if>
	 	<c:forEach var="optionList" items="${productList.option_sub}">
	 		optionNumber : ${optionList.option_number}<br> 
	 		${optionList.option_Name} * ${optionList.option_Count} EA <br>
	 	</c:forEach>
</c:forEach> --%>
<h3>리뷰작성✉️</h3>


<c:forEach var="productList" items="${info.order_sub}" varStatus="form">


	<form commandName="Review" method="POST" action="insertReview" id="reviewForm(${form.count})" name="revireForm(${form.count})">
	<input type="hidden" name="product_number" id="product_number" value="${productList.product_number}">
	<input type="hidden" name="order_number" id="order_number" value="${order_number}">
	<table class="tbl">
	<tr>

		<th>구매 상품정보</th>
		<th>구매 상품내역</th>
	</tr>
	<tr>
		<td><img src="/uploadedIMG/${productList.product_m_image}" class="imgSize"></td>
	 	<td><label class="menuname">${productList.product_name} * ${productList.product_count} EA </label><br>
	 		<c:if test="${!empty productList.option_sub}">
	  			&nbsp;&nbsp;&nbsp;&nbsp;[추가상품]
	  		</c:if> 
	 		<c:forEach var="optionList" items="${productList.option_sub}">
	 			&nbsp;&nbsp;${optionList.option_Name} * ${optionList.option_Count} EA 
	 		</c:forEach></td>
	</tr>
 	<c:forEach var="review" items="${list}">
			<tr>
		 	 	<th colspan="2">리뷰작성</th>
			</tr>
			<tr>
		 	 	<td colspan="2"><textarea readonly>${review.review_content}</textarea></td>
			</tr>	
	</c:forEach>
	
	<c:if test="${empty list}">
		<tr>
		 	 <th colspan="2">리뷰작성</th>
		</tr>
		<tr>
		 	 <td colspan="2"><textarea id="review_content(${form.count})" name="review_content"></textarea></td>
		</tr>
	</c:if>
		</table>
	<c:if test="${empty list}">	
		<div class="subbtn">
			<input type="button" name="confirmbtn(${form.count})" id="confirmbtn(${form.count})" class="btn btn-primary btn-lg btn-block" id="confirmbtn(${form.count})" onclick="reviewConfirm(${form.count});" value="작성하기">
		</div>
	</c:if>
</form>
	
	<br>

</c:forEach>
	
<script>


function reviewConfirm(pos){
	var send = document.getElementById('confirmbtn('+pos+')');
	var form = document.getElementById('reviewForm('+pos+')');
	var text = document.getElementById('review_content('+pos+')').value;
	var str_space = /\s/;
		if(text.replace(/\s| /gi,'').length == 0) {
	 		alert("내용을 입력해주세요.");
	 		return false;
	 	}	
		   
		   form.submit();
}

</script>

</body>
</html>