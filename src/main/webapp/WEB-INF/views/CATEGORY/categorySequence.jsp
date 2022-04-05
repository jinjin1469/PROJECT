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

<form:form id="CategoryEdit" commandName="Category" action="/category/categorySequence" method="POST">
		구분 : <select name="classification" class="choice">
				<option class="delete">선택하세요</option>
				<option value="테마별">테마별</option>
				<option value="사이드디쉬">사이드디쉬</option>
				<option value="브랜드관">브랜드관</option>
			  </select>
		<div id="edit">
		 </div>
		 <input type="button" id="checkBtn" value="변경" style="display:none;">
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
			choiceNum = sel;
			$('.op').remove();
			<c:if test="${!empty menu1}">
				let edit = document.getElementById("edit");
		       	let p = document.createElement('p');
			 	
		       	<c:forEach var="menu1" items="${menu1}" varStatus="n">
		       		
				 	let span${n.index} = document.createElement('span');
				 	span${n.index}.setAttribute("class","op");
				 	if(${n.index}==0){
				 		span${n.index}.innerHTML=" ${menu1.category_title}  ";
				 	}else{
				 		span${n.index}.innerHTML="<br> ${menu1.category_title}  ";
				 	}
				 	let CategoryName${n.index} = document.createElement('input');
				 	CategoryName${n.index}.setAttribute("type","hidden");
				 	CategoryName${n.index}.setAttribute("value","${menu1.category_title}");
				 	CategoryName${n.index}.setAttribute("name","category_title["+${n.index}+"]");
				 	CategoryName${n.index}.setAttribute("class","op");
				 	
				 	let CategorySequence${n.index} = document.createElement('input');
				 	CategorySequence${n.index}.setAttribute("type","text");
				 	CategorySequence${n.index}.setAttribute("value","${menu1.category_sort}");
				 	CategorySequence${n.index}.setAttribute("name","category_sort["+${n.index}+"]");
				 	CategorySequence${n.index}.setAttribute("class","op indexcheck");
				 	p.appendChild(span${n.index});
				 	p.appendChild(CategoryName${n.index});
				 	p.appendChild(CategorySequence${n.index});
				 </c:forEach>

			 	edit.appendChild(p);
			</c:if>
		}else if(sel == "사이드디쉬"){
			document.getElementById("checkBtn").style.display='block';
			$('.delete').remove();
			choiceNum = sel;
			$('.op').remove();
			<c:if test="${!empty menu2}">
			let edit = document.getElementById("edit");
	       	let p = document.createElement('p');
		 	

		       	<c:forEach var="menu2" items="${menu2}" varStatus="n">
		       		
				 	let span${n.index} = document.createElement('span');
				 	span${n.index}.setAttribute("class","op");
				 	if(${n.index}==0){
				 		span${n.index}.innerHTML=" ${menu2.category_title}  ";
				 	}else{
				 		span${n.index}.innerHTML="<br> ${menu2.category_title}  ";
				 	}
				 	let CategoryName${n.index} = document.createElement('input');
				 	CategoryName${n.index}.setAttribute("type","hidden");
				 	CategoryName${n.index}.setAttribute("value","${menu2.category_title}");
				 	CategoryName${n.index}.setAttribute("name","category_title["+${n.index}+"]");
				 	CategoryName${n.index}.setAttribute("class","op");
				 	
				 	let CategorySequence${n.index} = document.createElement('input');
				 	CategorySequence${n.index}.setAttribute("type","text");
				 	CategorySequence${n.index}.setAttribute("value","${menu2.category_sort}");
				 	CategorySequence${n.index}.setAttribute("name","category_sort["+${n.index}+"]");
				 	CategorySequence${n.index}.setAttribute("class","op indexcheck");
				 	p.appendChild(span${n.index});
				 	p.appendChild(CategoryName${n.index});
				 	p.appendChild(CategorySequence${n.index});
				 </c:forEach>
		 	edit.appendChild(p);
			</c:if>
		}else if(sel == "브랜드관"){
			document.getElementById("checkBtn").style.display='block';
			$('.delete').remove();
			choiceNum = sel;
			$('.op').remove();
			<c:if test="${!empty menu3}">
			let edit = document.getElementById("edit");
	       	let p = document.createElement('p');
		 	

		       	<c:forEach var="menu3" items="${menu3}" varStatus="n">
		       		
				 	let span${n.index} = document.createElement('span');
				 	span${n.index}.setAttribute("class","op");
				 	if(${n.index}==0){
				 		span${n.index}.innerHTML=" ${menu3.category_title}  ";
				 	}else{
				 		span${n.index}.innerHTML="<br> ${menu3.category_title}  ";
				 	}
				 	let CategoryName${n.index} = document.createElement('input');
				 	CategoryName${n.index}.setAttribute("type","hidden");
				 	CategoryName${n.index}.setAttribute("value","${menu3.category_title}");
				 	CategoryName${n.index}.setAttribute("name","category_title["+${n.index}+"]");
				 	CategoryName${n.index}.setAttribute("class","op");
				 	
				 	let CategorySequence${n.index} = document.createElement('input');
				 	CategorySequence${n.index}.setAttribute("type","text");
				 	CategorySequence${n.index}.setAttribute("value","${menu3.category_sort}");
				 	CategorySequence${n.index}.setAttribute("name","category_sort["+${n.index}+"]");
				 	CategorySequence${n.index}.setAttribute("class","op indexcheck");
				 	p.appendChild(span${n.index});
				 	p.appendChild(CategoryName${n.index});
				 	p.appendChild(CategorySequence${n.index});
				 </c:forEach>
		 	edit.appendChild(p);
			</c:if>
		}
	});
	
	$("#checkBtn").on("click",function(){
		let seqList = [];
		
		$(".indexcheck").each(function (idx,item){	
			seqList.push(item.value);
		});
		for (let i = 0; i < seqList.length - 1;i++) {
			for (let j = i+1; j < seqList.length; j++) {
				if(seqList[i]==seqList[j]){
					check = 1;
				}
			}
		}
		
		heapSort(seqList);
		if(choiceNum==1){
			for(let i=0;i<${menu1Count};i++){
				if(seqList[i]!=i+1){
					check = 1;
				}
			}
		}else if(choiceNum==2){
			for(let i=0;i<${menu2Count};i++){
				if(seqList[i]!=i+1){
					check = 1;
				}
			}
		}else if(choiceNum==3){
			for(let i=0;i<${menu3Count};i++){
				if(seqList[i]!=i+1){
					check = 1;
				}
			}
		}
		
		if(check==0){
			$("#CategoryEdit").submit();
		}else{
			alert("카테고리의 개수만큼 반복없이 순차적으로 들어가야합니다.");
			check=0;
		}
	});

});


let arrLen;

function swap(input, i, j) {
  let temp = input[i];
  input[i] = input[j];
  input[j] = temp;
}
function heapRoot(input, i) {
  let left = 2 * i + 1;
  let right = 2 * i + 2;
  let max = i;
  if (left < arrLen && input[left] > input[max]) {
    max = left;
  }
  if (right < arrLen && input[right] > input[max]) {
    max = right;
  }
  if (max != i) {
    swap(input, i, max);
    heapRoot(input, max);
  }
}
function heapSort(input) {
  arrLen = input.length;
  for (let i = Math.floor(arrLen / 2); i >= 0; i--) {
    heapRoot(input, i);
  }
  for (let i = input.length - 1; i > 0; i--) {
    swap(input, 0, i);
    arrLen--;
    heapRoot(input, 0);
  }
}

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>