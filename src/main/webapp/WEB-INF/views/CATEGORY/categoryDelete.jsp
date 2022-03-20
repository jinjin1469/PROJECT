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

</head>
<body>
<form:form id="CategoryDelete" commandName="Category" action="/category/categoryDelete" method="POST">
		구분 : <select name="classification" class="choice">
				<option class="delete">선택하세요</option>
				<option value="테마별">테마별</option>
				<option value="사이드디쉬">사이드디쉬</option>
				<option value="브랜드관">브랜드관</option>
			  </select><br>
		<div id="edit">
		 </div>
		 <input type="button" id="checkBtn" value="삭제" style="display:none;">
</form:form>


<script>
$(document).ready(function(){
	let choiceNum = 0;
	let check = 0;
	$('.choice').change(function(){
		let sel = $(this).val();
		if(sel == "테마별"){
			document.getElementById("checkBtn").style.display='block';
			$('.delete').remove();
			$('.op').remove();
			
			let edit = document.getElementById("edit");
		    let p = document.createElement('p');
		    
			let span = document.createElement('span');
		 	span.setAttribute("class","op");
		 	span.innerHTML="카테고리명 : ";
		 	
		 	let CategoryName = document.createElement('select');
		 	CategoryName.setAttribute("name","category_title");
		 	CategoryName.setAttribute("class","op");
			<c:forEach var="menu1" items="${menu1}" varStatus="n">
				let opt${n.index} = document.createElement('option');
				opt${n.index}.setAttribute("value","${menu1.category_title}");
				opt${n.index}.innerHTML="${menu1.category_title}";
				CategoryName.appendChild(opt${n.index});
		 	</c:forEach>
		 
		 	p.appendChild(span);
		 	p.appendChild(CategoryName);

			edit.appendChild(p);
		}else if(sel == "사이드디쉬"){
			document.getElementById("checkBtn").style.display='block';
			$('.delete').remove();
			$('.op').remove();
			
			let edit = document.getElementById("edit");
		    let p = document.createElement('p');
		    
			let span = document.createElement('span');
		 	span.setAttribute("class","op");
		 	span.innerHTML="카테고리명 : ";
		 	
		 	let CategoryName = document.createElement('select');
		 	CategoryName.setAttribute("name","category_title");
		 	CategoryName.setAttribute("class","op");
			<c:forEach var="menu2" items="${menu2}" varStatus="n">
				let opt${n.index} = document.createElement('option');
				opt${n.index}.setAttribute("value","${menu2.category_title}");
				opt${n.index}.innerHTML="${menu2.category_title}";
				CategoryName.appendChild(opt${n.index});
		 	</c:forEach>
		 
		 	p.appendChild(span);
		 	p.appendChild(CategoryName);

			edit.appendChild(p);
		}else if(sel == "브랜드관"){
			document.getElementById("checkBtn").style.display='block';
			$('.delete').remove();
			$('.op').remove();
			
			let edit = document.getElementById("edit");
		    let p = document.createElement('p');
		    
			let span = document.createElement('span');
		 	span.setAttribute("class","op");
		 	span.innerHTML="카테고리명 : ";
		 	
		 	let CategoryName = document.createElement('select');
		 	CategoryName.setAttribute("name","category_title");
		 	CategoryName.setAttribute("class","op");
			<c:forEach var="menu3" items="${menu3}" varStatus="n">
				let opt${n.index} = document.createElement('option');
				opt${n.index}.setAttribute("value","${menu3.category_title}");
				opt${n.index}.innerHTML="${menu3.category_title}";
				CategoryName.appendChild(opt${n.index});
		 	</c:forEach>
		 
		 	p.appendChild(span);
		 	p.appendChild(CategoryName);

			edit.appendChild(p);
		}
	});
	 $("#checkBtn").on("click",function(){
		 let valueCheck = $("select[name=category_title]").val();
		 let con = confirm("["+valueCheck+"] 삭제하시겠습니까?");
		 if(con==true){
			 $("#CategoryDelete").submit();
		 }else{
			 alert("취소");
		 }

	}); 

});

</script>

</body>
</html>