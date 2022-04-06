<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>밀슐랭</title>
<style>
.b{border : solid 1px black;}
* {
	font-family: 'Noto Sans KR', sans-serif;
	text-align: center;
}
.card{
border: none;
width: 20rem;
height: 25rem;
margin:0auto;
text-align:left;
float:left;
}
.card-body{width:100%;height:30%; text-align:left;}
.pInfo{margin: 0px; font-weight:bold; font-size: 15px; text-align:left; padding:0px; margin-left:-13px;}
.card-text{margin:0px; font-size: 15px; text-align:left; font-weight:bold; margin-left:-13px;}
.menu-name{padding:0rem; font-size:18px; font-weight:bold;}
.wrap{
width: 80%;
margin: 0auto;
overflow: hidden;
padding-top:10px;
}
p{font-size:25px; text-weight:bold; text-align:left; text-align:left; margin: 0px;}

body {
  margin: 0;
  padding: 0;  
  position: relative;
  height: 100%;
}


.swiper {
  width: 80%;
  height: 80%;
}

.swiper2 {
  width: 80%;
  height: 80%;
}


.swiper-slide {
  text-align: center;
  font-size: 18px;
  width:20rem; 
  height: 25rem;

  /* Center slide text vertically */
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  -webkit-align-items: center;
  align-items: center;
}

.swiper-slide3 {
  text-align: center;
  font-size: 18px;
  width:20rem; 
  height: 28rem;

  /* Center slide text vertically */
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  -webkit-align-items: center;
  align-items: center;
}

.swiper-slide2 {
  text-align: center;
  font-size: 18px;
  background: #fff;
  width:15rem; 
  height: 20rem;

  /* Center slide text vertically */
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  -webkit-align-items: center;
  align-items: center;
}

.slidecolor{
background: #F5F5F5;
}


.swiper-slide img {
  display: block;
  object-fit: cover;
}

