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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../../../resources/css/product.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>

.btn {
	width: 600px;
	display: inline-block;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	text-align: center;
	text-decoration: none;
	vertical-align: middle;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
	background-color: transparent;
	border: 1px solid transparent;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.w-100 {
	width: 100% !important;
}

.btn-lg, .btn-group-lg>.btn {
	padding: 0.5rem 1rem;
	font-size: 1.25rem;
	border-radius: 0.3rem;
}

.btn-primary {
	color: #fff;
	background-color: #a4e25e;
	border-color: #d1f779;
}

.btn-primary:hover {
	color: #fff;
	background-color: #73c431;
	border-color: #1ad123;
}


</style>
</head>
<body>
<%@include file="../header.jsp" %>      
  <br>
  <br>
	<h3>상품 등록✅</h3>
	<br>
	
		<form:form id="ProductInsert" commandName="ProductCommand" action="/product/insert" method="POST" enctype="multipart/form-data">
			<table>
				<tr>
					<th>상품 이름</th>
					<td><form:input path="product_Name"/></td>
				</tr>
				<tr>
					<th>카테고리1</th>
					<td><form:input path="category_1"/></td>
				</tr>
				<tr>
					<th>카테고리2</th>
					<td><form:input path="category_2"/></td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td><form:input path="product_Price"/></td>
				</tr>
				<tr>
					<th>상품수량</th>
					<td><form:input path="product_Price"/></td>
				</tr>
				<tr>
					<th>조리시간</th>
					<td><form:input path="product_CookingTime"/></td>
				</tr>
				<tr>
					<th>내용량</th>
					<td> <form:input path="product_weight"/></td>
				</tr>
				<tr>
					<th>보관방법</th>
					<td><form:input path="product_Storage"/></td>
				</tr>
				<tr>
					<th>상품 메인 사진</th>
					<td><input type="file" name="uploadFile" class="fileClass"></td>
				</tr>
				<tr>
					<th>상품 클릭시 보이는 사진</th>
					<td><input type="file" name="uploadFile" class="fileClass"></td>
				</tr>
				<tr>
					<th>상품 디테일 사진</th>
					<td><input type="file" name="uploadFile" class="fileClass"></td>
				</tr>
				<tr>
					<th>상품 정보 사진</th>
					<td><input type="file" name="uploadFile" class="fileClass"></td>
				</tr>
			</table>

			
			 	<!-- 옵션상품명1 : <input type="text" name="product_Option[0].option_Name">
			 	옵션상품가격1 : <input type="text" name="product_Option[0].option_Price">
			 	옵션상품수량1 : <input type="text" name="product_Option[0].option_Count"><br>
			 	옵션상품명2 : <input type="text" name="product_Option[1].option_Name">
			 	옵션상품가격2 : <input type="text" name="product_Option[1].option_Price">
			 	옵션상품수량2 : <input type="text" name="product_Option[1].option_Count"><br>
			 	옵션상품명3 : <input type="text" name="product_Option[2].option_Name">
			 	옵션상품가격3 : <input type="text" name="product_Option[2].option_Price">
			 	옵션상품수량3 : <input type="text" name="product_Option[2].option_Count"><br>
			 	 -->
		 	<input type="button" id="optionAdd" value="옵션상품추가">
		 	<div id="option"></div> 
		 ${msg}
		 <button class="btn btn-primary btn-lg btn-block" type="button" id="uploadBtn" name="uploadBtn">상품 등록하기</button>

		</form:form>



<br>
<br>

 <%@include file="../footer.jsp" %>    	
<script>
$(document).ready(function(){
	let regex = new RegExp('(.*?)\.(jpeg|jpg|png|gip|svg)$','i');
	let maxSize = 5242880; //5MB//5242880
	
	/* let optionCount = 0; */
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	$("#uploadBtn").on("click",function(){
		let check = 0;
		$(".fileClass").each(function (idx,item){	
			if(undefined==item.files[0]){
				alert("상품 이미지파일을 모두 등록해 주세요.");
			}
			if(!checkExtension(item.files[0].name, item.files[0].size)){
				return false;
			}else{
				check+=1;
			}
		});
		if(check==4){
			$("#ProductInsert").submit();
		}
	});
	let number = 0;
	$("#optionAdd").on("click",function(){
		 
		let option = document.getElementById("option");
		let div = document.createElement("div");
        let p = document.createElement('p');

	 	div.setAttribute("id","div"+number+"");
	 					
	 	let span1 = document.createElement('span');
	 	span1.innerHTML="옵션상품명 : ";
	 	let productName = document.createElement('input');
	 	productName.setAttribute("type","text");
	 	productName.setAttribute("name","product_Option["+number+"].option_Name");
	 	
	 	let span2 = document.createElement('span');
	 	span2.innerHTML="<br> 옵션상품가격 : ";
	 	let productPrice = document.createElement('input');
	 	productPrice.setAttribute("type","text");
	 	productPrice.setAttribute("name","product_Option["+number+"].option_Price");
	 	
	 	let span3 = document.createElement('span');
	 	span3.innerHTML="<br> 옵션상품수량 : ";
	 	let productCount = document.createElement('input');
	 	productCount.setAttribute("type","text");
	 	productCount.setAttribute("name","product_Option["+number+"].option_Count");
	 	
	 	let span4 = document.createElement('span');
	 	span4.innerHTML="<br>";
	 	let removeBtn = document.createElement('input');
	 	removeBtn.setAttribute("type","button");
	 	removeBtn.setAttribute("value","삭제");
	 	removeBtn.setAttribute("onclick","remove("+number+")");
	 	
	 	
	 	p.appendChild(span1);
	 	p.appendChild(productName);
	 	p.appendChild(span2);
	 	p.appendChild(productPrice);
	 	p.appendChild(span3);
	 	p.appendChild(productCount);
	 	p.appendChild(span4);
	 	p.appendChild(removeBtn);
	 	
	 	div.appendChild(p);
	 	
	 	option.appendChild(div);
	 	
	 	++number;
	}); 
});
function remove(index){
	 document.getElementById('div'+index).remove();
}

/* $("#file").on('change',function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName);
	}); */
</script>
</body>
</html>