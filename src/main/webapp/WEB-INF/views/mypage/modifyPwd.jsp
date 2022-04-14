<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/join.css">
<title>비밀번호 변경</title>
</head>
<style>

input[type="text"], input[type="password"] {
	width: 50%;
	height: 30px;
	border: 0px;
	border-bottom: 1.5px solid gray;
	text-align: left;
}


</style>
<body>
<%@include file="../header.jsp"%>
<br>

	<h2 class="cen">비밀번호 변경🔏</h2>
<br>
	<form id="modifyPwdform" action="modifying" commandName="modifyPwd" class="validation-form" method="post">
		
		<table>
			
			<tr>
				<th>현재 비밀번호</th>
				<td><input type="password" class="form-control" id="pwd" name="pwd" required>
					<input type="hidden" value="${member.member_pwd}">
				</td>
			</tr>
			
			<tr>
				<th>새 비밀번호</th>
				<td><input type="password" class="form-control" id="member_pwd" placeholder="영문 /숫자 포함  8~20자 " name="member_pwd" required>
					<div class="member_pwd regex" style="text-align:left;"></div>
					<input type="hidden" id="pwdDoubleChk">
					</td>
				
			</tr>
			<tr>
				<th>새 비밀번호 확인</th>
				<td><input type="password" class="form-control" id="rePassword"
					name="rePassword" style="text-align:left;" required>
					<div class="rePassword regex" style="text-align:left;"></div>
					<input type="hidden" id="rePwdDoubleChk">
					</td>
			</tr>

		</table>
		<br>
		<input type="button" class="btn1 btn-primary btn-lg btn-block" id="edit" name="edit" value="수정하기">
		<input type="reset" class="btn2 btn-primary btn-lg btn-block" value="취소하기">
	</form>
	<br>
	<br>



<%@include file="../footer.jsp"%>
<script>
	
	

	//비밀번호 유효성검사
	$("#member_pwd").on("input",function(){
		var regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
	    var result = regex.exec($("#member_pwd").val());
	    
	    if(result != null){
	        $(".member_pwd.regex").html("");
	    }else{
	        $(".member_pwd.regex").html("비밀번호는 영문 대소문자,숫자 8자 이상 20자 이하로 설정해주세요.");
	        $(".member_pwd.regex").css("color","	red")
	    }
	    
	    checkPwd();
	});
	
	    
	 function checkPwd(){
		 let member_pwd = document.getElementById("member_pwd").value
		   let rePassword = document.getElementById("rePassword").value 		   

	        if(rePassword.length > 2 && member_pwd == rePassword){
	        	$(".rePassword.regex").html("비밀번호가 일치합니다"); 
	        	  $(".rePassword.regex").css("color","green"); 
	        	  $("#rePwdDoubleChk").val("false"); 
	          
	        }else{
	         $(".rePassword.regex").html("비밀번호가 일치하지않습니다"); 
	         $(".rePassword.regex").css("color","red"); 
	         $("#rePwdDoubleChk").val("false"); 
	        }
		 
	 }   
	    
	   
	    
	//비밀번호 확인    
	   $("#rePassword").on("input",function(){
		   
		   let member_pwd = document.getElementById("member_pwd").value
		   let rePassword = document.getElementById("rePassword").value 		   

	        if(rePassword.length > 2 && member_pwd == rePassword){
	        	$(".rePassword.regex").html("비밀번호가 일치합니다"); 
	        	  $(".rePassword.regex").css("color","green"); 
	        	  $("#rePwdDoubleChk").val("false"); 
	          
	        }else{
	         $(".rePassword.regex").html("비밀번호가 일치하지않습니다"); 
	         $(".rePassword.regex").css("color","red"); 
	         $("#rePwdDoubleChk").val("false"); 
	        }
	   });
	
	/* 
	 //비밀번호 확인    
	   $("#member_pwd").on("input",function(){
		   
		   let member_pwd = document.getElementById("member_pwd").value
		   let rePassword = document.getElementById("rePassword").value 		   

	        if(rePassword.length > 2 && member_pwd == rePassword){
	        	$(".rePassword.regex").html("비밀번호가 일치합니다"); 
	        	  $(".rePassword.regex").css("color","green"); 
	        	  $("#rePwdDoubleChk").val("false"); 
	          
	        }else{
	         $(".rePassword.regex").html("비밀번호가 일치하지않습니다"); 
	         $(".rePassword.regex").css("color","red"); 
	         $("#rePwdDoubleChk").val("false"); 
	        }
	   });
	 */
	

	
	
 	//폼 제출전 유효성 검사
	  $("#edit").on("click",function(){
		  
	
   	   var pw = $("#member_pwd").val();
   	  
   	   var pwregex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
   	   var rePwdDoubleChk = document.getElementById("rePwdDoubleChk").value;

   	   
   	   var pwregex = pwregex.exec(pw);
   	   
   	   
   	   if(pwregex == null){
   		   alert("비밀번호양식을 다시 확인해주세요");
   		   retrun;
   	   }
   	   
   	   if(rePwdDoubleChk == 'falase') {
   		   alert("비밀번호가 일치하지않습니다.");
   		   return;
   	   }
   	
        //빈칸 없을 때 제출.
   	   $("#modifyPwdform").submit();
       	   

   })
    
  


</script>
</body>
</html>