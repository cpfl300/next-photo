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

<Script>
	function loading() {
		showsXHRorAttachment();
		var count = document.querySelectorAll('span').length;
		document.getElementById("commentCounter").innerHTML = count
				+ "개의 댓글이 있습니다";
		registerEvents();
	}
	window.onload = loading;

	//토글 이벤트 등록
	function registerEvents() {
		var counter = document.getElementById("commentCounter");
		counter.addEventListener('click', toggleComments, false);
	}

	//토글 이벤트 함수 	
	function toggleComments(e) {
		var target = document.getElementById("commentsArea");

		var display = contactCSS(target, 'display');

		if (display == "none") {

			target.style.display = "inline";
		}

		else {
			target.style.display = "none";
		}

	}

	//CSS가져오는 함수 
	function contactCSS(target, string) {
		var style = window.getComputedStyle(target);
		var attribute = style.getPropertyValue(string);

		return attribute;
	}
	//XHR로 보내는 함수
	function showsXHRorAttachment() {
		var button = document.querySelector('.commnets input[type = submit]');
		button.addEventListener('click', writheComments, false);
	}

	//서버에 전달하는 함수
	function writheComments(e) {
		e.preventDefault();
		var eleForm = e.currentTarget.form;
		var oFormData = new FormData(eleForm);
		var sID = eleForm[0].value;
		var url = "/board/" + sID + "/attachComment.json";

		var request = new XMLHttpRequest();
		request.open("POST", url, true);

		request.send(oFormData);

		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) {
				var obj = JSON.parse(request.responseText);
				var eleCommentList = eleForm.previousElementSibling.previousElementSibling; //한번 하면 <hr>나옴
				eleCommentList.insertAdjacentHTML('beforeend', '<span>'
						+ obj.content + '</span><br>');

				var nPListCount = eleCommentList.querySelectorAll('span').length;
				var comCounter = eleCommentList.parentNode.previousElementSibling;
				comCounter.innerHTML = nPListCount + "개의 댓글이 있습니다";
			}
		}
	}
</Script>
</head>
<body>
	<div class="show_wrap">
		<div id="href">
			<a href="/">HOME</a> <a href="/board/list">LIST</a> <br>
		</div>
		<h1>NEW POST!</h1>
		<div id="photo_area">
			<div id="title">${certainBoard.title}</div>
			<c:if test="${not empty certainBoard.fileName}">
				<div id="image_area">
					<div id="image">
						<img src="/images/${certainBoard.fileName}">
					</div>
				</div>
			</c:if>
			<div id="comment">${certainBoard.comment}</div>
		</div>

		<hr>
		<!-- 여기서부터 댓글 -->
		<div id="commentCounter"></div>
		<div class="commnets">
			<div id="commentsArea">
				<c:forEach items="${certainBoard.attachComment}" var="comment">
					<c:if test="${not empty comment.id}">
						<span>${comment.content}</span>
						<br>
					</c:if>
				</c:forEach>

			</div>
				<hr>

			<form action="/board/${certainBoard.id}/attachComment" method="post">
				<input type="hidden" name="id" value="${certainBoard.id}"> <input
					type="text" placeholder="댓글은 이곳에 적어주세요......" name="attachComment">
				<input type="submit" value="댓글 달기">
			</form>
			<div id="photoDel">
				<form action="/board/delete/${certainBoard.id}" method="post">
					<input type="submit" value="사진삭제">
				</form>
			</div>

			<div id="photoModi">
				<form action="/board/callModify/${certainBoard.id}">
					<input type="submit" value="사진 수정">
				</form>
			</div>


		</div>


	</div>
</body>
</html>