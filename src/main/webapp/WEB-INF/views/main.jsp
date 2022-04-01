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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>밀슐랭</title>
<style>
.b{border : solid 1px black;}
</style>
</head>
<body>
	<%@include file="header.jsp"%>

	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="./resources/IMG/banner1.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <a href="https://fresheasy.co.kr/" style="padding:0px;"><img src="./resources/IMG/banner2.jpg" class="d-block w-100" alt="..."></a>
	    </div>
	    <div class="carousel-item">
	      <img src="./resources/IMG/banner3.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="./resources/IMG/banner4.jpg" class="d-block w-100" alt="...">
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


<div class="container d-flex flex-wrap d-flex align-items-center">
	<h3>베스트</h3>
	<div class="card-group">
		<div class="card">
			<img src="/uploadedIMG/2022/03/매생이M.jpg" class="card-img-top" alt="..." onmouseover="this.src='/uploadedIMG/2022/03/매생이H.jpg'"  onmouseout="this.src='/uploadedIMG/2022/03/매생이M.jpg'">
		    <div class="card-body">
		      <h5 class="card-title">백년가게 가포옛날영도집 흑산도 장어탕</h5>
		      <p class="card-text">6500원</p>
		    </div>
	  	</div>
	  	<div class="card">
		    <img src="./resources/IMG/food2.PNG" class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">부산집 언양식불고기</h5>
		      <p class="card-text">6900원</p>
		    </div>
	  	</div>
	  	<div class="card">
		    <img src="./resources/IMG/food3.PNG" class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">바를정육 LA갈비꽃선물세트</h5>
		      <p class="card-text">89900원</p>
		    </div>
	  	</div>
	</div>
</div>
<script>

	
    /* if ( rsp.success ) {
	
	let imp_uid = rsp.imp_id;
	let merchant_uid = rsp.merchant_uid;
    let paid_amount = rsp.paid_amount;
    let apply_num = rsp.apply_num;

	let data = {imp_uid:imp_uid,
  			merchant_uid:merchant_uid,
  			paid_amount:paid_amount,
  			apply_num:apply_num
    }; */
			/* $.ajax({
            	  url: "insertOrdList",
            	  data:data,
            	  success: function(data){
  		              let msg = "결제가 완료되었습니다.\n";
  		              msg += "고유ID: " + imp_uid;
  		              msg += "\n상점거래ID : " + merchant_uid;
  		              msg += "\n결제금액 : " + paid_amount;
  		              msg += "\n 카드승인번호 : " + apply_num;
  		              alert(msg);
  		              location.href="/";
            	  }
              }) */
	    	
	    /* } else {
	        let msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    } */
}
</script>
<%@include file="footer.jsp"%>
</body>
</html>
























