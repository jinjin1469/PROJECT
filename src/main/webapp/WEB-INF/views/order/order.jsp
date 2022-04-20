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
<link rel="stylesheet" href="../../../resources/css/payment.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<title>주문하기🛒</title>
</head>
<body>
<%@include file="../header.jsp" %>
<br>
<br>
<h2>주문하기💳</h2>
	<br>
	<br>	
	<form:form id="orderform" commandName="Order" method="POST" action="/order/orderInsert" enctype="multipart/form-data">
		<table>
			<tr>
				<th>주문 목록</th>
				<td>
					<c:forEach var="product" items="${Product}" varStatus="n">
					<label class="mainmenu">	✔️${product.product_name} * ${product.product_count} EA </label>
						
						<input type="hidden" name="order_sub[${n.index}].product_name" value="${product.product_name}">
				 		<input type="hidden" name="order_sub[${n.index}].product_number" value="${product.product_number}">
				 		<input type="hidden" name="order_sub[${n.index}].product_count" value="${product.product_count}">
				 		<input type="hidden" name="order_sub[${n.index}].cartoption_number" value="${product.cartoption_number}">
				
						<c:if test="${!empty product.option_sub}">
						 <br>
						 <c:if test="${product.option_sub[0].payment_option_count!=0}">
						 &nbsp;&nbsp;&nbsp;  - 옵션상품 
							<c:forEach var="option" items="${product.option_sub}" varStatus="m">
									
									<input type="hidden" name="order_sub[${n.index}].option_sub[${m.index}].option_number" value="${option.option_number}">
									<input type="hidden" name="order_sub[${n.index}].option_sub[${m.index}].option_Name" value="${option.option_Name}">
									<input type="hidden" name="order_sub[${n.index}].option_sub[${m.index}].payment_option_count" value="${option.payment_option_count}">
									
									<c:if test="${m.index/2==1}"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
									&nbsp;	[ ${option.option_Name} * ${option.payment_option_count} EA ]	
								
							</c:forEach>
							<br>
							</c:if>
						</c:if>
						<br>
              		</c:forEach>
				</td>
			</tr>
			<tr>
				<th>결제 금액</th>
				<td class="sum"><fmt:formatNumber value="${totalPrice}" pattern="#,###,###" />원</td>
			</tr>
			<tr>
				<th>포인트 사용 <c:if test="${!empty membershipPoint}"><p class="point">사용가능포인트 : ${membershipPoint}</p></c:if></th>
				<td><input type="text" class="form-control" id="use_point" name="use_point" value="" required>
				<span class="point regex" style="text-align:left;"></span>
				<br>
				</td>
			</tr>
			<tr>
				<th>적립 예상 포인트</th>
				<td><input type="text" class="form-control" id="earn_point" name="earn_point" value="" readonly>
				<br>
				</td>
			</tr>
			<tr>
				<th>회원정보로 택배받기</th>
				<td><input type="checkbox" id="recipient_check" name="recipient_check" value="1" checked></td>
			</tr>
				<tr class="unckeck" style="display:none">
					<th>수령인</th>
					<td><input type="text" class="form-control" id="recipient" name="recipient" required>
					<span class="member_name regex" style="text-align:left;"></span>
					<br>
					</td>
				</tr>
				<tr class="unckeck" style="display:none">
					<th>수령인 핸드폰번호</th>
					<td><input type="text" class="form-control" id="recipient_phone"
						name="recipient_phone" placeholder="-를 제외한 숫자만 입력해주세요" style="text-align:left;" required>
						<span class="member_phone regex" style="text-align:left;"></span>
						<br>
					</td>
				</tr>
				<tr class="unckeck" style="display:none">
					<th>수령인 주소</th>
				<td><input class="form-control" style="width: 30%; display: inline;" type="text" name="postcode" id="postcode" placeholder="우편번호">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
					<br>
					 <input class="form-control" type="text" name="address" id="address" style="width: 60%; display: inline; margin-top: 5px;"
						placeholder="도로명 주소" style="text-align:left;"> 
					<br>
					 <input class="form-control" style="width: 40%; display: inline; margin-top: 5px;" type="text"
					id="detailAddress" name="detailAddress" placeholder="상세주소" style="text-align:left;">
					<input type="hidden" name="recipient_address" id="recipient_address" value="">
					</td>
				</tr>
				
		</table>
		<form:hidden path="member_number"/>
		<input type="hidden" name="imp_uid" id="imp_uid" value="">
		<input type="hidden" name="order_price" id="order_price" value="">
		<input type="hidden" name="delivery_cost" id="delivery_cost" value="">
		 <br>
		 <br>
		<button class="btn3 btn-primary btn-lg btn-block" type="button" id="orderbtn" name="order">주문하기</button>
		<button class="btn4 btn-primary btn-lg btn-block" type="button" id="cancelbtn" name="order">주문취소</button>
	</form:form>
<br>
<br>


<script>
IMP.init('imp43122025');


//이름 유효성검사
$("#recipient").on("input",function(){
    var regex = /[가-힣]{2,}/;
    var result = regex.exec($("#recipient").val());
    
    if(result != null){
       $(".member_name.regex").html("");  
    }else{
        $(".member_name.regex").html("한글만 입력 가능합니다.");
        $(".member_name.regex").css("color","red");
    }
    
})



