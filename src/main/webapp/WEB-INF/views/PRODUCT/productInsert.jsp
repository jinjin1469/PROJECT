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
</head>
<body>
<%@include file="../header.jsp" %>      
  
	<h3>파일 업로드</h3>
	
		<form:form id="ProductInsert" commandName="ProductCommand" action="/product/insert" method="POST" enctype="multipart/form-data">
			카테고리1 : <form:input path="category_1"/><br>
			카테고리2 : <form:input path="category_2"/><br>
			상품이름 : <form:input path="product_Name"/><br>
			상품가격 : <form:input path="product_Price"/><br>
			상품수량 : <form:input path="product_Count"/><br>
			조리시간 : <form:input path="product_CookingTime"/><br>
			내용량 : <form:input path="product_weight"/><br>
			보관방법 : <form:input path="product_Storage"/><br>
		 	Product Main Image : <input type="file" name="uploadFile" class="fileClass"><br>
		 	Product Main.hover Image : <input type="file" name="uploadFile" class="fileClass"><br>
		 	Product DetailCut Image : <input type="file" name="uploadFile" class="fileClass"><br>
		 	Product Information Image : <input type="file" name="uploadFile" class="fileClass"><br>
		 	옵션상품명1 : <input type="text" name="product_Option[0].option_Name">
		 	옵션상품가격1 : <input type="text" name="product_Option[0].option_Price">
		 	옵션상품수량1 : <input type="text" name="product_Option[0].option_Count"><br>
		 	옵션상품명2 : <input type="text" name="product_Option[1].option_Name">
		 	옵션상품가격2 : <input type="text" name="product_Option[1].option_Price">
		 	옵션상품수량2 : <input type="text" name="product_Option[1].option_Count"><br>
		 	옵션상품명3 : <input type="text" name="product_Option[2].option_Name">
		 	옵션상품가격3 : <input type="text" name="product_Option[2].option_Price">
		 	옵션상품수량3 : <input type="text" name="product_Option[2].option_Count"><br>
		 	
		 	<!-- <input type="button" id="optionAdd" value="옵션상품추가">
		 	<div id="option"></div> -->

		 ${msg}
		 <input type="button" id="uploadBtn" value="등록">
		</form:form>
		
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
	
	/* $("#optionAdd").on("click",function(){
		let option = document.getElementById('option');
		
		let span = document.createElement('span');
		let br = document.createElement('br');
		option.innerHTML="";
		
		
		let pName = document.createElement('p');
		pName.setAttribute("id","pName"+optionCount);
		document.('#pName'+optionCount).innerHTML="옵션이름"+optionCount+1+" : ";

		
		let productName = document.createElement('input');
		productName.setAttribute("type","text");
		productName.setAttribute("name","product_Option["+optionCount+"].option_Name");
		
		let pPrice = document.createElement('p');
		pName.setAttribute("id","pPrice"+optionCount);
		document.('#pPrice'+optionCount).innerHTML="옵션가격"+optionCount+1+" : ";
		
		let productPrice = document.createElement('input');
		productName.setAttribute("type","text");
		productName.setAttribute("name","product_Option["+optionCount+"].option_Price");
		
		let pCount = document.createElement('p');
		pName.setAttribute("id","pCount"+optionCount);
		document.('#pCount'+optionCount).innerHTML="옵션수량"+optionCount+1+" : ";
		
		let productCount = document.createElement('input');
		productName.setAttribute("type","text");
		productName.setAttribute("name","product_Option["+optionCount+"].option_Count");
		
		span.appendChild(productName);
		span.appendChild(productPrice);
		span.appendChild(productCount);
		
		option.appendChild(span);
		option.appendChild(br);
		
		optionCount++;
	}); */
});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js">
</script>
</body>
</html>