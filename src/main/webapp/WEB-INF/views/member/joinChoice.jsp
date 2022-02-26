<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    
    <link rel="stylesheet" href="../../../resources/static/css/bootstrap.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>JOIN</title>
    
    <!--로그인-->
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/sign-in/">
    
    <!--footer-->
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/footers/">

    

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
      a:link { color: red; text-decoration: none;}
      a:visited { color: black; text-decoration: none;}
      a:hover { color: rgb(95, 185, 87); text-decoration: none;}

      .kakaoJoin{
          width: 80px !important;
          height: 70px !important; 
          border: none;
          float: left;
          margin: 0 auto;
          margin-top: 1rem;
          background-color: white;
      
      }

      .naverJoin{
          width: 80px !important;
          height: 70px !important; 
          border: none;
          display: inline-block;
          margin: 0 auto;
          margin-top: 1rem;
          margin-left: 0.5rem;
          background-color: white;
       
     }

    </style>

    
    
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
<!--header-->  
<main class="form-signin">
  <form>
    <img class="mb-4" src="../../../resources/image/logo_transparent.png" alt="" width="50%" height="50%">
    <h3 class="h4 mb-3 fw-normal"><strong>회원가입</strong></h3>
    
    <!--일반 로그인-->
    <p class="mb-4 fw-normal">밀슐랭 회원가입 후 아이디로 로그인 가능합니다. </p> 
    <button class="w-100 btn btn-lg btn-primary" type="button" onclick="location.href='/member/join'">회원가입</button>
    <br>
    <br>
    <br>
    <br>
    <!--간편 로그인-->
    <h3 class="h4 mb-3 fw-normal"><strong>간편가입</strong></h3>
    <p class="mb-4 fw-normal">SNS 계정을 이용한 회원가입 후 간편 로그인이 가능합니다. </p> 
    
    <div class="joinWrap">
      <input type="button" class="kakaoJoin" onclick="kakaoLogin();">
      <input type="button" class="naverJoin"> 
    </div>
 <!-- <div class="joinWrap">
        <p>카카오</p>
        <p>네이버</p>
    </div>-->  
  
  </form>
  <br>
  <br>
</main>

<%@include file="../footer.jsp" %>


<script>
	
	
	Kakao.init('461145e893529998d168fdf144c556aa'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
		    Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  console.log(response)
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  }
		
		//카카오로그아웃  
		function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }  	
		

</script>

    
  </body>
</html>
