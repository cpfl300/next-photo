<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/newWrite.css">

</head>
<body>
<div id = "wrap">
	<header>
	<a href="/">HOME</a>
	<h1>PHOTO UPLOAD</h1>
	</header>
	
	<div id = "formArea">
	<form action="/board" method="post" enctype=multipart/form-data>
		<label for="title"> photo title: </label>
		<input type="text" placeholder="photo title" name="title"><br>
		<textarea rows="10" cols="45" name="comment" placeholder="photo comment"></textarea><br>
		<input type="file" value="파일 선택" name="file"><br>
		<input type="reset" value="내용지우기">
		<input type="submit" value="사진올리기">
	</form>
	</div>
	
</div>
</body>
</html>