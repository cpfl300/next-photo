<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/join.css" >
</head>
<body>

<div id = join_warp>
<a href="/">HOME</a>
	<h1>DO YOU WANNA <br>JOIN US?</h1>

	<div id = "joinForm">
		<form action="/join" method="post">
			<input type="text" name="userId" placeholder="이곳에 ID를 입력하세요"><br> 
			<input type="text" name="userEmail" placeholder="이곳에 E-mail 입력하세요"><br> 
			<input type="password" name="password" placeholder="이곳에 password를 입력하세요"><br> 
			<input type="submit" value="가입하기">
		</form>
	</div>
</div>

</body>
</html>