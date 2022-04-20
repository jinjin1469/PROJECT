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
.mar{margin-left:200px;}
.sizee{width:800px; margin-left:70px;}
.sizeed{width:400px; margin-left: -20px;}
.mar{margin-left:200px;}
h3{text-align:left; margin-left:70px;}
.accordion-body{text-align:left;}

</style>

</head>
<body>
<%@include file="../header.jsp" %>
<br>
<br>
<div class="container d-flex flex-wrap d-flex align-items-center mar">
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
	<div class="col-md-10 sizee">
	    <h3>자주 묻는 질문</h3>
	<br>
		<div class="accordion accordion-flush" id="accordionFlushExample">
	  		<div class="accordion-item">
			    <h2 class="accordion-header" id="a1">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#b1" aria-expanded="false" aria-controls="b1">
			        적립금은 어떻게 적용하나요?
			      </button>
	    		</h2>
	    		<div id="b1" class="accordion-collapse collapse" aria-labelledby="a1" data-bs-parent="#accordionFlushExample">
	      			<div class="accordion-body">
					주문시 적립금 사용을 통해 일정부분 할인받을 수 있습니다.<br>
					<br>
					주문/결제 화면의 포인트사용섹션에서 적립금사용이 가능합니다.<br>
					<br>
					보유 적립금 확인 후, 원하시는 금액 입력을 하세요.
					</div>
				</div>
	  		</div>
	  		<div class="accordion-item">
			    <h2 class="accordion-header" id="a2">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#b2" aria-expanded="false" aria-controls="b2">
			        주문한 상품을 취소하고 전부 환불받고 싶어요.
			      </button>
	    		</h2>
	    		<div id="b2" class="accordion-collapse collapse" aria-labelledby="a2" data-bs-parent="#accordionFlushExample">
	      			<div class="accordion-body">
					'상품 준비중' 상태일 경우 주문현황 화면에서 '취소'를 하시면 취소 및 환불이 가능합니다.<br>
					<br>
					단, 주문/배송내역의 상태가 배송완료, 구매확정인 경우는 단순 변심으로 인한 주문취소가 어렵습니다.<br>
					</div>
				</div>
	  		</div>
	  		<div class="accordion-item">
	    		<h2 class="accordion-header" id="a3">
	      			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#b3" aria-expanded="false" aria-controls="b3">
	        		제품이 파손돼서(깨져서) 왔어요.
	      			</button>
	    		</h2>
	    		<div id="b3" class="accordion-collapse collapse" aria-labelledby="a3" data-bs-parent="#accordionFlushExample">
	      			<div class="accordion-body">
	      			고객님께 믿음을 드릴 수 있는 안전한 배송을 위하여, 제품의 포장 상태 등을 체크하여 배송 드리고 있습니다.<br>
					<br>
					구입하신 제품 중 파손 상품 발생 시 고객행복센터(000-0000-0000)로 연락주세요.<br>
					</div>
	  			</div>
			</div>
			<div class="accordion-item">
	    		<h2 class="accordion-header" id="a4">
	      			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#b4" aria-expanded="false" aria-controls="b4">
	        		배송비는 무료인가요?
	      			</button>
	    		</h2>
	    		<div id="b4" class="accordion-collapse collapse" aria-labelledby="a4" data-bs-parent="#accordionFlushExample">
	      			<div class="accordion-body">
	      			결제금액이 3만원 이상 일시 배송비가 무료로 적용됩니다.<br><br>
					(택배배송 비용)<br>
					3만원 미만: 3,000원<br>
					3만원 이상: 무료<br>
					</div>
	  			</div>
			</div>
			<div class="accordion-item">
	    		<h2 class="accordion-header" id="a5">
	      			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#b5" aria-expanded="false" aria-controls="b5">
	        		고객센터 운영시간은 어떻게 되나요?
	      			</button>
	    		</h2>
	    		<div id="b5" class="accordion-collapse collapse" aria-labelledby="a5" data-bs-parent="#accordionFlushExample">
	      			<div class="accordion-body">
	      			고객센터는 평일 오전 10시 ~ 오후 6시까지 운영됩니다.<br>
					고객센터(xxxx-xxxx), 카카오 플러스친구톡<br>
					</div>
	  			</div>
			</div>
			<div class="accordion-item">
	    		<h2 class="accordion-header" id="a6">
	      			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#b6" aria-expanded="false" aria-controls="b6">
	        		상품의 상태가 좋지 않아요.
	      			</button>
	    		</h2>
	    		<div id="b6" class="accordion-collapse collapse" aria-labelledby="a6" data-bs-parent="#accordionFlushExample">
	      			<div class="accordion-body">
	      			구입하신 상품 중 품질에 이상이 있는 고객님께서는 수령 후 1일 이내에<br> 
					고객센터(xxxx-xxxx)로 연락주시거나 [1:1문의] 또는 [카카오톡] 으로 문의 주시면<br>
					환불이나 재발송을 안내해 드립니다.<br>
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