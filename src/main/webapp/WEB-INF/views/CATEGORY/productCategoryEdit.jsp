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
<%@include file="../header.jsp" %>
<br>
<br>
<form:form commandName="Category">
		구분 : <select name="classification" class="choice">
				<option class="delete">선택하세요</option>
				<option value="category_1">테마별&&사이드디쉬</option>
				<option value="category_2">브랜드관</option>
			  </select><br>
		<div id="select">
		 </div>
</form:form>
<div id="edit">
</div>
<script>
$(document).ready(function(){
	
	$('.choice').change(function(){
		let sel = $(this).val();
		if(sel == "category_1"){
			$('.delete').remove();
			$('.op').remove();
			$('.name').remove();
			
			let select = document.getElementById("select");
		    let p = document.createElement('p');
		    
			let span = document.createElement('span');
		 	span.setAttribute("class","name");
		 	span.innerHTML="카테고리명 : ";
		 	
		 	let CategoryName = document.createElement('select');
		 	CategoryName.setAttribute("name","category_title");
		 	CategoryName.setAttribute("class","op");
		 	
		 	let opt = document.createElement('option');
		 	opt.setAttribute("class","delete2");
		 	opt.innerHTML="선택하세요";
			CategoryName.appendChild(opt);
		 	
		 	let optN = document.createElement('option');
			optN.setAttribute("value","NULL");
			optN.innerHTML="NULL";
			CategoryName.appendChild(optN);
			<c:forEach var="menu1" items="${menu1}" varStatus="n">
				let optT${n.index} = document.createElement('option');
				optT${n.index}.setAttribute("value","${menu1.category_title}");
				optT${n.index}.innerHTML="${menu1.category_title}";
				CategoryName.appendChild(optT${n.index});
		 	</c:forEach>
		 	<c:forEach var="menu2" items="${menu2}" varStatus="n">
				let optS${n.index} = document.createElement('option');
				optS${n.index}.setAttribute("value","${menu2.category_title}");
				optS${n.index}.innerHTML="${menu2.category_title}";
				CategoryName.appendChild(optS${n.index});
	 		</c:forEach>
		 
		 	p.appendChild(span);
		 	p.appendChild(CategoryName);

		 	select.appendChild(p);
		}else if(sel == "category_2"){
			$('.delete').remove();
			$('.op').remove();
			$('.name').remove();
			
			let select = document.getElementById("select");
		    let p = document.createElement('p');
		    
			let span = document.createElement('span');
		 	span.setAttribute("class","name");
		 	span.innerHTML="카테고리명 : ";
		 	
		 	let CategoryName = document.createElement('select');
		 	CategoryName.setAttribute("name","category_title");
		 	CategoryName.setAttribute("class","op");
		 	
		 	
		 	let opt = document.createElement('option');
		 	opt.setAttribute("class","delete2");
		 	opt.innerHTML="선택하세요";
			CategoryName.appendChild(opt);
		 	let optN = document.createElement('option');
			optN.setAttribute("value","NULL");
			optN.innerHTML="NULL";
			CategoryName.appendChild(optN);
			<c:forEach var="menu3" items="${menu3}" varStatus="n">
				let opt${n.index} = document.createElement('option');
				opt${n.index}.setAttribute("value","${menu3.category_title}");
				opt${n.index}.innerHTML="${menu3.category_title}";
				CategoryName.appendChild(opt${n.index});
		 	</c:forEach>
		 
		 	p.appendChild(span);
		 	p.appendChild(CategoryName);

		 	select.appendChild(p);
		 	
		}
	});
	$(document).on('change','.op',function(){
		/* let classification = document.getElementsByClassName('.choice').value; */
		let classification = $(".choice option:selected").val();
		let category_title = $(this).val();
		let obj = {'category_title':category_title,'classification':classification};
		$('.delete2').remove();
		
		   $.ajax({ 
			 type:'POST',
			 async:true,
			 /* url:'/category/categoryCheck?category_title='+ category_title, */
			 url:'/category/categoryCheck',
			 data: JSON.stringify(obj),
			 contentType : "application/json; charset=UTF-8",
			 dataType:"JSON",
			 success : function(data) { 
				 //alert(data.totalPrice);
				 console.log(data);
				 console.log("success!!");
			},error:function(){
				console.log("Error!!..");	
			}
			
		}); 
	});
});

</script>
<%@include file="../footer.jsp" %>
</body>
</html>