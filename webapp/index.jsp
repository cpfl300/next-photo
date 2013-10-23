<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/board/upload">사진 업로드하기</a>
	<br>
	<a href="/board/list">사진 보기</a>
	<br>



	<c:choose>
		<c:when test="${not empty sessionScope.userId}">
			<a href="/login/logout">로그아웃 하기</a>
			<br>
		</c:when>

		<c:otherwise>
			<a href="/login/form">로그인 하기</a>
			<br>
		</c:otherwise>
	</c:choose>

	<a href="/join/form">회원 가입하기</a>
	<br>
</body>
</html>