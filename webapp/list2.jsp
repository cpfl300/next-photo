<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css"
	href="/stylesheets/show.css">
<style>
#list_wrap {
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
}
</style>
</head>
<body>
	<div id="list_wrap">
		<a href="/">HOME</a>
		<h1>PHOTO LIST</h1>

		<c:forEach var="data" items="${iterator}">

			<div id="show_wrap">
				<div id="photo_area">
					<div id="title">${data.title}</div>
					<c:if test="${not empty data.fileName}">
						<div id="image_area">
							<img src="/images/${data.fileName}">
						</div>
					</c:if>
					<div id="comment">${data.comment}</div>
				</div>

				<hr>
				<!-- 여기서부터 댓글 -->
				<div id="commnets">
					<form action="/board/${data.id}/attachComment" method="post">

						<c:forEach items="${data.attachComment}" var="comment">
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
					<br>
				</div>
			</div>
	</div>
	</c:forEach>






</body>
</html>