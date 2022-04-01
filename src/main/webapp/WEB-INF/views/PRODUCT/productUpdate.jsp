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
<style>
	.b{
		border : solid 1px black;
	}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
	<h3>상품 수정</h3>
	
		<form:form id="ProductUpdate" commandName="ProductCommand" action="/product/update/${ProductCommand.option_join_number}" method="POST" enctype="multipart/form-data">
			카테고리1 : <select name="category_1">
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
			  		 </select><br>
			카테고리2 : <select name="category_2">
							<option value="">NULL</option>
							<c:forEach var="menu3" items="${menu3}">
								<c:if test="${menu3.category_title==category_2}">
									<option value="${menu3.category_title}" selected>${menu3.category_title}</option>
								</c:if>
								<c:if test="${menu3.category_title!=category_2}">
									<option value="${menu3.category_title}">${menu3.category_title}</option>
								</c:if>
							</c:forEach>	
			  		 </select><br>
			상품이름 : <form:input path="product_Name"/><br>
			상품가격 : <form:input path="product_Price"/><br>
			상품수량 : <form:input path="product_Count"/><br>
			조리시간 : <form:input path="product_CookingTime"/><br>
			내용량 : <form:input path="product_weight"/><br>
			보관방법 : <form:input path="product_Storage"/><br>
		 	Product Main Image : <input type="file" name="uploadFile" class="fileClass"><br>
		 	Product DetailCut Image : <input type="file" name="uploadFile" class="fileClass"><br>
		 	Product Information Image : <input type="file" name="uploadFile" class="fileClass"><br>
		 	<c:if test="${!empty productOption}">
			 	<c:forEach var="product_Option" items="${productOption}" varStatus="n">
				 	<input type="hidden" name="product_Option[${n.index}].option_number" value="${product_Option.option_number}">
				 	옵션상품명 : <input type="text" name="product_Option[${n.index}].option_Name" value="${product_Option.option_Name}">
				 	옵션상품가격 : <input type="text" name="product_Option[${n.index}].option_Price" value="${product_Option.option_Price}">
				 	옵션상품수량 : <input type="text" name="product_Option[${n.index}].option_Count" value="${product_Option.option_Count}">
				 	<input type="checkbox" name="product_Option[${n.index}].delete_check" value="1"> : 삭제<br>
			 	</c:forEach>
		 	</c:if>
		 	<div id="option">
		 	</div>
		 	<input type="button" id="optionAdd" value="옵션상품추가">
		 <input type="button" id="uploadBtn" value="등록">
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
		
		$(".fileClass").each(function (idx,item){	
			if(undefined!=item.files[0]){
				if(!checkExtension(item.files[0].name, item.files[0].size)){
					return false;
			}}
			
		});
		if(check==0){
			$("#ProductUpdate").submit();
		}
		
	});
	
	let number = 51;
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
	 	span2.innerHTML=" 옵션상품가격 : ";
	 	let productPrice = document.createElement('input');
	 	productPrice.setAttribute("type","text");
	 	productPrice.setAttribute("name","product_Option["+number+"].option_Price");
	 	
	 	let span3 = document.createElement('span');
	 	span3.innerHTML=" 옵션상품수량 : ";
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
function remove(index){
	 document.getElementById('div'+index).remove();
}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js">
</script>
<%@include file="../footer.jsp" %>
</body>
</html>