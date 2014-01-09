<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/login.css"> 

</head>
<body>
<div id = login_warp>
<a href="/">HOME</a>
	<h1>LOGIN</h1>

	<div id = "loginForm">
		<form action="/login" method="post">
			<input type="text" name="userId" placeholder="ID를 입력하세요"><br> 
			<input type="text" name="userEmail" placeholder="이곳에 E-mail 입력하세요"><br> 
			<input type="password" name="password" placeholder="password를 입력하세요"><br> 
			<input type="submit" value="LOGIN">
		</form>
	</div>
	
</div>


<!-- 

<h2>로그인 페이지 입니다~</h2>

<form action="/login" method="post">
ID 입력: <input type="text" name="userId">
password: <input type="password" name="password">
<input type="submit" value="로그인하기">

</form>
 -->
</body>
</html>