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
<link rel="stylesheet" href="../../../resources/css/join.css">
<script src="../../../resources/jquery/jquery-3.6.0.js"></script>
<title>Insert title here</title>
<style>
table{
width:400px;
table-layout:fixed;
text-align:center;
}

tr,th,td{text-align:center;}

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

.btn1 {
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

.menu{
font-weight: bold;}

.b1{width:30%;}
.b2{width:20%;}
.b3{width:30%;}
.b4{width:25%;}

th{width:25%;}

input[type="text"], input[type="password"]{
    width: 30px;
    height: 30px;
    border: 0px;
    border-bottom: 1.5px solid gray;
    text-align: center;}


</style>
</head>
<body>
<h3>옵션/수량변경</h3>

<form:form commandName="CartOption" action="cartoption/modifyOption" method="POST" enctype="multipart/form-data">
<c:choose>
			    <c:when test="${map.count==0}">
			       	해당 상품은 준비된 옵션이 없습니다.
			    </c:when>
<c:otherwise>
<br>
<table>
<tr>
	<th class="b1">옵션이름</th>
	<th class="b2">옵션가격</th>
	<th colspan="2">옵션수량</th>
	<th class="b4">합계</th>
</tr>


  <c:forEach var="row" items="${cartOption}" varStatus="status">
	  
	<tr>
		<td class="menu">${row.option_name}</td>

		<td>${row.option_price}</td>
	
		<td colspan="2"><input type="text" name="change_option[${status.index}].option_selectCount" value="${row.option_selectCount}"></td>
		
		<td>${row.sumoption}</td>
	</tr>
	 <input type="hidden" value="${row.optionlist_number}" id="optionlist_number" name="change_option[${status.index}].optionlist_number">
	  <input type="hidden" value="${row.cartoption_number}" id="cartoption_number" name="cartoption_number">
	</c:forEach>


</table>
<br>
<input type="submit" value="수정하기"  class="btn btn-primary btn-lg btn-block">
<input type="reset" value="취소하기"  class="btn btn-primary btn-lg btn-block">
</c:otherwise>
</c:choose>

</form:form>


<script>





</script>
</body>
</html>