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
<style>
.nav-tabs .nav-link{width:250px;}
.nav{width:500px;}
.delete4{font-weight: bold;
    margin-bottom: 6px;}
.listinfo{font-weight:bold;}

input[type="checkbox"]{
        width: 20px;
        height: 15px;
        border:2px solid #707070;
      }
      
.change input{
  accent-color: #666666;
}

.selectname{
text-align:left;
width:400px;}

.line{border:2px solid #666666;}
.btn{
    background:transparent;
    border: 2px solid transparent;
    box-sizing: border-box;
    cursor: pointer;
    font-size: 1rem;
    font-weight: 700;
    line-height: 1;
    margin-top:10px;
    margin-left:150px;
    padding: 15px 25px;
    text-align: center;
    text-decoration: none;
    display:inline-block;
    outline:none;
    position:relative;
    top:0;
    text-shadow:0 1px 1px rgba(0, 0, 0, 0.5);
    -webkit-transition: all 0.2s ease-in-out 0s;
    -moz-transition: all 0.2s ease-in-out 0s;
    -ms-transition: all 0.2s ease-in-out 0s;
     transition: all 0.2s ease-in-out 0s;
}

.light-green{
    background:#87bc58;
    color:#fff;
    box-shadow: 0 3px 0 #6ea140;    
}
.light-green:hover{
    background:#c0da82;    
}
.light-green:active, .light-green:focus{
    background:#7fb84d;    
}
.choice{width:200px;}
.op{width:200px;}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<br>
<br>
<h3>상품 카테고리 변경📌</h3>
<form:form commandName="Category">
		구분 &nbsp; &nbsp; &nbsp; <select name="classification" class="choice">
				<option class="delete">선택하세요</option>
				<option value="category_1">테마별&&사이드디쉬</option>
				<option value="category_2">브랜드관</option>
			  </select><br>
		<div id="select">
		 </div><br>
</form:form>
<div id="edit" class="selectname">
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
		    
		    p.setAttribute("class","name");
		 	
			span.setAttribute("class","name");
		 	span.innerHTML="카테고리명  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;";
		 	
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
		    
		    p.setAttribute("class","name");
		    
			let span = document.createElement('span');
		 	span.setAttribute("class","name");
		 	span.innerHTML="카테고리명  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;";
		 	
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
		let classification = $(".choice option:selected").val();
		let category_title = $(this).val();
		let obj = {'category_title':category_title,'classification':classification};
		$('.delete2').remove();
		$('.delete4').remove();
		   $.ajax({ 
			 type:'POST',
			 async:true,
			 /* url:'/category/categoryCheck?category_title='+ category_title, */
			 url:'/category/categoryCheck',
			 data: JSON.stringify(obj),
			 contentType : "application/json; charset=UTF-8",
			 dataType:"JSON",
			 success : function(data) { 
				if(data.productList[0]==undefined){
					alert("해당 카테고리의 상품은 없습니다.");
				}else{
					
					let edit = document.getElementById("edit");
					
					
					let form = document.createElement('form');
					form.setAttribute("charset","UTF-8");
					form.setAttribute("method","POST");
					form.setAttribute("id","PCEdit");
					form.setAttribute("class","delete4");
					form.setAttribute("action","/category/productCategoryEdit");
					form.setAttribute("commandName","ProductCategoryEdit");
					
					let p = document.createElement('p');
					let hr = document.createElement('hr');
					
				 	p.setAttribute("class","name");
				 	p.setAttribute("class","listinfo");
				 	p.setAttribute("class","delete4");
				 	p.innerHTML="카테고리를 변경할 상품들을 선택하세요.";
					hr.setAttribute("class","line");
					
				 	form.appendChild(p);
				 	form.appendChild(hr);
					
					let category_title = document.createElement('input');
					category_title.setAttribute("type","hidden");
					category_title.setAttribute("class","delete4");
					category_title.setAttribute("name","category_title");
					category_title.setAttribute("value",data.category_title);
					
					let category_n = document.createElement('input');
					category_n.setAttribute("type","hidden");
					category_n.setAttribute("class","delete4");
					category_n.setAttribute("name","classification");
					category_n.setAttribute("value",data.classification);
					
					let span = document.createElement('span');
				 	span.setAttribute("class","name");
				 	span.setAttribute("class","delete4");
				 	span.innerHTML="변경할 카테고리명 : ";
					
					let category_title_change = document.createElement('select');
					category_title_change.setAttribute("name","category_title_change");
					category_title_change.setAttribute("class","op2");

					let opt = document.createElement('option');
				 	opt.setAttribute("class","delete3");
				 	opt.innerHTML="선택하세요";
				 	category_title_change.appendChild(opt);
				 	
				 	let optN = document.createElement('option');
					optN.setAttribute("value","");
					optN.innerHTML="NULL";
					category_title_change.appendChild(optN);
					
					let classification = $(".choice option:selected").val();
					if(classification=="category_1"){
						<c:forEach var="menu1" items="${menu1}" varStatus="n">
							let optT${n.index} = document.createElement('option');
							optT${n.index}.setAttribute("value","${menu1.category_title}");
							optT${n.index}.innerHTML="${menu1.category_title}";
							category_title_change.appendChild(optT${n.index});
				 		</c:forEach>
				 		<c:forEach var="menu2" items="${menu2}" varStatus="n">
							let optS${n.index} = document.createElement('option');
							optS${n.index}.setAttribute("value","${menu2.category_title}");
							optS${n.index}.innerHTML="${menu2.category_title}";
							category_title_change.appendChild(optS${n.index});
			 			</c:forEach>
					}else if(classification=="category_2"){
						<c:forEach var="menu3" items="${menu3}" varStatus="n">
							let opt${n.index} = document.createElement('option');
							opt${n.index}.setAttribute("value","${menu3.category_title}");
							opt${n.index}.innerHTML="${menu3.category_title}";
							category_title_change.appendChild(opt${n.index});
				 		</c:forEach>
					}
					
					form.appendChild(category_title);
					form.appendChild(category_n);
				 	form.appendChild(span);
				 	form.appendChild(category_title_change);
				 	
				 	
				 	
					for(let key in data.productList){	
						
						let div = document.createElement('div');
						div.setAttribute("class","box");
						div.setAttribute("class","delete4");
						
						let checkbox = document.createElement('input');
						checkbox.setAttribute("type","checkbox");
						checkbox.setAttribute("class","delete4");
						checkbox.setAttribute("name","category_editList["+key+"].edit_check");
						checkbox.setAttribute("value","1");
						
						let product_number = document.createElement('input');
						product_number.setAttribute("type","hidden");
						product_number.setAttribute("class","delete4");
						product_number.setAttribute("name","category_editList["+key+"].product_number");
						product_number.setAttribute("value",data.productList[key].product_number);
						
						let product_name = document.createElement('span');
						product_name.setAttribute("class","delete4");
						product_name.innerHTML=data.productList[key].product_name;
						
						form.appendChild(div);
						form.appendChild(checkbox);
						form.appendChild(product_number);
						form.appendChild(product_name);
					}
					let submit = document.createElement('input');
					submit.setAttribute("type","button");
					submit.setAttribute("class","delete4");
					submit.setAttribute("class","btn light-green");
					submit.setAttribute("id","uploadBtn");
					submit.setAttribute("value","변경하기");
					submit.setAttribute("style","display:none;");

					form.appendChild(submit);
				 	edit.appendChild(form);
					
				}
			},error:function(){
				console.log("Error!!..");	
			}
		});    
	});
	$(document).on('change','.op2',function(){
		$('.delete3').remove();
		document.getElementById("uploadBtn").style.display='block';
	}); 
	$(document).on('click','#uploadBtn',function(){
		let category_title = $(".op option:selected").val();
		let category_title_change = $(".op2 option:selected").val();
		if(category_title!=category_title_change){
			$("#PCEdit").submit();
		}else{
			alert("동일한 카테고리 선택은 불가합니다.");
		}
		
	});
});

</script>
<%@include file="../footer.jsp" %>
</body>
</html>