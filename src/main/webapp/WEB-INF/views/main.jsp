b<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀슐랭</title>
</head>
<body>
<c:if test="${!empty Member}">
	${Member[0].member_nickname}
</c:if>
<a href="<c:url value='/member/login' />">[로그인]</a>
<a href="<c:url value='/member/joinChoice' />">[회원가입]</a>
 
 <c:if test="${userId eq null}">로그인을 해주세요</c:if>
<c:if test="${userId ne null}"> <h1>로그인 성공입니다</h1></c:if>
</body>
</html>
























