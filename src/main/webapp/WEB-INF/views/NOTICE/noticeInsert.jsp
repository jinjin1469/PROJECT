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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>

.title{
	width: 70%;
	height: 30px;
	border: 1.5px solid gray;
	text-align: left;
	
}

.not{width:30%;height: 30px;
	border: 1.5px solid gray;
	text-align: left;}


 textarea {
    width: 100%;
    height: 20rem;
    border: none;
    resize: none;
    text-align:left;
  }
.notice{
	align-items: center;
	margin-left:50px;
	text-align: center;
	border: 0.5px solid #444444;
	border-collapse: collapse;
	width: 600px;
	font-size: 13px;
	text-align: left;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #444444;
	text-align:center;
}


.content{background-color: #F5F5F5;}
td{text-align:left;}

.sizee{width:800px; margin-left:60px;}
.sizeed{width:400px; margin-left: -20px;}
.mar{margin-left:200px;}
h3{text-align:left; margin-left:70px;}
.btn {
	margin-left:1rem;
	width: 500px;
	display: inline-block;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
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
	font-size: 0.5rem;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}


.w-100 {
	width: 100% !important;
}

.btn-lg, .btn-group-lg>.btn {
	padding: 0.5rem 1rem;
	font-size: 1rem;
	border-radius: 0.3rem;
}

.btn-primary {
	color: #fff;
	background-color: #a4e25e;
	border-color: #d1f779;
	float: right;
    margin-right: -50px;
    margin-top: 10px;
    width: 100px;
   
}
}

.btn-primary:hover {
	color: #fff;
	background-color: #73c431;
	border-color: #1ad123;
}

.subbtn{width: 600px;}
</style>



</head>
<body>
<%@include file="../header.jsp" %>
<div class="container d-flex flex-wrap d-flex align-items-center mar">
	<aside>
	    <p class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none">
	      <svg class="bi me-2" width="30" height="24"></svg>
	      <span class="fs-5 fw-semibold">고객센터</span>
	    </p>
	    <ul class="list-unstyled ps-0">
	      <li class="mb-1">
	        <a class="d-flex align-items-center link-dark text-decoration-none" href="/notice/main">
	        <svg class="bi me-2" width="30" height="5"></svg>
	          공지사항
	        </a>
	        <a class="d-flex align-items-center link-dark text-decoration-none" href="#">
	        <svg class="bi me-2" width="30" height="5"></svg>
	          자주 묻는 질문
	        </a>
	      </li>
	    </ul>
	</aside>
  	
  	<div class="col-md-10 sizee">
  	<br>
  	<br>
    	<h3>🔹공지 작성🔹</h3>
	<br>
	<br>
		<form:form commandName="formData" method="post">
	 	<table class="notice">
			<tr>
			<th>분류</th>
			<td><form:select path="CLASSIFICATION" class="not">
					<form:option value="공지" selected="selected">공지</form:option>
					<form:option value="이벤트">이벤트</form:option>
				</form:select>
			</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><form:input path="NOTICE_TITLE" class="title"/></td>
			</tr>
			<tr>	
				<th colspan="2" class="content">내용</th>
			</tr>
			<tr>
				<td colspan="2"><form:textarea path="NOTICE_CONTENT"/></td>
			</tr>

		</table>
		<div class="subbtn">
		<input type="submit" class="btn3 btn-primary btn-lg btn-block" value="등록">
		</div>
		</form:form>
	</div>  
</div>
<br>
<br>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
<%@include file="../footer.jsp" %>
</body>
</html>