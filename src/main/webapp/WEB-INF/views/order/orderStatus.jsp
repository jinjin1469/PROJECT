<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/shopping.css">
<link rel="stylesheet" href="../../../resources/css/join.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>장바구니</title>
<style>

imgSize{width:0.5rem; height:0.5rem;}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<br>
<br>
${msg}
<div class="col-md-5">
	<div class="accordion accordion-flush" id="accordionFlushExample">
		<c:forEach var="info" items="${info}" varStatus="n">
	  		<div class="accordion-item">
			    <h2 class="accordion-header" id="a${n.count}">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#b${n.count}" aria-expanded="false" aria-controls="b${n.count}">
			        ${info.order_number} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${info.order_regdate}" pattern="yyyy-MM-dd" /> <br>
			        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;돈모양 ${info.order_price} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${info.order_status}
			        <c:if test="${info.order_status=='배송완료'}">
	      				<br><a href="/order/status/${info.order_number}">구매확정</a>
	      			</c:if>
	      			<c:if test="${info.order_status=='구매확정'}">
	      				<br><a href="#">리뷰쓰기</a>
	      			</c:if>
			      </button>
	    		</h2>
	    		<div id="b${n.count}" class="accordion-collapse collapse" aria-labelledby="a${n.count}" data-bs-parent="#accordionFlushExample">
	      			<div class="accordion-body">
	      				<c:forEach var="productList" items="${info.order_sub}">
	      				<img src="/uploadedIMG/${productList.product_m_image}" class="p_img"> ${productList.product_name} * ${productList.product_count} EA <br>
	      					<c:if test="${!empty productList.option_sub}">
		      				&nbsp;&nbsp;&nbsp;&nbsp;[추가상품]<br>
		      				</c:if>
	      					<c:forEach var="optionList" items="${productList.option_sub}">
	      					 &nbsp;&nbsp;&nbsp;&nbsp; ${optionList.option_Name} * ${optionList.option_Count} EA <br>
	      					</c:forEach>
	      				</c:forEach>
	      				<c:if test="${info.use_point!=0}">
	      				포인트사용금액 : ${info.use_point} <br>
	      				</c:if>
	      				<c:if test="${!empty info.delivery_cost}">
	      				배송료 : ${info.delivery_cost} <br>
	      				</c:if>
						수령인 : ${info.recipient} <br>
						연락처 : ${info.recipient_phone} <br>
						주소 : ${info.recipient_address}
						
						<c:if test="${info.order_status=='배송준비중'}">
	      				<br><br><a href="/order/paymentCancle/${info.order_number}">결제취소</a>
	      				</c:if>
					</div>
				</div>
	  		</div>
	  	</c:forEach>	
	</div>  	
</div> 
<br>
<br>


<script>

</script>
<%@include file="../footer.jsp" %>
</body>
</html>