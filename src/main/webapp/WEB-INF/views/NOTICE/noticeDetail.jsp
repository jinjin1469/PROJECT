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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<style>

table {
	align-items: center;
	margin: 0 auto;
	text-align: center;
	border-top: 1px solid #444444;
	border-bottom: 1px solid #444444;
	border-collapse: collapse;
	width: 600px;
	font-size: 13px;
	text-align: left;
}

th, td {
	padding: 10px;
	text-align: left;
}



</style>
<body>
<%@include file="../header.jsp" %>
<div class="container d-flex flex-wrap d-flex align-items-center">
	<aside>
	    <p class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none">
	      <svg class="bi me-2" width="30" height="24"></svg>
	      <span class="fs-5 fw-semibold">고객센터</span>
	    </p>
	    <ul class="list-unstyled ps-0">
	      <li class="mb-1">
	        <a class="d-flex align-items-center link-dark text-decoration-none" href="/notice/main">
	        <svg class="bi me-2" width="30" height="5"></svg>
	          공지사항
	        </a>
	        <a class="d-flex align-items-center link-dark text-decoration-none" href="/notice/faq">
	        <svg class="bi me-2" width="30" height="5"></svg>
	          자주 묻는 질문
	        </a>
	      </li>
	    </ul>
	</aside>
  <div class="col-md-10">
    <h3>공지사항</h3>

<c:if test="${!empty Notice}">
		<table border=1>
				<tr>
					<th>
						${Notice.NOTICE_TITLE}
					</th>
				</tr>
				<tr>
					<td>
						${Notice.NOTICE_CONTENT}
					</td>
				</tr>
		</table>
</c:if>
    
    
    
  </div>  
  </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
<%@include file="../footer.jsp" %>
</body>
</html>