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
	<a href="/">홈으로 가기</a>
	<br>
	<h3>현재 저장된 내용</h3>

	<c:forEach var="data" items="${iterator}">
	
			<br> 제목: ${data.title} <br> 
	<c:if test="${not empty data.fileName}">
				<img src="/images/${data.fileName}" width=200 height=300> <br>
				사진 이름: ${data.fileName} <br> 
	</c:if>
				comment:${data.comment} <br>
				 		
			<div>
				<form action="/board/delete/${data.id}" method="post">
				<input type="submit" value="사진삭제">
				</form>
			</div>
			<form action="/board/${data.id}/attachComment" method="post">	
			
			<c:forEach items="${data.attachComment}" var="comment">
			<hr>
			<c:if test="${not empty comment.id}">
			댓글 ${comment.id}번
			${comment.content}
			</c:if>
			</c:forEach>
			<br>
			<p>댓글을 담겨주세요!</p>
			<textarea rows="1" cols="30" name="attachComment"></textarea>
			<input type="submit" value="댓글 달기">
			</form>
			<hr>
	</c:forEach>






</body>
</html>