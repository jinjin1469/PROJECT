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
</head>
<body>

<form:form id="CategoryEdit" commandName="Category" action="/category/categorySequence" method="POST">
			상품이름 : <form:input path="category_name"/><br>
			상품이름 : <form:input path="category_sort"/><br>
		 <input type="button" id="checkBtn" value="등록">
</form:form>

<c:if test="${!empty menu1}">
	    <c:forEach var="menu1" items="${menu1}">
			${menu1.category_title}
		</c:forEach>
</c:if>
<c:if test="${!empty menu1}">
	    <c:forEach var="menu1" items="${menu1}">
			${menu1.category_title}
		</c:forEach>
</c:if>
<c:if test="${!empty menu2}">
	    <c:forEach var="menu2" items="${menu2}">
			${menu2.category_title}
		</c:forEach>
</c:if>
<c:if test="${!empty menu3}">
	    <c:forEach var="menu3" items="${menu3}">
			${menu3.category_title}
		</c:forEach>
</c:if>
<script>
$(document).ready(function(){
	
	$("#checkBtn").on("click",function(){
		let check = 0;
		
		if(check==4){
			$("#CategoryInsert").submit();
		}
	});

});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>