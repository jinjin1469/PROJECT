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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../../../resources/css/productDetail.css">
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<style>


</style>
<body>
<%@include file="../header.jsp" %>
<br>
<br>
<div class="Product">
		<div class="Product_img">
			<img src="/uploadedIMG/${Product.product_m_image}" class="imgSize" alt="...">
		</div>
		<div class="Product_info">
			<p class="name">${Product.product_name} </p>
			<p class="price">${Product.product_price}원	</p>
			<p class="info">잔여수량 ${Product.product_count}개 🔢  조리${Product.product_cookingTime}⏲
				${Product.product_weight}🍚
				${Product.product_storage}보관😋</p><br>
			<hr>
			<table>
				<tr>
					<th>배송정보</th>
					<td>지정일배송</td>
				</tr>
				<tr>
					<th>배송비</th>
					<td>3,000원(30,000원 이상무료)</td>
				</tr>
			</table>
			<hr>

		<!-- 수량 증감 -->
		<div class="count">
			<div class="qty">수량 &nbsp;&nbsp; &nbsp; &nbsp;</div>
		 		<div>
		  			<div class="qty">
		 		<div class="plus">
		 			<a href="javascript:change_qty2('p')">➕</a>
		 		</div> 
		 		<div class="plus">
		 		<input type="text" name="ct_qty" id="ct_qty" value="1" readonly="readonly"> </div> 
		 		
		 		<div class="minus">
		  			 <a href="javascript:change_qty2('m')">➖</a>
		  		 </div> 
		  		</div>
		 		
		 	</div> 
		 </div>
		 <hr>
		 
		 <div class="totalamount">
			총 상품 금액 <p id="total_amount">74,000</p>
		</div>
		<hr>
		
					
					
			
		</div>
	</div>



	
		
		<c:if test="${Product.delete_check!=0}">
			<p>판매 중지 된 상품입니다.</p>
		</c:if>
		<c:if test="${Product.delete_check==0}">
			<p>주문버튼</p>
		</c:if>
		<c:forEach var="ProductOption" items="${ProductOption}">
			<p>${ProductOption.option_Name}</p>
			<p>${ProductOption.option_Price}</p>
			<p>${ProductOption.option_Count}</p>
		</c:forEach>
		
		<img src="/uploadedIMG/${Product.product_d_image}" class="imgSize" alt="...">
		<img src="/uploadedIMG/${Product.product_i_image}" class="imgSize" alt="...">
	
	
	<a href="<c:url value='/product/update/${Product.option_join_number}'/>">수정</a>

<br>
<br>
<%@include file="../footer.jsp" %>
<script>
//숫자 카운트 
Number.prototype.format = function(){
  if(this==0) return 0;

  var reg = /(^[+-]?\d+)(\d{3})/;
  var n = (this + '');

  while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

  return n;
};
 

String.prototype.format = function(){
  var num = parseFloat(this);
  if( isNaN(num) ) return "0";

  return num.format();
};
    
var basic_amount = parseInt('74000');

function change_qty2(t){
  //var min_qty = '수량버튼'*1;
  var min_qty = 1;
  var this_qty = $("#ct_qty").val()*1;
  var max_qty = '200'; // 현재 재고
  if(t=="m"){
    this_qty -= 1;
    if(this_qty<min_qty){
      //alert("최소구매수량 이상만 구매할 수 있습니다.");
      alert("수량은 1개 이상 입력해 주십시오.");
      return;
      }
    }
    else if(t=="p"){
      this_qty += 1;
      if(this_qty>max_qty){
        alert("죄송합니다. 재고가 부족합니다.");
        return;
        }
    }

  var show_total_amount = basic_amount * this_qty;
  //$("#ct_qty_txt").text(this_qty); 
  $("#ct_qty").val(this_qty);
  $("#it_pay").val(show_total_amount);
  $("#total_amount").html(show_total_amount.format());
}

</script>
</body>
</html>