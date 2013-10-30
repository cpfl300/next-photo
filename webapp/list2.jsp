<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/newWrite.css">
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/show.css">
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

/* upload수정 */
h2 {
	font-size: 16px;
	margin-top: 28px;
	margin-bottom: 13px;
	color: #f08080;
}

#formArea textarea {
	height: 70px;
}

#formArea input[type=submit],input[type=reset] {
	background-color: #FF6666;
}

div.commentCounter {
	text-align: right;
	margin-right: 10px;
	font-size: 8.5px;
	margin-bottom: 10px;
}

#commentsArea {
	display: none;
}
</style>

<script>
	function initPage(){
		console.log('로딩이 됐슈');
		countComments();
//		alert('로딩이 됐슈');

		registerEvents();
	}
	
	function countComments(){
		var comments = document.querySelectorAll('#commnets');
		for(var i = 0 ; i < comments.length; i++) {
			var currentNode = comments[i];
			var nPListCount = currentNode.querySelectorAll('span').length;
			console.log(nPListCount);
			
			var comCounter = document.getElementsByClassName("commentCounter");
			comCounter[i].firstChild.nodeValue = nPListCount + "개의 댓글이 있습니다";
		}
		
	}
	
	function registerEvents () {
		var counter = document.getElementsByClassName("commentCounter");
		var comments = document.querySelectorAll('#commnets');
		for(var i = 0 ; i < comments.length; i++) {
			counter[i].addEventListener('click',toggleComments, false);
		}
	}
	
	function toggleComments(e){
	//	debugger;
		var finded = e.currentTarget;
		var target = finded.nextElementSibling.firstElementChild;
		console.log(target);
		var style = window.getComputedStyle(target);
		var display = style.getPropertyValue('display');
		
		
		if(display != "inline"){
			
			target.style.display = "inline";
		}
		
		else{
			target.style.display = "none";
		}
		
	}
	 
	window.onload = initPage; //함수를 기억만 하고 있음.. initPage();라고 하면 바로 실행 될 수 있음

</script>

</head>
<body>
	<div id="list_wrap">
		<a href="/">HOME</a>
		<h1>PHOTO LIST</h1>

		<h2>QUICK UPLOAD</h2>

		<div id="formArea">
			<form action="/board" method="post" enctype=multipart/form-data>
				<label for="title"> photo title: </label> 
				<input type="text" placeholder="photo title" name="title"><br>
				<textarea rows="10" cols="45" name="comment" placeholder="photo comment"></textarea><br> 
				<input type="file" value="파일 선택" name="file"><br>
				<input type="reset" value="내용지우기"> <input type="submit"
					value="사진올리기">
			</form>
		</div>

		<!-- 	LIST화면 -->

		<c:forEach var="data" items="${iterator}">

			<div id="show_wrap">
					<div id="photo_area">
				<a href="/board/${data.id}">
						<div id="title">${data.title}</div>
				</a>
						<c:if test="${not empty data.fileName}">
							<div id="image_area">
				<a href="/board/${data.id}">
				<div id ="image">
								<img src="/images/${data.fileName}">
				</a>
				</div>
							</div>
						</c:if>
						<div id="comment">${data.comment}</div>
					</div>
					
				<hr>
				<!-- 여기서부터 댓글 -->
				<div class = "commentCounter">test</div>
				<div id="commnets">
				<div id="commentsArea">
				<c:forEach items="${data.attachComment}" var="comment">
					<c:if test="${not empty comment.id}">
						<span>${comment.content}</span>
						<br>
					</c:if>
					
				</c:forEach>
				<hr>
				</div>
					<form action="/board/${certainBoard.id}/attachComment" method="post">
				
				<input type="text" placeholder="댓글은 이곳에 적어주세요......" name="attachComment">
				<input type="submit" value="댓글 달기">
			</form>
					<br>
				</div>
				
				
			</div>
		</c:forEach>

	</div>





</body>
</html>