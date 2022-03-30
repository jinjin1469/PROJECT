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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
h3{
font-weight: bold;
top-margin:0.5rem;
bottom-margin:0.5rem;
}



</style>

</head>
<body>
<%@include file="../header.jsp" %>
<br>
<br>
<div class="container d-flex flex-wrap d-flex align-items-center">
	<div class="col-md-2">
	  <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
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
	        <a class="d-flex align-items-center link-dark text-decoration-none" href="#">
	        <svg class="bi me-2" width="30" height="5"></svg>
	          자주 묻는 질문
	        </a>
	      </li>
	    </ul>
	  </div>
	</div>
	<div class="col-md-10">
	    <h3>자주 묻는 질문</h3>

		<div class="accordion accordion-flush" id="accordionFlushExample">
	  		<div class="accordion-item">
			    <h2 class="accordion-header" id="flush-headingOne">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        적립금/이벤트 적립금은 어떻게 적용하나요?
			      </button>
	    		</h2>
	    		<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
	      			<div class="accordion-body">
					주문시 적립금 사용을 통해 일정부분 할인받을 수 있습니다.
					
					 (상품에 따라 사용 가능한 적립금이 다를 수 있습니다.)
					
					주문/결제 화면의 할인섹션에서 100원 단위로 적립금사용이 가능합니다.
					
					(적립금은 결제금액의 최대 30%까지 사용 가능합니다.)
					
					보유 적립금 확인 후, 원하시는 금액 입력을 하거나, 모두사용을 눌러주세요.
					
					적립금 유효기간은 적립일로부터 1년입니다.
					
					* 주문 상품 및 사용 쿠폰에 따라 조건이 다르오니 사용 조건을 확인해주세요.
					</div>
				</div>
	  		</div>
	  		<div class="accordion-item">
			    <h2 class="accordion-header" id="flush-headingTwo">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
			        적립금/이벤트 적립금은 어떻게 적용하나요?
			      </button>
	    		</h2>
	    		<div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
	      			<div class="accordion-body">
					주문시 적립금 사용을 통해 일정부분 할인받을 수 있습니다.
					
					 (상품에 따라 사용 가능한 적립금이 다를 수 있습니다.)
					
					주문/결제 화면의 할인섹션에서 100원 단위로 적립금사용이 가능합니다.
					
					(적립금은 결제금액의 최대 30%까지 사용 가능합니다.)
					
					보유 적립금 확인 후, 원하시는 금액 입력을 하거나, 모두사용을 눌러주세요.
					
					적립금 유효기간은 적립일로부터 1년입니다.
					
					* 주문 상품 및 사용 쿠폰에 따라 조건이 다르오니 사용 조건을 확인해주세요.
					</div>
				</div>
	  		</div>
	  		<div class="accordion-item">
	    		<h2 class="accordion-header" id="flush-headingThree">
	      			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
	        		적립금/이벤트 적립금은 어떻게 적용하나요?
	      			</button>
	    		</h2>
	    		<div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
	      			<div class="accordion-body">
	      			주문시 적립금 사용을 통해 일정부분 할인받을 수 있습니다.
	
					 (상품에 따라 사용 가능한 적립금이 다를 수 있습니다.)
					
					주문/결제 화면의 할인섹션에서 100원 단위로 적립금사용이 가능합니다.
					
					(적립금은 결제금액의 최대 30%까지 사용 가능합니다.)
					
					보유 적립금 확인 후, 원하시는 금액 입력을 하거나, 모두사용을 눌러주세요.
					
					적립금 유효기간은 적립일로부터 1년입니다.
					
					* 주문 상품 및 사용 쿠폰에 따라 조건이 다르오니 사용 조건을 확인해주세요.
					</div>
	  			</div>
			</div>
		</div>  
	</div>
</div>
<br>
<br>
<%@include file="../footer.jsp" %>
</body>
</html>