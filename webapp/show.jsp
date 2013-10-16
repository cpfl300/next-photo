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
<a href="/">홈으로 가기</a><br>
<h3>현재 저장된 내용</h3>

ID: ${certainBoard.id}<br>
제목: ${certainBoard.title}<br>
	<c:if test="${not empty certainBoard.fileName}">
				<img src="/images/${certainBoard.fileName}" width=200 height=300> <br>
				사진 이름: ${certainBoard.fileName} <br> 
	</c:if>

comment: ${certainBoard.comment}<br>
<br>
<h3>사진 수정하기</h3>
<div>
	<form action="/board/modify/${certainBoard.id}" method="post" enctype=multipart/form-data>
		<label for="title"> photo title: </label>
		<textarea rows="1" cols="30" name="title">${certainBoard.title}</textarea><br>
		<textarea rows="10" cols="45" name="comment">${certainBoard.comment}</textarea><br>
		<input type="file" value="파일 선택" name="file"><br>
		<input type="submit" value="사진수정하기">
	</form>
	</div>
<div>
	<form action="/board/delete/${certainBoard.id}" method="post">
	<input type="submit" value="사진삭제">
	</form>
</div>	

</body>
</html>