//주소 합치기
$("#postcode").change(function(){
	addr();	
});

$("#address").change(function(){
	addr();	
});

$("#detailAddress").change(function(){
	addr();	
});

function addr() {
	const postcode = $("#postcode").val();
	const address = $("#address").val();
	const detailAddress = $("#detailAddress").val();


	if (detailAddress == ""){
		$("#recipient_address").val(postcode+address);
	}else if(postcode != "" && address != "" && detailAddress != "") {
		$("#recipient_address").val(postcode+address+detailAddress);
	}	
};

// 우편번호 서비스
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }

            
            } else {
                document.getElementById("_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
            
            const postcode = $("#postcode").val();
    		const address = $("#address").val();
    		
			$("#recipient_address").val(postcode+address);
        }
    }).open();
}
//전화번호 유효성검사
$("#recipient_phone").on("input",function(){
     var regex = /^01\d\d{3,4}\d{4}$/;
     var result = regex.exec($("#recipient_phone").val());
    
    if(result != null){
       $(".member_phone.regex").html("");  
    }else{
        $(".member_phone.regex").html("올바른 번호가 아닙니다");
        $(".member_phone.regex").css("color","red"); 
    }
    
});
$("#use_point").on("input",function(){
    let point = $("#use_point").val();
   
   if(point <= ${membershipPoint}){
      $(".point.regex").html("");  
   }else{
       $(".point.regex").html("포인트한도내 사용바랍니다");
       $(".point.regex").css("color","red"); 
   }
   
});


let earn_point = ${totalPrice/20};
$('input[name=earn_point]').attr('value',Math.round(earn_point));

$("#recipient_check").on('change',function(){
    if($("#recipient_check").is(':checked')){
    	$("input[name=recipient]").val("");
    	$("input[name=recipient_phone]").val("");
    	$("input[name=recipient_address]").val("");
    	$(".unckeck").hide();
    }else{
	    $(".unckeck").show();
    }
});

$("#cancelbtn").on("click",function(){
	alert("결제 상품리스트가 초기화됩니다.");
	location.href='http://localhost:8081/order/cancel';
});
$("#orderbtn").on("click",function(){
	let point =  document.getElementById('use_point').value
	if(point==""){
		point = 0;
	}
	   if($("#recipient_check").is(':checked')){
		   if(point > ${membershipPoint}){
			   alert("포인트한도내 사용바랍니다");
			   return;
		   }
		   payment();
	   }else{
		   
		   let name =  document.getElementById('recipient').value
		   let phone =  document.getElementById('recipient_phone').value
	 	   let address =  document.getElementById('recipient_address').value
	 	   
	 	   let nameregex = /[가-힣]{2,}/;
	 	 
	 	   nameregex = nameregex.exec(name);
		   if(nameregex == null){
			   alert("수령인을 다시 확인해주세요");
			   return;
		   }
		   if(phone == ""){
			   alert("핸드폰번호를 다시 확인해주세요");
			   return;
		   }
		   if(address == null){
			   alert("주소를 입력해주세요");
			   return;
		   }
		   
		   if(point > ${membershipPoint}){
			   alert("포인트한도내 사용바랍니다");
			   return;
		   }
		   payment();
	   }
 	   
});
	

function payment(){
	let totalPrice = ${totalPrice};
	let point = document.getElementById('use_point').value
	if(point==""){
		point=0;
		$("#use_point").val(point);
		if(point==0&&totalPrice>=30000){
			$("#delivery_cost").val(0);
		}
	}
	if(${totalPrice}<point){
		alert("주문금액보다 사용포인트가 클 수 없으며 배송료는 포인트를 사용할 수 없습니다.");
		return;
	}
	totalPrice -= point;
	if(totalPrice<30000){ //주문금액이 3만원이하일때는 배송료3천원부과
		alert("총 주문금액이 30,000원 미만이기에 배송료 3,000원이 부과됩니다.");
		totalPrice+=3000;
		$("#delivery_cost").val(3000);
	}else{
		$("#delivery_cost").val(0);
	}
	
	
	let obj = {'point':point};
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : totalPrice,
	    buyer_email : '${member.member_email}',
	    buyer_name : '${member.member_name}'
	}, function(rsp) {
            $.ajax({
            	type : "POST",
            	url : "/verifyIamport/" + rsp.imp_uid,
            	data: JSON.stringify(obj),
   			 	contentType : "application/json; charset=UTF-8",
   			 	dataType:"JSON"
            }).done(function(data) {
            	console.log(data);
         
            	if(rsp.paid_amount == data.response.amount&&data.response.amount == totalPrice){
            		alert("결제 성공");
            		$("#order_price").val(data.response.amount);
            		$("#imp_uid").val(data.response.impUid);
					$("#orderform").submit();
            	}else if(rsp.paid_amount != data.response.amount||data.response.amount != totalPrice){
            		alert("결제 오류");
            	}
           
            });
	});
}
</script>
<%@include file="../footer.jsp" %>
</body>
</html>