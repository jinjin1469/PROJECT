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
<title>장바구니</title>
<style>

imgSize{width:0.5rem; height:0.5rem;}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<br>
<br>
<h2>장바구니🛒</h2>
	<br>
	<br>
		<c:choose>
			    <c:when test="${map.count==0}">
			      	장바구니가 비었습니다. 얼른 쇼핑해보세요!
			    </c:when>
		<c:otherwise>
   <form commandName="Order" id="orderform" method="post" class="orderform" action="/order/payment">
   

   <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">선택</div>
                        <div class="img">이미지</div>
                        <div class="pname">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">가격</div>
                        <div class="num">수량</div>
                         <div class="basketoption">옵션</div>
                        <div class="sum">합계</div>
                    </div>
                    <div class="subdiv">
    					<div class="basketcmd">삭제</div>
                    </div>
                </div>
         <c:forEach var="row" items="${map.list}" varStatus="status">
         	  <input type="hidden" name="order_sub[${status.index}].cartoption_number" value="${row.cartoption_number}">
         	  <input type="hidden" name="order_sub[${status.index}].cart_number" value="${row.cart_number}">
                <div class="row data">
                    <div class="subdiv">

                        <div class="check"><input type="checkbox" class="buy" name="order_sub[${status.index}].check_box" value="1" onclick="javascript:basket.checkItem();" checked>&nbsp;</div>

                        <div class="img"><img src="/uploadedIMG/${row.product_m_image}" class="p_img"></div>
                        <div class="pname">
                           <a href="<c:url value='/product/detail/${row.option_join_number}'/>"><span>${row.product_name}</span></a> 
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price${status.count}" class="p_price" value="${row.product_price}"><fmt:formatNumber value="${row.product_price}" pattern="#,###,###" />원</div>
                        <div class="num">
                            <div class="updown">
                            	<span onclick="javascript:basket.changePNum(${status.count});"class="top_arrow"><i class="arrow up">➕</i></span>
                                <input type="text" name="order_sub[${status.index}].product_count" id="p_num(${status.count})" size="2" maxlength="4" class="p_number" value="${row.product_selectCount}" onkeyup="javascript:basket.changePNum(${status.count});"readonly>
                            	 <span onclick="javascript:basket.changePNum(${status.count});" class="top_arrow"><i class="arrow down">➖</i></span>
                            </div>
                        </div>
                         <div class="basketoption"><input type="button" name="showOption(${status.count})" id="showOption(${status.count})" value="옵션변경" onclick="javascript:basket.showOption(${status.count});"></div>
                         <input type="hidden" id="cartoption_number" name="cartoption_number" value="${row.cartoption_number}">
                        <div class="sum"><fmt:formatNumber value="${row.money}" pattern="#,###,###" />원</div>
                    </div>
                   
                    <div class="subdiv">
                   		<input type="hidden" name="cart_number" value="${row.cart_number}">
                        <div class="basketcmd">
                        	<a href="javascript:void(0)" class="abutton" id="delItem(${status.count})" onclick="javascript:basket.delItem(${status.count});">삭제</a>
                        </div>
                    </div>
                    
                </div>
    				
              </c:forEach>
            </div> 

    		
            <div class="right-align basketrowcmd">
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
            </div>
    
            <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: ${map.count}개</div>
             <div class="bigtext right-align sumcount" id="sum_p_num">배송비: <fmt:formatNumber value="${map.fee}" pattern="#,###,###" />원</div>
            <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: <fmt:formatNumber value="${map.sum}" pattern="#,###,###" />원</div>
    	
            <div id="goorder" class="">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                    <a href="javascript:void(0);" id="submit">선택한 상품 주문</a>
                </div>
            </div>
   	     </form>
 		</c:otherwise>   
      </c:choose>
<br>
<br>
	
<%@include file="../footer.jsp" %>

<script>
$(document).ready(function(){
	if(${waitingPayment}!=0){
		alert("진행중인 결제페이지로 이동합니다.");
		location.href='http://localhost:8081/order/paymentG';
	}
});

	let basket = {
	    totalCount: 0, 
	    totalPrice: 0,
	    //체크한 장바구니 상품 비우기
	    delCheckedItem: function(){
	    document.querySelectorAll("input[class=buy]:checked").forEach(function (item) {
	    item.parentElement.parentElement.parentElement.remove();
	        });
	    this.reCalc();
        this.updateUI();
	 
	    },
	    //장바구니 전체 비우기
	    delAllItem: function(){
	        document.querySelectorAll('.row.data').forEach(function (item) {
	            item.remove();
	          });
	          //AJAX 서버 업데이트 전송
	        
	          //전송 처리 결과가 성공이면
	          this.totalCount = 0;
	          this.total = 0;
	          this.reCalc();
	          this.updateUI();
	    },
	    //재계산
	    reCalc: function(){
	        this.totalCount = 0;
	        this.totalPrice = 0; 
	        document.querySelectorAll('.p_number').forEach(function (item) {
	            if(item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.checked == true){
	                var count = parseInt(item.getAttribute('value'));
	                console.log("갯수" + count);
	                this.totalCount += count;
	                var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
	                console.log("가격" + price);
	                this.totalPrice += count * price;
	            }
	        }, this); 
	    },
	    //화면 업데이트
	    updateUI: function () {
	        document.querySelector('#sum_p_num').textContent = '상품갯수: ' + this.totalCount.formatNumber() + '개';
	        document.querySelector('#sum_p_price').textContent = '합계금액: ' + this.totalPrice.formatNumber() + '원';
	    },
	    
	    

	    showOption: function(pos){
	    	 var show = document.getElementById('showOption('+pos+')');
			 var cartoption_number =  show.parentElement.nextElementSibling.getAttribute('value');
			 var url = 'http://localhost:8081/product/cartoption?cartoption_number='+ cartoption_number;
		     var name = "popup";	
		     var option = "width=500,height=500,top=200,left=200,toolbar=no,menubar=no,scrollbars=no,resizable=no,status=no";
		    
			 window.open(url, name, option);

		
		
	},
		 
		 //개별 수량 변경 p_num${status.count}
	    changePNum: function (pos) {
	        var item =  document.getElementById('p_num('+pos+')');
	        var p_num = parseInt(item.getAttribute('value'));
	        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
	        
	        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }

	        item.setAttribute('value', newval);
	        item.value = newval;

	        var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
	        console.log(price);
	        item.parentElement.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.textContent = (newval * price).formatNumber()+"원";
	        //AJAX 업데이트 전송

	        //전송 처리 결과가 성공이면    
	        this.reCalc();
	        this.updateUI();
	    },
	    checkItem: function () {
	        this.reCalc();
	        this.updateUI();
	    },
	    delItem: function (pos) {
	    
			var item = document.getElementById('delItem('+pos+')');
			var cart_number = item.parentElement.parentElement.firstElementChild.getAttribute('value');
			location.href='/product/delete?cart_number= '+ cart_number;
			
	       /*  
			event.target.parentElement.parentElement.parentElement.remove();
	        this.reCalc();
	        this.updateUI(); */
	    }
	}

	// 숫자 3자리 콤마찍기
	Number.prototype.formatNumber = function(){
	    if(this==0) return 0;
	    let regex = /(^[+-]?\d+)(\d{3})/;
	    let nstr = (this + '');
	    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
	    return nstr;
	};
	
	$("#submit").on("click",function(){
			$("#orderform").submit();
	});
	 
</script>
<%@include file="../footer.jsp" %>
</body>
</html>