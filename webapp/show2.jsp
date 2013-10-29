<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/show.css">
<style>
#photoDel, #photoModi{
	display: inline-block; 
	margin-top: 12px;
}

#href>a:nth-of-type(1){
	margin-right: 10px;
}
</style>

</head>
<body>
	<div id="show_wrap">
	<div id = "href">
		<a href="/">HOME</a>
		<a href="/board/list">LIST</a> <br>
	</div>
		<h1>NEW POST!</h1>
		<div id="photo_area">
			<div id="title">${certainBoard.title}</div>
			<c:if test="${not empty certainBoard.fileName}">
				<div id="image_area">
					<img src="/images/${certainBoard.fileName}">
				</div>
			</c:if>
			<div id="comment">${certainBoard.comment}</div>
		</div>

		<hr>
		<!-- 여기서부터 댓글 -->
		<div id="commnets">
			<form action="/board/${certainBoard.id}/attachComment" method="post">

				<c:forEach items="${certainBoard.attachComment}" var="comment">
					<c:if test="${not empty comment.id}">
						<span>${comment.content}</span>
						<br>
					</c:if>
				</c:forEach>
				<hr>
				<input type="text" placeholder="댓글은 이곳에 적어주세요......"
					name="attachComment">
				<!-- <textarea rows="1" cols="30" name="attachComment"></textarea> -->
				<input type="submit" value="댓글 달기">
			</form>
	<div id = "photoDel">
		<form action="/board/delete/${certainBoard.id}" method="post">
			<input type="submit" value="사진삭제">
		</form>
	</div> 
	
	<div id = "photoModi">
		<form action="/board/callModify/${certainBoard.id}">
			<input type="submit" value="사진 수정">
		</form>
	</div> 
	
	







		</div>
	</div>
</body>
</html>