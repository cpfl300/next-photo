<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>사진 업로드하기</h3>
	
	<form action="/board" method="post">
		<label for="title"> photo title: </label>
		<textarea rows="1" cols="30" name="title"></textarea><br>
		<textarea rows="10" cols="45" name="comment">photo comment</textarea><br>
		<input type="submit" value="사진올리기">
	</form>
	
</body>
</html>