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
<link rel="stylesheet" href="../../../resources/css/mypage.css">
<script src="../../../resources/js/calendar.js"></script>
<title>ADMIN</title>
<style>


.menu{
	text-align: left;
	font-size: 12px;
	margin: 0 auto;
	padding: 0px;
	color: #696969;
}


</style>


</head>
<body>
<%@include file="../header.jsp"%>
<br>
<br>
<div id="content"> 

<aside>
<div class="menu">
	<p><strong>상품관리</strong></p>
	<hr>
		<p><a href="<c:url value='/product/insert'/>" class="menu">상품등록</a></p>
		<p><a href="<c:url value='/category/productCategoryEdit'/>" class="menu">상품카테고리변경</a></p>
		<p><a href="<c:url value='/category/stopOrStartSelling'/>" class="menu">상품판매중지/상품판매재개</a></p>
		<p><a href="<c:url value='/product/List/totalList' />" class="menu">상품전체보기</a></p>
	<br>
	<p><strong>쇼핑관리</strong></p>
	<hr>

		<p><a href="<c:url value='/mypage/qnalist' />" class="menu">1:1 문의 모아보기</a></p>
		<p><a href="<c:url value='/admin/orderStatus' />" class="menu">배송관리</a></p>
		<p><a href="<c:url value='/admin/adminReviewList' />" class="menu">리뷰 모아보기</a></p>
		<p><a href="<c:url value='/notice/main' />" class="menu">F&Q</a></p>
	<br>
	<p><strong>카테고리관리</strong></p>
	<hr>
		<p><a href="javascript:categoryAdd();" class="menu">카테고리추가</a></p>
		<p><a href="javascript:categoryRemove();" class="menu">카테고리삭제</a></p>
		<p><a href="javascript:categoryEdit();" class="menu">카테고리순서변경</a></p>
		
	<br>
	<p><strong>매출관리</strong></p>
	<hr>
		<p><a href="<c:url value='/admin/Sales' />" class="menu">매출현황</a></p>
		
	<br>

</div>
</aside>

<section>

		<h2>전체매출📃</h2>
		<hr>
<label style="float:right;">해당 월 전체 매출금액 : <label id="total_amount"></label></label><br>
<label style="float:right;">해당 월 확정 매출금액 : <label id="total_amount2"></label></label>
<div id="chartDiv">
	<div>
	  <canvas id="monthSalesChart"></canvas>
	</div>
</div>

<input type="month" id="selectMonth" onchange="selectMonth()">


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	
</section>
</div>




<br>
<br>
<script>

window.onload = function(){// 화면이 로드된 후 자동으로 실행되는 영역 =>현재 시스템 날짜에 맞는 달력 생성
    let now = new Date(); // 2021년 12월 23일 오후 5시 25분~~~ => [2021년 12월 1일(1일에 해당하는 요일 )] 
    let nowMonth = new Date(now.getFullYear(),now.getMonth());
    // [2021년 12월 1일(1일에 해당하는 요일 )0시 0분 0초] 
    changeHead(nowMonth);
    buildCalendar(nowMonth);
}
function buildCalendar(selectDate){// 실제 달력을 작성하는 함수
	let Cnt = [];
    let monthLastDay = lastDate(selectDate);//해당 월의 마지막 날짜 정보
    let weekInfo = selectDate.getDay();  // 해당월의 1일의 요일 : 일(0),월(1)~~토(6)   수:3
    let dateCnt = selectDate.getDate()-weekInfo;     // 날짜를 찍어줄 번호  (1,2,3,4,~~~~31)
                // 1일이 있는 주에서 일요일에 해당하는 시작 번호
    while(true){
        let weekLine = document.createElement('tr');  // 각 주 정보(행)     <tr></tr>
            let weekDay = document.createElement('td');        // <td></td>
            if(0<dateCnt && dateCnt<=monthLastDay ){   //  1일부터 마지막날까지 출력하기 위한 조건
				Cnt.push(dateCnt);
            }
            dateCnt++;
        if(dateCnt>monthLastDay){   //날짜 카운트가 달의 마지막 날을 넘어선 경우
            break;
        }
    }
monthSalesChart(Cnt,selectDate);
}

function monthSalesChart(Cnt,selectDate){
	let yearMonth = null;
	if((selectDate.getMonth() + 1)<10){
		yearMonth = selectDate.getFullYear()+'/0'+(selectDate.getMonth() + 1)+'/';
	}else{
		yearMonth = selectDate.getFullYear()+'/'+(selectDate.getMonth() + 1)+'/';
	}
   
  let day = [];
  for (let i = 0; i < Cnt.length;i++) {
	  if(i<10){
		  day[i] = yearMonth +'0'+ Cnt[i];
	  }else{
		  day[i] = yearMonth + Cnt[i];
	  }
  }
  let DBsales_regdate = new Array();
  let DBorder_price = new Array();
  let sales_regdate = [];
  let order_price = [];
  let DBsales_regdate2 = new Array();
  let DBorder_price2 = new Array();
  let sales_regdate2 = [];
  let order_price2 = [];
  
  let labels = [];
	  for (let i = 0; i < Cnt.length;i++) {
		  labels.push(Cnt[i]);
		  sales_regdate[i] = day[i];
		  order_price[i] = 0; 
		  sales_regdate2[i] = day[i];
		  order_price2[i] = 0;
	  }
  let data = {
    labels: labels,
    datasets: [{
      label: '전체매출금액',
      backgroundColor: 'rgb(255, 99, 132)',
      borderColor: 'rgb(255, 99, 132)',
      data: []},
     {
        label: '확정매출금액',
        backgroundColor: 'rgb(75, 127, 205)',
        borderColor: 'rgb(75, 127, 205)',
        data: []}
    ]
  };
  
  <c:forEach var="allSales" items="${allSales}">
  	DBsales_regdate.push("${allSales.sales_regdate}");
  	DBorder_price.push("${allSales.order_price}");
  </c:forEach> 
  <c:forEach var="confirmationSales" items="${confirmationSales}">
	DBsales_regdate2.push("${confirmationSales.sales_regdate}");
	DBorder_price2.push("${confirmationSales.order_price}");
  </c:forEach> 
  
  let total_price = 0;
  let total_price2 = 0;
  for(let i=0;i<Cnt.length;i++){
	  for(let j=0;j<DBsales_regdate.length;j++){
		 if(sales_regdate[i]==DBsales_regdate[j]){
			  order_price[i]=DBorder_price[j];
		  }
		 if(sales_regdate2[i]==DBsales_regdate2[j]){
			  order_price2[i]=DBorder_price2[j];
		  }
	  } 
  } 
  for(let i=0;i<Cnt.length;i++){
	  total_price += parseInt(order_price[i]);
	  total_price2 += parseInt(order_price2[i]);
	  data["datasets"][0]["data"][i] = order_price[i];
	  data["datasets"][1]["data"][i] = order_price2[i];
  }
  

  let config = {
    type: 'line',
    data: data,
    options: {}
  };
  $("#total_amount").html(total_price.format());
  $("#total_amount2").html(total_price2.format());

  const myChart = new Chart(
		    document.getElementById('monthSalesChart'),
		    config
		  );
}	

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
function categoryEdit(){
	open('/category/categorySequence','배너 추가','width=400px,height=400px,status=false');
}
function categoryAdd(){
	open('/category/categoryInsert','배너 추가','width=400px,height=200px,status=false');
}
function categoryRemove(){
	open('/category/categoryDelete','배너 추가','width=400px,height=200px,status=false');
}
</script>
<%@include file="../footer.jsp"%>

</body>
</html>