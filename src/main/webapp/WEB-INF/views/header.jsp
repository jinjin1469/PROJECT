<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<script src="../../../resources/jquery/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="../../resources/css/header.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <div class="containerbox">
   <header class="d-flex flex-wrap justify-content-center py-3 mb-4">
     <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
       <span class="font" id="bookmark">🔖BOOKMARK</span>
     </a>

     <ul class="navheader">
       <li class="navheader"><a href="<c:url value='/member/login' />"  aria-current="page">로그인</a></li>
       <li class="navheader"><a href="<c:url value='/member/joinChoice' />" >회원가입</a></li>
       <li class="navheader"><a href="<c:url value='/member/mypage' />" >마이페이지</a></li>
       <li class="navheader"><a href="#" >주문조회</a></li>
       <li class="navheader"><a href="#">장바구니</a></li>
     </ul>
   </header>
 </div>


<img src="../../resources/image/logo_transparent.png" alt="" width="250px" height="250px" onclick="javascript:location.href='/';" style="cursor:pointer;">



<nav role="navigation">
  <ul id="main-menu">
    <li><a href="#">전체보기</a></li>
    
      <li><a href="#">베스트</a></li>
      
      <li><a href="#">재구매Best</a></li>
      
       <li><a href="#">신제품</a></li>
    
    <li><a href="#">&nbsp;&nbsp;&nbsp;테마별&nbsp;&nbsp;</a>
      <ul id="sub-menu">
        <li><a href="#" aria-label="subemnu">한식</a></li>
        <li><a href="#" aria-label="subemnu">양식</a></li>
        <li><a href="#" aria-label="subemnu">중식/일식</a></li>
        <li><a href="#" aria-label="subemnu">베트남식</a></li>
        <li><a href="#" aria-label="subemnu">동남아</a></li>
        <li><a href="#" aria-label="subemnu">분식/야식</a></li>
      </ul>
    </li>
    <li><a href="#">사이드디쉬</a>
      <ul id="sub-menu">
        <li><a href="#" aria-label="subemnu">샐러드/과일</a></li>
        <li><a href="#" aria-label="subemnu">반찬</a></li>

      </ul>
    </li>
    <li><a href="#">프리미엄관</a>
      <ul id="sub-menu">
        <li><a href="#" aria-label="subemnu">submenu</a></li>
        <li><a href="#" aria-label="subemnu">submenu</a></li>
        <li><a href="#" aria-label="subemnu">submenu</a></li>
        <li><a href="#" aria-label="subemnu">submenu</a></li>
        <li><a href="#" aria-label="subemnu">submenu</a></li>
      </ul>
    </li>
  </ul>
</nav>




<script>
$("#bookmark").click(function(){
    alert("Ctrl+D키를 누르시면 즐겨찾기에 추가하실 수 있습니다.");
});


</script>

</body>
</html>