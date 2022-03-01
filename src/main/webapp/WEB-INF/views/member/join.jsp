<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../../../resources/jquery/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="../../../resources/css/join.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.88.1">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<title>회원가입:밀슐랭과 함께해요</title>

</head>

<body>

	<h2 class="cen">회원 정보 입력</h2>

	<form name="register" action="register" commandName="formData"
		class="validation-form" method="post" novalidate>

		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" class="form-control" id="member_name" name="member_name" style="text-align:left;" required>
				<div class="check_font" id="name_check"></div>
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" class="form-control" id="member_nickname" name="member_nickname" style="text-align:left;" required>
				<br>
				<span class="point successNameChk">닉네임은 2자 이상 8자 이하로 설정해주세요.</span>
				<input type="hidden" id="nicknameDoubleChk"></td>


			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" class="form-control" id="member_id" name="member_id" style="text-align:left;" required>
				<br>
				<span class="point successIdChk">아이디는 영문자로 시작하는 영문자 또는 숫자 6~20자로 설정해주세요.</span>
				<input type="hidden" id="idDoubleChk">
			</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" class="form-control" id="member_pwd"
					name="member_pwd" style="text-align:left;" required></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" class="form-control" id="rePassword"
					name="rePassword" style="text-align:left;" required></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" id="email" style="width:100px; text-align:left;">
				<span id="middle">@</span>
				<input type="text" name="domain" id="domain" style="width: 100px;"> 
				<select style="width: 100px; margin-right: 10px" name="selectEmail" id="selectEmail">
						<option value="1" selected>직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="nate.com">nate.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="empas.com">empas.com</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="freechal.com">freechal.com</option>
						<option value="lycos.co.kr">lycos.co.kr</option>
						<option value="korea.com">korea.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmir.com">hanmir.com</option>
						<option value="paran.com">paran.com</option>
					</select>
				<input type="hidden" id="member_email" name="member_email" value="">
				</td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td><input type="text" class="form-control" id="member_phone"
					name="member_phone" placeholder="-를 제외한 숫자만 입력해주세요" style="text-align:left;" required></td>
			</tr>
			<tr>
				<th>주소</th>

			<td><input class="form-control" style="width: 30%; display: inline;" type="text" name="postcode" id="postcode" placeholder="우편번호">
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
				<br>
				 <input class="form-control" type="text" name="address" id="address" style="width: 60%; display: inline; margin-top: 5px;"
					placeholder="도로명 주소" style="text-align:left;"> 
				<br>
				 <input class="form-control" style="width: 40%; display: inline; margin-top: 5px;" type="text"
				id="detailAddress" name="detailAddress" placeholder="상세주소" style="text-align:left;">
				<input type="hidden" name="member_address" id="member_address" value="">
				</td>
		</tr>
		</table>

		<p>
			<strong>이용약관</strong>
		</p>
		<p>만 14세 이상이며 밀슐랭 온라인사이트 이용약관,</p>
		<p>개인정보 수집 및 이용동의를 확인하였고 동의합니다.</p>
		<p>고객님께서는 개인정보 수집 및 이용동의를 거부하실 수 있으며,</p>
		<p>동의거부 시 회원가입이 제한됩니다.</p>

		<p>온라인사이트 이용약관 ></p>
		<p>개인정보 수집 및 이용동의 ></p>


		<button class="btn btn-primary btn-lg btn-block" type="submit">동의하고
			회원가입</button>
	</form>





	<script>
	
	//이메일 주소 합치기  
	//blur 이벤트는 사용자가 폼에 입력을 마치고 커서가 해당 폼을 벗어났을 때 실행되며, change 이벤트는 폼에 변화가 감지되었을 때 실행된다.
	$("#email").change(function(){
		email();	
	});
	
	$("#domain").change(function(){
		email();	
	});

	function email() {
		const email = $("#email").val();
		const middle = $("#middle").text();
		const domain = $("#domain").val();
		if(email != "" && domain != "") {
			$("#member_email").val(email+middle+domain);
		}
	};
	
	//주소 합치기
	$("#postcode").change(function(){
		addr();	
	});
	
	$("#address").change(function(){
		addr();	
	});
	
	$("#detailAddress").change(function(){
		addr();	
	});

	function addr() {
		const postcode = $("#postcode").val();
		const address = $("#address").val();
		const detailAddress = $("#detailAddress").val();
		if(postcode != "" && address != "") {
			$("#member_address").val(postcode+address+detailAddress);
		}
	};
	
	
	
	
	//모든 공백 체크 정규식
	var emp = /\s/g;
	//아이디 정규식 - a~z 0~9로 시작하는 4~12 자리 아이디를 만들 수 있다.
	var id = /^[a-z0-9]{4,12}$/;
	// 비밀번호 정규식  - 소문자 + 숫자 + 언더바/하이픈 허용 4~20자리
	var pw = /^[a-z0-9_-]{4,20}$/;
	// 이름 정규식
	var name = /^[가-힣]{2,6}$/;
	// 이메일 검사 정규식
	var mail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	
	
	//이름에 특수문자가 들어가지 않도록 확인
	$("#member_name").blur(function() {
		if (name.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#name_check").text('');
		} else {
			$('#name_check').text('이름을 확인해주세요');
			$('#name_check').css('color', 'red');
		}
	});
	
	
	
	
	
 	
	//닉네임 중복 체크
	$("#member_nickname").blur(function(){ 
		var member_nickname = $("#member_nickname").val();
		
		if(member_nickname == "" || member_nickname.length < 2){ 
			$(".successNameChk").text("닉네임은 2자 이상 8자 이하로 설정해주세요");
			$(".successNameChk").css("color", "red"); 
			$("#nicknameDoubleChk").val("false"); 
		
		}else{ 
			 
			$.ajax({ 
					
					 url : '${pageContext.request.contextPath}/nameCheck?member_nickname='+ member_nickname, 
					 type : 'post', 
					 dataType: "json",
					 cache : false, 
					 success : function(data) { 
						 if (data == 0) {
							 $(".successNameChk").text("사용가능한 닉네임입니다."); 
						 	 $(".successNameChk").css("color", "green"); 
						 	 $("#nicknameDoubleChk").val("true"); 
						 } else {
							 $(".successNameChk	").text("사용중인 닉네임입니다.");
							 $(".successNameChk").css("color", "red"); 
							 $("#nicknameDoubleChk").val("false"); 
							 } 
						 }, error : function() {
							 console.log("실패"); 
							 }
						 });
					} });
	
	
	//아이디 중복 체크
	$("#member_id").blur(function(){ 
		var member_id = $("#member_id").val();
		
		if(member_nickname == "" || member_nickname.length < 2){ 
			$(".successIdChk").text("아이디는 영문자로 시작하는 영문자 또는 숫자 6~20자로 설정해주세요.");
			$(".successIdChk").css("color", "red"); 
			$("#idDoubleChk").val("false"); 
		
		}else{ 
			 
			$.ajax({ 
					
					 url : '${pageContext.request.contextPath}/idCheck?member_id='+ member_id, 
					 type : 'post', 
					 dataType: "json",
					 cache : false, 
					 success : function(data) { 
						 if (data == 0) {
							 $(".successIdChk").text("사용가능한 아이디입니다."); 
						 	 $(".successIdChk").css("color", "green"); 
						 	 $("#idDoubleChk").val("true"); 
						 
						 } else {
							 $(".successIdChk").text("사용중인 아이디입니다.");
							 $(".successIdChk").css("color", "red"); 
							 $("#idDoubleChk").val("false"); 
						
							 } 
						 }, error : function() {
							 console.log("실패"); 
							 }
						 });
					} });
	
	
	
 
	
	// 우편번호 서비스
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }

                
                } else {
                    document.getElementById("_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
	
/* 	//이메일 입력방식 선택 
	$('#selectEmail').change(function(){ 
		$("#selectEmail option:selected").each(function () { 
			if($(this).val()== '1'){ 
		//직접입력일 경우
			$("#domain").val(''); 
		//값 초기화
			$("#domain").attr("disabled",false); 
		//활성화 
			}else{ 
		//직접입력이 아닐경우
			$("#domain").val($(this).text()); 
		//선택값 입력 
			$("#domain").attr("disabled",false); 
		//비활성화 
				} 
			});
		});

	 */
	
	 
	 $(document).ready(function(){
	        $("#selectEmail").change(function(){
	            var selectEmail = $(this).val(); 
	            if(selectEmail == "1") { //직접입력일때
	                $("input[name='domain']").val('');  //이메일 도메인입력박스 초기화.
	                $("input[name='domain']").attr('readonly', false); //직접입력 가능하도록 readonly막기
	            }
	           else {
	               $("input[name='domain']").val(selectEmail); //이메일 도메인 입력박스에 선택된 호스트등록.
	               $("input[name='domain']").attr('readonly', true); //readonly로 직접입력 막기.
	           }
	       });
	   });

	
</script>


</body>
</html>