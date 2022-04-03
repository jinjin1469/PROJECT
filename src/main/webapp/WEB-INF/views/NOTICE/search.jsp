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
	<div class="row">
			<div class="col-md-8"></div>
			<div class="col-md-4">
		    <form class="d-flex" action="/notice/main" method="post">
		      <input class="form-control me-1" type="search" placeholder="Search" aria-label="Search" name="Search">
		      <button class="btn btn-outline-success" type="submit">Search</button>
		    </form>
			</div>
	</div>


<c:if test="${!empty Notice}">
		<table border=1>
			<tr>
				<th>분류</th>
				<th>제목</th>
				<th>등록일</th>
				<c:if test="${member_number==10022}">
				<th>수정</th>
				<th>삭제</th>
				</c:if>
			</tr>
			<c:forEach var="Notice" items="${Notice}">
				<tr>
					<td>${Notice.CLASSIFICATION}</td>
					<td><a href="<c:url value='/notice/detail/${Notice.NOTICE_NUMBER}' />">${Notice.NOTICE_TITLE}</a></td>
					<td><fmt:formatDate value="${Notice.REGDATE}" pattern="yyyy-MM-dd" /></td>
					<c:if test="${member_number==10022}">
					<td><a href="<c:url value='/notice/update/${Notice.NOTICE_NUMBER}' />">수정</a></td>
					<td><a href="<c:url value='/notice/delete/${Notice.NOTICE_NUMBER}' />">삭제</a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
</c:if>

    <a href="/notice/insert">글 등록</a>	
    
  </div>  
  </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
<%@include file="../footer.jsp" %>
</body>
</html>