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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.88.1">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<title>Insert title here</title>

</head>

<body>

	<h2 class="cen">회원 정보 입력</h2>

	<form name="register" action="register" commandName="formData"
		class="validation-form" method="post" novalidate>

		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" class="form-control" id="member_name"
					name="member_name" required></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" class="form-control"
					id="member_nickname" name="member_nickname" required></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" class="form-control" id="member_id"
					name="member_id" required></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" class="form-control" id="member_pwd"
					name="member_pwd" required></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" class="form-control" id="rePassword"
					name="rePassword" required></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="str_email01" id="str_email01" style="width:100px"> @
				<input type="text" name="str_email02" id="str_email02"
					style="width: 100px;" disabled value="naver.com"> <select
					style="width: 100px; margin-right: 10px" name="selectEmail"
					id="selectEmail">
						<option value="1">직접입력</option>
						<option value="naver.com" selected>naver.com</option>
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
				</td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td><input type="text" class="form-control" id="member_phone"
					name="member_phone" placeholder="-를 제외한 숫자만 입력해주세요" required></td>
			</tr>
			<tr>
				<th>주소</th>

				<td><input class="form-control"
					style="width: 30%; display: inline;" type="text"
					name="member_zipcode" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()"
					value="우편번호 찾기">
					<br>
					 <input class="form-control"
					type="text" id="sample6_address" name="member_adress"
					style="width: 60%; display: inline; margin-top: 5px;"
					placeholder="도로명 주소"> 
					<br>
					 <input class="form-control"
					name="member_detailadress"
					style="width: 40%; display: inline; margin-top: 5px;" type="text"
					id="sample6_detailAddress" placeholder="상세주소"></td>
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
 
 	//작성안 된 부분있는지 파악
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
    
    
	// 우편번호 서비스
    function sample6_execDaumPostcode() {
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
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	
	//이메일 입력방식 선택 
	$('#selectEmail').change(function(){ 
		$("#selectEmail option:selected").each(function () { 
			if($(this).val()== '1'){ 
		//직접입력일 경우
			$("#str_email02").val(''); 
		//값 초기화
			$("#str_email02").attr("disabled",false); 
		//활성화 
			}else{ 
		//직접입력이 아닐경우
			$("#str_email02").val($(this).text()); 
		//선택값 입력 
			$("#str_email02").attr("disabled",true); 
		//비활성화 
				} 
			});
		});

	
</script>


</body>
</html>