.card-image{width:18rem; height:18rem;}
.card-image2{width:10rem; height:10rem; margin-top: -50px;}
.swiper-button-next{color:#DEDEDE; margin-right:-5px;}
.swiper-button-prev{color:#DEDEDE;  margin-left:-10px;}
.swiper-pagination{color:#DEDEDE;}
.swiper-button-next2{color:#DEDEDE; margin-right:-5px;}
.swiper-button-prev2{color:#DEDEDE;  margin-left:-10px;}
.swiper-pagination2{color:#DEDEDE;}
.best{text-align:left; font-weight:bold; float:left; margin-left:-950px;}
.new{background-color:#F5F5F5; width:100%; height:500px; margin-top:100px;}
.recom{text-align:left; font-weight:bold; margin-top: 30px; margin-left:250px;}
.newproduct{text-align:left; font-weight:bold; float:left; margin-left:-1000px; margin-top:50px;}
.bestPro{padding:0px;}
.pInfo{margin: 0px; font-weight:bold; font-size: 15px; text-align:left; padding:0px;}
.card-text{margin:0px; font-size: 15px; text-align:left; font-weight:bold;}
.menu-name{padding:0rem;}
.card-body2{padding:0rem;}
.card-text2{margin:0px; font-size: 15px; text-align:left; font-weight:bold; margin-top:-20px;}
.newProduct{padding:0px;}
.recomprice{margin-top:-20px;}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
<!-- 배너 -->
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-inner">
	    <div class="carousel-item active">
	      <a href="/notice/detail/10011" style="padding:0px;"><img src="./resources/IMG/banner1.jpg" class="d-block w-100" alt="..."></a>
	    </div>
	    <div class="carousel-item">
	      <a href="https://fresheasy.co.kr/" style="padding:0px;"><img src="./resources/IMG/banner2.jpg" class="d-block w-100" alt="..."></a>
	    </div>
	    <div class="carousel-item">
	      <a href="/product/categoryList/스미스푸줏간" style="padding:0px;"><img src="./resources/IMG/banner3.jpg" class="d-block w-100" alt="..."></a>
	    </div>
	    <div class="carousel-item">
	      <a href="/product/detail/373" style="padding:0px;"><img src="./resources/IMG/banner4.jpg" class="d-block w-100" alt="..."></a>
	    </div>
	    <!-- <div class="carousel-item">
	      <img src="./resources/IMG/banner5.jpg" class="d-block w-100" alt="...">
	    </div> -->
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
<br>
<br>

<!-- 베스트 메뉴시작 -->
<p class="best">밀슐랭 베스트 상품</p>
<br>
	<div class="wrap swiper mySwiper">
		<div class="swiper-wrapper">
			
		<c:forEach var="Product" items="${Product1}">
		<div class="swiper-slide">
		<div class="card-main">
			
			<a href="<c:url value='/product/detail/${Product.option_join_number}'/>"><img src="/uploadedIMG/${Product.product_m_image}" class="card-image" alt="..."></a>
				    <div>
				      <a href="<c:url value='/product/detail/${Product.option_join_number}'/>" class="bestPro"><p class="menu-name pInfo">${Product.product_name}</p></a>
				      <p class="card-text pInfo"><fmt:formatNumber value="${Product.product_price}" pattern="#,###,###" />원</p> </div>
			</div>
	  	 </div>
	  	 </c:forEach>

	 </div>
	  
	  <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
	   
	  </div>

<br>

<!-- 추천상품 시작 -->

<div class="new">
<p class="recom">밀슐랭 추천 상품</p>
<br>
	<div class="wrap swiper mySwiper2">
		<div class="swiper-wrapper">
			
		<c:forEach var="Product" items="${Product2}">
		<div class="swiper-slide">
		<div class="card-main">
			<a href="<c:url value='/product/detail/${Product.option_join_number}'/>"><img src="/uploadedIMG/${Product.product_m_image}" class="card-image2" alt="..."></a>
				    <div class="card-body2">
				      <a href="<c:url value='/product/detail/${Product.option_join_number}'/>"><p class="menu-name pInfo">${Product.product_name}</p></a>
				      <p class="card-text pInfo recomprice"><fmt:formatNumber value="${Product.product_price}" pattern="#,###,###" />원</p> </div>
			</div>
	  	 </div>
  		</c:forEach>

	 </div>
	  
	  <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
	   
	  </div>

</div>




<!-- 신상품 시작 -->
<br>
<p class="newproduct">밀슐랭 신상품</p>
<br>
	<div class="wrap swiper mySwiper">
		<div class="swiper-wrapper">
			
		<c:forEach var="Product" items="${Product3}">
		<div class="swiper-slide">
		<div class="card-main">
			<a href="<c:url value='/product/detail/${Product.option_join_number}'/>"><img src="/uploadedIMG/${Product.product_m_image}" class="card-image" alt="..."></a>
				    <div class="card-body">
				      <a href="<c:url value='/product/detail/${Product.option_join_number}'/>" class="bestPro newProduct"><p class="menu-name pInfo">${Product.product_name}</p></a>
				      <p class="card-text pInfo"><fmt:formatNumber value="${Product.product_price}" pattern="#,###,###" />원</p> </div>
			</div>
	  	 </div>
  		</c:forEach>

	 </div>
	  
	  <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
	   
	  </div>

<br>


	
	
	
	
	
<br>
<br>
<script>

var swiper = new Swiper(".mySwiper", {
     slidesPerView: 3,
     spaceBetween: 30,
     slidesPerGroup: 3,
     loop: true,
     loopFillGroupWithBlank: true,
     pagination: {
       el: ".swiper-pagination",
       clickable: true,
     },
     navigation: {
       nextEl: ".swiper-button-next",
       prevEl: ".swiper-button-prev",
     },
   });
   
var swiper = new Swiper(".mySwiper2", {
    slidesPerView: 4,
    spaceBetween: 20,
    slidesPerGroup: 4,
    loop: true,
    loopFillGroupWithBlank: true,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });


</script>
<%@include file="footer.jsp"%>
</body>
</html>
























