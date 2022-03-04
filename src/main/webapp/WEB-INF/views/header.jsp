<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td align="right">
		<c:choose>
			<c:when test="${empty authInfo}">
			<a href="<c:url value='/member/login' />">[로그인]</a>
			<a href="<c:url value='/member/joinChoice' />">[회원가입]</a>
			</c:when>

			<c:otherwise>
			${authInfo.member_id}님 접속
			<a href="<c:url value='/logout' />"> [로그아웃] </a>
			<a href="<c:url value='/member/edit/${authInfo.member_id}' />">회원정보수정</a>
			</c:otherwise>
			
		
		</c:choose>
		</td>
	</tr>

</table>

</body>
</html>