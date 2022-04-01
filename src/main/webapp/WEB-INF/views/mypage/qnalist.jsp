<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 1:1 질문🙌</title>
<style>

.th-2{border-bottom: 0.7px solid #DCDCDC;}
table {
	align-items: center;
	margin: 0 auto;
	text-align: center;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	width: 900px;
	font-size: 13px;
	text-align: left;
}

th, td {
	border-bottom: 1px solid #444444;
	text-align: center;
}

.th-1{width: 400px; height:40px;border-bottom: 1px solid #E6E6E6;}

.td-1{height:40px;
border-bottom: 1px solid #E6E6E6;}

th {
	background-color: #F5F5F5;
}

</style>

</head>
<body>
<%@include file="../header.jsp"%>
<br>
<br>

  <h3>고객 1:1 질문</h3>
		 		 
		 		  <br>
	
		 		  <table class="qna">
			 		  	<tr class="qna">
			 		  		<th class="th-2">답변 등록 상태</th>
			 		  		<th class="th-2">상품이름</th>
			 		  		<th class="th-1">제목</th>
			 		  		<th class="th-2">작성자</th>
			 		  		<th class="th-2">작성일</th>
			 		 	</tr>
			 		 	<c:forEach var="qna" items="${qna}" varStatus="status">
			 		 	<tr>
			 		 		<td class="td-1">${qna.qna_state}</td>
			 		 		<td class="td-1">${qna.product_name}</td>
			 		 		<td class="td-1">
			 		 			<input type="hidden" value="${qna.qna_number}">
			 		 			<%-- <a href="javascript:void(0);" id="showPwd(${status.count})" onclick="showPwd(${status.count});">🔒${qna.qna_title}</a> --%>
			 		 			<a href="<c:url value='/product/qna/${qna.qna_number}' />" >${qna.qna_title}</a>
			 		 		 </td>
			 		 		<td class="td-1">${qna.member_nickname}</td>
			 		 		<td class="td-1">${qna.qna_regdate}</td>
			 		 	</tr>
			 					
			 		 	</c:forEach>
		 		  </table>





<br>
<br>
<%@include file="../footer.jsp"%>
</body>
</html>