<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../../resources/static/css/bootstrap.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>LOGIN</title>
    
    <!--로그인-->
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/sign-in/">
    
    <!--footer-->
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/footers/">
    <!--  네이버 로그인 API -->
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

    

<!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


<!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <style>
      
      *{font-family: 'Noto Sans KR', sans-serif;}

      form {
        width: 500px;
        margin: 0 auto;
      }

      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }

  
      }

      label{
        margin: 0.5rem;
      }
      a{padding: 0.5rem; text-align: center; font-weight: bold;}
      a:link {text-decoration: none;}
      a:visited { color: black; text-decoration: none;}
      a:hover { color: rgb(95, 185, 87); text-decoration: none;}


    </style>

    
    
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    <%@include file="../header.jsp" %>
	<br>
	<br>
	<main class="form-signin">

   
    <h1 class="h3 mb-3 fw-normal"><strong>LOGIN</strong></h1>
	 <form action="login" method="post" commandName="login">
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" name="member_id" placeholder="name@example.com">
      <label for="floatingInput">ID</label>
    </div>
    <br> 
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" name="member_pwd" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>
    <div class="checkbox mb-301">
      <label>
        <input type="checkbox" value="remember-me"> Remember ID
      </label>      
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
    <div class="loginWrap">
      <button class="kakaoLogin w-50 btn btn-lg" type="button" 
      onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=bc528016f97202a3cca0df4fd5072b8f&redirect_uri=http://localhost:8080/kakaologin&response_type=code';">
      </button> 
      <button class="naverLogin w-50 btn btn-lg" type="submit"></button>
    </div>
  
  </form>
  <br>
  <label>
    <a href="<c:url value='/member/findId' />">[아이디/비밀번호 찾기]</a>
    <a href="<c:url value='/member/join' />">[회원가입]</a>
   </label>

</main>
<br>
<br>

<%@include file="../footer.jsp" %>

<script>



</script>
</body>
</html>
