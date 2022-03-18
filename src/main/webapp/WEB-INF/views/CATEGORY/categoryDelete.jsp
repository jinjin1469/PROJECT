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
<form:form id="CategoryAdd" commandName="Category" action="/category/categoryInsert" method="POST">
		구분 : <select name="classification" class="choice">
				<option class="delete">선택하세요</option>
				<option value="테마별">테마별</option>
				<option value="사이드디쉬">사이드디쉬</option>
				<option value="브랜드관">브랜드관</option>
			  </select><br>
		카테고리명 <input type="text" name="category_title" id="show" style="display:none;"/><br>
		<div id="edit">
		 </div>
		 <input type="button" id="checkBtn" value="등록" style="display:none;">
</form:form>


<script>
$(document).ready(function(){
	let choiceNum = 0;
	let check = 0;
	$('.choice').change(function(){
		let sel = $(this).val();
		if(sel == "테마별"){
			document.getElementById("checkBtn").style.display='block';
			document.getElementById("show").style.display='block';
			$('.delete').remove();
			choiceNum = 1;
			$('.op').remove();

			let edit = document.getElementById("edit");
		    let p = document.createElement('p');
			 	
			let CategoryNum = document.createElement('input');
			CategoryNum.setAttribute("type","hidden");
			CategoryNum.setAttribute("name","category_sort");
			CategoryNum.setAttribute("value","${menu1Count+1}");
			CategoryNum.setAttribute("class","op");
				 
			p.appendChild(CategoryNum);

			edit.appendChild(p);
		}else if(sel == "사이드디쉬"){
			document.getElementById("checkBtn").style.display='block';
			document.getElementById("show").style.display='block';
			$('.delete').remove();
			choiceNum = 2;
			$('.op').remove();

			let edit = document.getElementById("edit");
	       	let p = document.createElement('p');
			 	
			let CategoryNum = document.createElement('input');
			CategoryNum.setAttribute("type","hidden");
			CategoryNum.setAttribute("name","category_sort");
			CategoryNum.setAttribute("value","${menu2Count+1}");
			CategoryNum.setAttribute("class","op");
				 
			p.appendChild(CategoryNum);

			edit.appendChild(p);
		}else if(sel == "브랜드관"){
			document.getElementById("checkBtn").style.display='block';
			document.getElementById("show").style.display='block';
			$('.delete').remove();
			choiceNum = 3;
			$('.op').remove();

			let edit = document.getElementById("edit");
		    let p = document.createElement('p');
			 	
			let CategoryNum = document.createElement('input');
			CategoryNum.setAttribute("type","hidden");
			CategoryNum.setAttribute("name","category_sort");
			CategoryNum.setAttribute("value","${menu3Count+1}");
			CategoryNum.setAttribute("class","op");
				 
			p.appendChild(CategoryNum);

			edit.appendChild(p);
		}
	});
	 $("#checkBtn").on("click",function(){
		let titlecheck = document.getElementById("show").value;
		let menu = new Array();
		if(choiceNum==1){
			menu = new Array();
			<c:forEach var="menu1" items="${menu1}">
				menu.push("${menu1.category_title}");
			</c:forEach>
            for(let i=0;i<menu.length;i++){
               if(menu[i]==titlecheck){
					check = 1;
				}
            }
		} else if(choiceNum==2){
			menu = new Array();
			<c:forEach var="menu2" items="${menu2}">
				menu.push("${menu2.category_title}");
			</c:forEach>
        	for(let i=0;i<menu.length;i++){
           		if(menu[i]==titlecheck){
					check = 1;
				}
        	}
		}else if(choiceNum==3){
			menu = new Array();
			<c:forEach var="menu3" items="${menu3}">
				menu.push("${menu3.category_title}");
			</c:forEach>
    		for(let i=0;i<menu.length;i++){
       			if(menu[i]==titlecheck){
					check = 1;
				}
    		}
		}   
		
		if(check==0){
			$("#CategoryAdd").submit();
		}else{
			alert("중복되지 않은 카테고리명을 쓰세요");
			check=0;
		} 
	}); 

});

/* - JSTL에선 Javascript값을 받을 수 없다
- Javascript에선 JSTL값을 받을 수 있다 */
</script>

</body>
</html>