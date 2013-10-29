<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	h1 {
	text-align: center;
}

#loginForm{
	margin-top: 20px;
	text-align: center;
}

input[type=text], input[type=password]{
	width: 300px;
	text-align: center;
	margin-bottom: 10px;
}

input[type=submit]{
	margin-top: 5px;
	font-size: 10px;
	width: 90px;
}

#login_warp{
	position: relative;
	width: 424px;
	margin-right: auto;
	margin-left: auto;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 3px;
	padding-right: 3px;
	top: 50px;
	padding-left: 3px;
	border: 1.5px solid #FFFF5A;
}

a{
	text-decoration: blink;
}
		
</style>

</head>
<body>
<div id = login_warp>
<a href="/">HOME</a>
	<h1>LOGIN</h1>

	<div id = "loginForm">
		<form action="/login" method="post">
			<input type="text" name="userId" placeholder="ID를 입력하세"><br> 
			<input type="password" name="password" placeholder="password를 입력하세요"><br> 
			<input type="submit" value="가입하기">
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