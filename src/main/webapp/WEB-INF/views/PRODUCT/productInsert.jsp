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
	<div class="Info">* 모든 정보는 필수로 입력 부탁드립니다.</div>
		<form:form id="ProductInsert" name="ProductCommand" action="/product/insert" method="POST" enctype="multipart/form-data">
			<table>
				<tr>
					<th>상품 이름</th>
					<td><input type="text" name="product_Name" id="product_Name" value="">
					<span class="name regex" style="text-align:left;"></span>
					</td>
				</tr>
				<tr>
					<th>카테고리1</th>
					<td><select name="category_1" class="choice1">
							<option class="delete1">선택하세요</option>
								<c:forEach var="menu1" items="${menu1}">
									<option value="${menu1.category_title}">${menu1.category_title}</option>
							 	</c:forEach>
							 	<c:forEach var="menu2" items="${menu2}">
									<option value="${menu2.category_title}">${menu2.category_title}</option>
						 		</c:forEach>
			  			</select>
			  		</td>
				</tr>
				<tr>
					<th>카테고리2</th>
					<td><select name="category_2" class="choice2">
							<option class="delete2">선택하세요</option>
							<c:forEach var="menu3" items="${menu3}">
								<option value="${menu3.category_title}">${menu3.category_title}</option>
							</c:forEach>
							<option value="">NULL</option>
			  			</select>
			  		</td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td><input type="text" name="product_Price" id="product_Price" value="" required></td>
				</tr>
				<tr>
					<th>상품수량</th>
					<td><input type="text" name="product_Count" id="product_Count" value="" required></td>
				</tr>
				<tr>
					<th>조리시간[육류생략]</th>
					<td><input type="text" name="product_CookingTime" id="product_CookingTime" value=""></td>
				</tr>
				<tr>
					<th>내용량</th>
					<td><input type="text" name="product_weight" id="product_weight" value="" required></td>
				</tr>
				<tr>
					<th>보관방법</th>
					<td><select name="product_Storage" class="choice3">
							<option class="delete3">선택하세요</option>
							<option value="냉동">냉동</option>
							<option value="냉장">냉장</option>
							<option value="실온">실온</option>
			  			</select>
			  		</td>
				</tr>
				<tr>
					<th>상품 메인 사진</th>
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

			<input type="button" id="optionAdd" value="옵션상품추가">
		 	<div id="option">
		 	</div>
		 <button class="btn btn-primary btn-lg btn-block" type="button" id="uploadBtn" name="uploadBtn">상품 등록하기</button>

		</form:form>



<br>
<br>

 <%@include file="../footer.jsp" %>    	
<script>
$(document).ready(function(){
	/* let optionCount = 0; */
	$('.choice1').change(function(){
		$('.delete1').remove();
	});
	$('.choice2').change(function(){
		$('.delete2').remove();
	});
	$('.choice3').change(function(){
		$('.delete3').remove();
	});
	
	let regex = new RegExp('(.*?)\.(jpeg|jpg|png|gip|svg)$','i');
	let maxSize = 5242880; //5MB//5242880
	
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
		if(check==3){
			
			var regex = /^[0-9a-zA-Z가-힣,\\[\].\s]+$/g;
			var result = regex.exec($("#product_Name").val());

			if(result != null){
				let category_1 = $(".choice1 option:selected").val();
				let category_2 = $(".choice2 option:selected").val();
				let product_Storage = $(".choice3 option:selected").val();
				let product_Price = document.getElementById("product_Price").value;
				let product_Count = document.getElementById("product_Count").value;
				let product_weight = document.getElementById("product_weight").value;
				if(category_1!='선택하세요'&&category_2!='선택하세요'&&product_Storage!='선택하세요'&&product_weight!=""){
					 if(product_Price<100){
						alert('판매가격을 100원이상으로 설정해주세요.');
						return;
					}else if(product_Count==0){
						alert('판매수량을 1개 이상으로 설정해주세요.');
						return;
					}else{
						$("#ProductInsert").submit();
					}
				}else{
					alert('모든 정보를 정확히 설정해주세요.');
				     return;
				}
			}else{
				alert('모든 정보를 정확히 설정해주세요.');
			    return;
			}
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
	 	p.appendChild(removeBtn);
	 	
	 	div.appendChild(p);
	 	
	 	option.appendChild(div);
	 	
	 	++number;

	 }); 
	 
	 
});

$("#product_Name").on("input",function(){
	   var regex = /^[0-9a-zA-Z가-힣,\\[\].\s]+$/g;
	   var result = regex.exec($("#product_Name").val());
	   if(result != null){
	      $(".name.regex").html("");  
	   }else{
	       $(".name.regex").html("특수문자[],만 입력 가능");
	       $(".name.regex").css("color","red");
	   }
	    
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