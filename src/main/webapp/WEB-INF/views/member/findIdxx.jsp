<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../../../resources/jquery/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="../../../resources/css/join.css">

<style>
 a{padding: 0.5rem; text-align: center; font-weight: bold;}
 a:link { text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: rgb(95, 185, 87); text-decoration: none;}
	input[type="text"],
	input[type="password"]{
	width:30%;
	height:30px;
	border:0px;
	border-bottom:1.5px solid gray;
	text-align:left;
	}
</style>


<title>Insert title here</title>
</head>



<body>

<img class="mb-4" src="../../../resources/image/logo_transparent.png" alt="" width="20%" height="0%">
<div class="text-center">
   <h3>아이디 찾기</h3>
    <p class="mb-4">이메일을 입력해주세요!</p>
</div>
<br>
<form class="user" action="findId" method="POST">
<div class="form-group">
    <input type="text" class="form-control form-control-user" id="member_email" name="member_email" placeholder="회원가입  시 등록한 이메일을 입력하세요.">
</div>
<br>
<br>
<button type="submit" class="btn btn-primary btn-user btn-block">
    Find ID
</button>
</form>
<hr>

<a href="/member/login">[로그인]</a>
<a class="small" href="/">[메인페이지]</a>

<script>



</script>



</body>
</html>