<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/mypage.css">
<title>Insert title here</title>
<style>
.menu{
	text-align: left;
	font-size: 12px;
	margin: 0 auto;
	padding: 0px;
	color: #696969;
}
.policies{width:500px; color:red; font-weight:bold;}
input[type="text"], input[type="password"] {
	width: 50%;
	height: 30px;
	border: 0px;
	border-bottom: 1.5px solid gray;
	text-align: left;
}
table {
	align-items: center;
	margin: 0 auto;
	text-align: center;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	width: 600px;
	font-size: 13px;
	text-align: left;
	float:left;
	height:60px;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: left;
}

td {
	width: 50%;
}

th {
	width: 20%;
	background-color: #F5F5F5;
}

.btn {
	width: 600px;
	display: inline-block;
	font-weight: 400;
	line-height: 1.5;
	color: 04BF80;
	text-align: center;
	text-decoration: none;
	vertical-align: middle;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
	background-color: transparent;
	border: 1px solid transparent;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    float:left;
    margin-top:20px;
}

.w-100 {
	width: 100% !important;
}

.btn-lg, .btn-group-lg>.btn {
	padding: 0.5rem 1rem;
	font-size: 1.25rem;
	border-radius: 0.3rem;
}

.btn-primary {
	color: #fff;
	background-color: #04BF80;
	border: none;
}

.btn-primary:hover {
	color: #fff;
	background-color: #73c431;
	border: none;
}

</style>
</head>
<body>
<%@include file="../header.jsp"%>
<br>
<br>
<div id="content"> 

<aside>
<div class="menu">
	<p><strong>쇼핑정보</strong></p>
	<hr>
		<p><a href="<c:url value='/mypage/orderStatus' />" class="menu">주문내역</a></p>
		<p><a href="<c:url value='/product/cart/list.do' />" class="menu">장바구니</a></p>
		<p><a href="<c:url value='/mypage/pointStatus' />" class="menu">포인트현황</a></p>
		<p><a href="<c:url value='/member/login' />" class="menu">오늘본상품</a></p>
	<br>
	<p><strong>쇼핑문의</strong></p>
	<hr>
		<p><a href="<c:url value='/mypage/myqnalist' />" class="menu">1:1게시판</a></p>
		<p><a href="<c:url value='/mypage/myreviewlist' />" class="menu">내 리뷰 모아보기</a></p>
		<p><a href="<c:url value='/notice/main' />" class="menu">F&Q</a></p>
	<br>
	<p><strong>회원정보</strong></p>
	<hr>
		<p><a href="<c:url value='/mypage/modify' />" class="menu">회원정보변경</a></p>
		<p><a href="<c:url value='/mypage/modifyPwd' />" class="menu">비밀번호변경</a></p>
		<p><a href="<c:url value='/mypage/deleteAccount' />" class="menu">회원탈퇴</a></p>
</div>
</aside>

<section>

		<h2>회원탈퇴😢</h2>
		<hr>
			<div class="policies">
			<p>*배송 준비 중이거나 배송 중인 상품이 없을 시에만 탈퇴가 가능합니다.</p>
			<p>*비밀번호 확인이 필요하므로 입력해주십시오</p>
			</div>
		<br>
		<br>
		
	<form id="deleteAccount" name="deleteAccount" action="delete" commandName="confirmPwd" method="post">
		
		<table>
			
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" class="form-control" id="pwd" name="pwd" required>
					<input type="hidden" value="${member.member_pwd}">
				</td>
			</tr>

		</table>
		<br>
		<input type="button" class="btn btn-primary btn-lg btn-block" onclick="confirmDelete();" id="edit" name="edit" value="탈퇴하기">
	
	</form>
		
		
</section>
	
</div>

<br>
<br>
<%@include file="../footer.jsp"%>
<script>
	function confirmDelete(){
		if(!confirm("정말 탈퇴 하시겠습니까?")){
			return false;
		}else{
			$("#deleteAccount").submit();
		}
	}
</script>
</body>
</html>