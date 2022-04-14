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
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="../../../resources/css/product.css">
<style>
.btn {
	margin-top:20px;
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

.btnDelete {
	margin-top:20px;
	width: 300px;
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


.btn2 {
	width: 300px;
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

.btn-primary2 {
	color: #fff;
	background-color: #89BC4E;
	border-color: #d1f779;
}

.btn-primary3 {
	color: #fff;
	background-color: #FF8A8E;
	border-color: #d1f779;
}

.btn-primary3:hover {
	color: #fff;
	background-color: #FF8A8E;
;
	border-color: #1ad123;
}

.btn-primary:hover {
	color: #fff;
	background-color: #73c431;
	border-color: #1ad123;
}

.btn-primary2:hover {
	color: #fff;
	background-color: #75A142
;
	border-color: #1ad123;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
  <br>
  <br>
	<h3>상품 수정✅</h3>
	<br>
	<div class="Info">* 모든 정보는 필수로 입력 부탁드립니다.</div>
		<form:form id="ProductUpdate" commandName="ProductCommand" action="/product/update/${ProductCommand.option_join_number}" method="POST" enctype="multipart/form-data">
			<table>
				<tr>
					<th>상품이름</th> 
					<td><input type="text" name="product_Name" id="product_Name" value="${product_name}">
					<span class="name regex" style="text-align:left;"></span>
					<input type="hidden" id="nameDoubleChk">
				</tr>
				<tr>
					<th>카테고리1</th> 
					<td><select name="category_1">
							<option value="">해당없음</option>
							<c:forEach var="menu1" items="${menu1}">
								<c:if test="${menu1.category_title==category_1}">
									<option value="${menu1.category_title}" selected>${menu1.category_title}</option>
								</c:if>
								<c:if test="${menu1.category_title!=category_1}">
									<option value="${menu1.category_title}">${menu1.category_title}</option>
								</c:if>
							</c:forEach>
							<c:forEach var="menu2" items="${menu2}">
								<c:if test="${menu2.category_title==category_1}">
									<option value="${menu2.category_title}" selected>${menu2.category_title}</option>
								</c:if>
								<c:if test="${menu2.category_title!=category_1}">
									<option value="${menu2.category_title}">${menu2.category_title}</option>
								</c:if>
							</c:forEach>
			  		 </select></td>
				</tr>
				<tr>
					<th>카테고리2</th> 
					<td><select name="category_2">
							<option value="">해당없음</option>
							<c:forEach var="menu3" items="${menu3}">
								<c:if test="${menu3.category_title==category_2}">
									<option value="${menu3.category_title}" selected>${menu3.category_title}</option>
								</c:if>
								<c:if test="${menu3.category_title!=category_2}">
									<option value="${menu3.category_title}">${menu3.category_title}</option>
								</c:if>
							</c:forEach>	
			  		 </select></td>
				</tr>
				<tr>
					<th>상품가격</th> 
					<td><form:input path="product_Price"/></td>
				</tr>
				<tr>
					<th>상품수량</th> 
					<td><form:input path="product_Count"/></td>
				</tr>
				<tr>
					<th>조리시간</th> 
					<td><form:input path="product_CookingTime"/></td>
				</tr>
				<tr>
					<th>내용량</th> 
					<td><form:input path="product_weight"/></td>
				</tr>
				<tr>
					<th>보관방법</th> 
					<td><select name="product_Storage">
						<c:if test="${storage=='냉동'}">
							<option value="냉동" selected>냉동</option>
							<option value="냉장">냉장</option>
							<option value="실온">실온</option>
						</c:if>
						<c:if test="${storage=='냉장'}">
							<option value="냉동">냉동</option>
							<option value="냉장" selected>냉장</option>
							<option value="실온">실온</option>
						</c:if>
						<c:if test="${storage=='실온'}">
							<option value="냉동">냉동</option>
							<option value="냉장">냉장</option>
							<option value="실온" selected>실온</option>
						</c:if>
			  		</select></td>
				</tr>
				<tr>
					<th>Product Main Image</th> 
					<td><input type="file" name="uploadFile" class="fileClass"></td>
				</tr>
				<tr>
					<th>Product DetailCut Image</th> 
					<td><input type="file" name="uploadFile" class="fileClass"></td>
				</tr>
				<tr>
					<th>Product Information Image</th> 
					<td><input type="file" name="uploadFile" class="fileClass"></td>
				</tr>
				<form:hidden path="option_loop"/>
			</table>
		 	<c:if test="${!empty productOption}">
			 	<c:forEach var="product_Option" items="${productOption}" varStatus="n">
				 	<input type="hidden" name="product_Option[${n.index}].option_number" value="${product_Option.option_number}">
				 	옵션상품명 : <input type="text" name="product_Option[${n.index}].option_Name" value="${product_Option.option_Name}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
				 	옵션상품가격 : <input type="text" name="product_Option[${n.index}].option_Price" value="${product_Option.option_Price}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
				 	옵션상품수량 : <input type="text" name="product_Option[${n.index}].option_Count" value="${product_Option.option_Count}">
				 	<input type="checkbox" name="product_Option[${n.index}].delete_check" value="1"> : 삭제<br>
			 	</c:forEach>
		 	</c:if>
		 	<div id="option">
		 	</div>
		 	<br>
			<input type="button" id="optionAdd"  class="btn2 btn-primary2 btn-lg btn-block" value="옵션상품추가">
		 	<div id="option">
		 	</div>
		 <button class="btn btn-primary btn-lg btn-block" type="button" id="uploadBtn" name="uploadBtn">상품 수정하기</button>
		</form:form>
		
		
<script>
$(document).ready(function(){
	let regex = new RegExp('(.*?)\.(jpeg|jpg|png|gip|svg)$','i');
	let maxSize = 5242880; //5MB//5242880
	let check = 0;
	
	/* let optionCount = 0; */
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			check++;
			return false;
		}
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			check++;
			return false;
		}
		return true;
	}
	$("#uploadBtn").on("click",function(){
		let nameDoubleChk = document.getElementById('nameDoubleChk').value
		let product_Price = document.getElementById("product_Price").value;
		$(".fileClass").each(function (idx,item){	
			if(undefined!=item.files[0]){
				if(!checkExtension(item.files[0].name, item.files[0].size)){
					return false;
			}}
			
		});
		if(product_Price<100){
			alert('판매가격을 100원이상으로 설정해주세요.');
			return;
		}
		if(nameDoubleChk == 'false'){
			   alert("상품명을 확인해주세요.");
			   return;   
		   }
		if(check==0){
			$("#ProductUpdate").submit();
		}
		
	});
	
	let number = ${option_loop};
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
	 	removeBtn.setAttribute("class","btnDelete btn-primary3 btn-lg btn-block");
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
	 $("#product_Name").on("input",function(){
			let product_Name = document.getElementById("product_Name").value;
			if(product_Name != "${product_name}"){
				let obj = {'product_Name':product_Name};
				$.ajax({ 
					 type:'POST',
					 async:true,
					 url:'/product/productNameCheck',
					 data: JSON.stringify(obj),
					 contentType : "application/json; charset=UTF-8",
					 dataType:"JSON",
					 success : function(data) { 
						 console.log(data);
						 if(data.nameCheck>0){
							 $(".name.regex").html("중복된 제품명입니다.");
						     $(".name.regex").css("color","red");
						     $("#nameDoubleChk").val("false"); 
						 }else{
							 $("#nameDoubleChk").val("true"); 
						 }
					},error:function(){
						console.log("Error!!..");	
					}
				});
			}
			
			
			var regex = /^[0-9a-zA-Z가-힣,\\[\].\s]+$/g;
			var result = regex.exec($("#product_Name").val());
			   if(result != null){
			      $(".name.regex").html("");  
			   }else{
			       $(".name.regex").html("특수문자[],만 입력 가능");
			       $(".name.regex").css("color","red");
			   }
			   
			    
		});
	 
	 
});

function remove(index){
	 document.getElementById('div'+index).remove();
}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js">
</script>
<%@include file="../footer.jsp" %>
</body>
</html>