<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
	<link rel="stylesheet" href="../../../resources/static/css/bootstrap.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<title>Insert title here</title>
 <style>
    
    *{font-family: 'Noto Sans KR', sans-serif;}
    
    body {
      min-height: 100vh;

    }

     .input-form {
      max-width: 600px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }

    
    .cen { text-align: center; }
  </style>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
       <form name="register" action="register" commandName="formData" class="validation-form" method="post" novalidate>
     	 <div class="input-form col-md-12 mx-auto">
      	  <h4 class="cen">회원 정보 입력</h4>
          <div class="row">
           
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="member_name" name="member_name" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
           
            <div class="col-md-6 mb-3">
              <label for="nickname">닉네임</label>
              <input type="text" class="form-control" id="member_nickname" name="member_nickname" required>
              <div class="invalid-feedback">
               닉네임을 입력해주세요.
              </div>
            </div>
       
       <div class="col-md-6 mb-3">
            <label for="id">아이디</label>
            <input type="text" class="form-control" id="member_id" name="member_id" required>
            <div class="invalid-feedback">
 	 아이디를 입력해주세요.
            </div>
          </div>
        
       
          <div class="col-md-6 mb-3">
              <label for="password">비밀번호</label>
              <input type="password" class="form-control" id="member_pwd" name="member_pwd" required>
              <div class="invalid-feedback">
               비밀번호를 입력해주세요.
              </div>
            </div>
       
          <div class="col-md-6 mb-3">
              <label for="repassword">비밀번호 확인</label>
              <input type="password" class="form-control" id="rePassword" name="rePassword" required>
              <div class="invalid-feedback">
                확인 비밀번호를 입력해주세요.
              </div>
            </div>

          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="member_email" name="member_email" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>
          
           <div class="mb-3">
            <label for="text">휴대폰번호</label>
            <input type="text" class="form-control" id="member_phone" name="member_phone" placeholder="-를 제외한 숫자만 입력해주세요" required>
            <div class="invalid-feedback">
              휴대폰번호를 입력해주세요.
            </div>
          </div>

          <div class="form-group">
          <p style="margin: 2px;"><label for="text">주소</label></p>
            <input class="form-control" style="width: 30%; display: inline;" type="text" name="member_zipcode" id="sample6_postcode" placeholder="우편번호" >
			 <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		  </div>
		  <div class="form-group">
			<input class="form-control" type="text" id="sample6_address" name="member_adress" style="width: 60%; display: inline; margin-top: 5px;" placeholder="도로명 주소">
			<div class="invalid-feedback">
		 주소를 입력해주세요.
            </div><br>
		  </div>
		  <div class="form-group">
			<input class="form-control" name="" style="width: 40%; display: inline; margin-top: 5px;" type="text" id="sample6_detailAddress" placeholder="상세주소">
	      </div>
	     
			 
            <br>
            <br>
       
    
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          </div>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
       	 	</form>
       	 </div>
      </div>
      
 

   
 
 
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
</script>
    
    
</body>
</html>