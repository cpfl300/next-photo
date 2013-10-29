<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
a{
text-decoration: blink;}

#main_wrap {
	position: relative;
	background-image: url("/images/gateImage.jpg");
	background-repeat: no-repeat;
	height: 400px;
	width: 410px;
	background-size: 450px;
	background-position-x: center;
	margin-left: auto;
	margin-right: auto;
	top: 20px;
}

#main_gate>h1 {
	font-size: 80px;
	font-weight: 200;
	font-family: Ralewqy, Helvetica Neue, Helvetica, Arial, sans-serif;
	font-weight: 200;
}

#main_gate>h1:nth-of-type(1) {
	position: absolute;
	top: 52px;
}

#main_gate>h1:nth-of-type(2) {
	position: absolute;
	top: 157px;
	right: 12px;
}

#main_button li {
	float: left;
	display: block;
/* 	margin-right: 25px; */
	margin-left: 35px;
}

#main_button {
	position: absolute;
	bottom: 10px;
	left: -45px;
}
</style>

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
					<c:when test="${not empty sessionScope.userId}">
						<li><a href="/board/upload">UPLOAD</a></li>
						<li><a href="/login/logout">LOGOUT</a></li>

					</c:when>

					<c:otherwise>
						<li><a href="/login/form">LOGIN</a></li>

					</c:otherwise>
				</c:choose>
				<li><a href="/join/form">JOINUS</a></li>
			</ul>
		</div>
	</div>
</body>
</html>