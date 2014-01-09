<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/main.css">

</head>
<body>
	<div id="main_wrap">
		<div id="main_gate">
			<h1>NEXT</h1>
			<h1>PHOTO</h1>
		</div>

		<div id="main_button">
			<ul>
				<li><a href="/board/list">LIST</a></li>
				<c:choose>
					<c:when test="${not empty sessionScope.userEmail}">
						<li><a href="/board/upload">UPLOAD</a></li>
						<li><a href="/login/logout">LOGOUT</a></li>

					</c:when>

					<c:otherwise>
						<li><a href="/login/form">LOGIN</a></li>
						<li><a href="/join/form">JOINUS</a></li>

					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</body>
</html>