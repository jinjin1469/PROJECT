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
</style>
</head>
<body>
<nav class="bg-light border-bottom">
    <div class="container d-flex flex-wrap">
      <ul class="nav me-auto">
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2 active" aria-current="page">Home</a></li>
        <li class="nav-item"><a href="/notice/main" class="nav-link link-dark px-2">공지사항</a></li>
      </ul>
      <ul class="nav">
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2">로그인</a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2">회원가입</a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2">마이페이지</a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2">주문조회</a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2">장바구니</a></li>
      </ul>
    </div>
</nav>
<div class="container d-flex flex-wrap d-flex align-items-center">
	<div class="col-md-5"></div>
	<div class="col-md-2"><h1> 밀슐랭 </h1></div>
	<div class="col-md-5"></div>
</div>
<nav class="navbar navbar-expand-lg navbar-light bg-white rounded" aria-label="Eleventh navbar example">
	<div class="container d-flex flex-wrap">
        <div class="collapse navbar-collapse" id="navbarsExample09">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          	<li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown09" data-bs-toggle="dropdown" aria-expanded="false">전체 카테고리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">당일배송</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">새벽배송</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">정기구독</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">신규100원특가</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">베스트</a>
            </li>
          </ul>
          <ul class="nav">
	          <form>
	            <input class="form-control" type="text" placeholder="Search" aria-label="Search">
	          </form>
          </ul>
        </div>
	</div>
</nav>
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="../resources/IMG/1.PNG" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="../resources/IMG/2.PNG" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="../resources/IMG/3.PNG" class="d-block w-100" alt="...">
	    </div>
	 </div>
	 <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	 </button>
	 <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	 </button>
</div>
<div>
	<div>
<h3>파일 업로드</h3>
		<form:form id="CategoryInsert" commandName="Category" action="/category/insert" method="POST">
			상품이름 : <form:input path="category_name"/><br>
			상품이름 : <form:input path="category_sort"/><br>
		 <input type="button" id="checkBtn" value="등록">
		</form:form>
	</div>
	<div>
		<c:forEach var="board" items="${board}">
				<tr>
					<td>${board.qnaBoardNum-100}</td>
					<td><a href="<c:url value='/board/detail/${board.qnaBoardNum}' />">${board.qnaBoardTitle}</a></td>
					<td>${board.qnaBoardContent}</td>
					<td><fmt:formatDate value="${board.qnaBoardRegdate}" pattern="yyyy-MM-dd" /></td>
					<td>${board.qnaBoardCount}</td>
				</tr>
		</c:forEach>
		${CategoryData}
	</div>
</div>		
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