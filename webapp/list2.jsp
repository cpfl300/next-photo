<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css"
	href="/stylesheets/newWrite.css">
<link rel="stylesheet" media="screen" type="text/css"
	href="/stylesheets/show.css">
<link rel="stylesheet" media="screen" type="text/css"
	href="/stylesheets/list.css">

<script>
	function initPage() {
		console.log('로딩이 됐슈');
		
		countComments();
		registerEvents();
		XHRorAttachment();
		XMLForsubmit();
		quickDel();
	}

	//댓글 갯수를 셉니다. 
	function countComments() {
		var comments = document.querySelectorAll('.commnets');
		for ( var i = 0; i < comments.length; i++) {
			var currentNode = comments[i];
			var nPListCount = currentNode.querySelectorAll('span').length;
			//			console.log(nPListCount);

			var comCounter = document.getElementsByClassName("commentCounter");
			comCounter[i].firstChild.nodeValue = nPListCount + "개의 댓글이 있습니다";
		}

	}

	//댓글 갯수를 누르면 펼쳐지게 이벤트를 겁니다. 
	function registerEvents() {
		var counter = document.getElementsByClassName("commentCounter");
		var comments = document.querySelectorAll('.commnets');
		for ( var i = 0; i < comments.length; i++) {
			counter[i].addEventListener('click', toggleComments, false);
		}
	}

	// 글을 펼치는 이벤트 입니다. 
	function toggleComments(e) {
		//	debugger;
		var finded = e.currentTarget;
		var target = finded.nextElementSibling.firstElementChild;

		var display = contactCSS(target, 'display');

		if (display != "inline") {

			target.style.display = "inline";
		}

		else {
			target.style.display = "none";
		}
		//e.returnValue = false;
	}

	// CSS에 접촉하는 함수입니다. 
	function contactCSS(target, string) {
		var style = window.getComputedStyle(target);
		var attribute = style.getPropertyValue(string);

		return attribute;
	}

	function XHRorAttachment() {
		var formList = document
				.querySelectorAll('.commnets input[type = submit]');
		for ( var i = 0; i < formList.length; i++) {
			formList[i].addEventListener('click', writeComments, false);
		}
	};

	//XHR로 댓글 달기
	function writeComments(e) {
		e.preventDefault();

		var eleForm = e.currentTarget.form;
		var oFormData = new FormData(eleForm);

		var sID = eleForm[0].value;
		var url = "/board/" + sID + "/attachComment.json";

		var request = new XMLHttpRequest();
		request.open("POST", url, true); //post방식으로 보낼래, url도 알려주고...

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
		};

	}
	//파일 업로드에 대한 XML	
	function XMLForsubmit() {
		var button = document
				.querySelectorAll('#formArea input[type = submit]');

		button[0].addEventListener('click', showed, false);
	}

	//업로드 data 서버에 올리고 바로 뿌려주기
	function showed(e) {
		debugger;
		e.preventDefault();
		url = '/board/board.json';

		var eleForm = e.currentTarget.form;
		var oFormData = new FormData(eleForm);

		var request = new XMLHttpRequest();
		request.open("POST", url, true);
		request.send(oFormData);

		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) {
				eleForm.reset();
				var obj = JSON.parse(request.responseText);
				console.log(obj);
				var status = eleForm.parentNode.nextElementSibling; //newest post

				// content start
				var contant = "<div class=\"oneContent\"><div class=\"show_wrap\"><div id=\"photo_area\" board_id=\""
				+obj.id+"\"><a href=\"/board/"+obj.id+"\"><div id=\"title\">"+obj.title+"</div></a><div id=\"image_area\"><div class=\"delButton\"><img src=\"http://bookriot.com/wp-content/uploads/2013/07/x.png\" width=10px height=10px></div><a href=\"/board/"+obj.id+"\"><div id=\"image\">";
				
				if (obj.fileName != null) {
					contant += "<img src=\"/images/"+obj.fileName+"\">";
				}
				
				else{
					contant += "<img src=\"/images/noimage.png\">";
				}
								
				contant += "</div></a></div></div><div id=\"comment\">"+obj.comment+"</div></div><hr><div class=\"commentCounter\">test</div><div class=\"commnets\"><div id=\"commentsArea\">";		
				
				if (obj.attachComment != null) {
					obj.attachComment.forEach(function(comment) {
						if (comment.id != null) {
							contant += "<span>" + comment.content
									+ "</span><br>";
						}
					});
				}	
				
				contant += "</div><hr><form action=\"/board/"+obj.id+"/attachComment\" method=\"post\"><input type=\"hidden\" name=\"id\" value=\""+obj.id+"\"><input type=\"text\" placeholder=\"댓글은 이곳에 적어주세요......\" name=\"attachComment\"><input type=\"submit\" value=\"댓글 달기\"></form><br></div></div>";
				
			// content end
	

				status.insertAdjacentHTML('beforebegin', contant);

				initPage();

			}
		}

	}

	// List에서 바로 삭제하기
	// 이미지를 누르면 이벤트가 걸린다.
	function quickDel() {
		var delIcon = document.getElementsByClassName("delButton");
		var contents = document.querySelectorAll('.show_wrap');
		for ( var i = 0; i < contents.length; i++) {
			delIcon[i].firstElementChild.addEventListener('click', XMLDel,
					false);
		}
	}
	//글 삭제 함수 	
	function XMLDel(e) {
		var target = e.currentTarget;
		var id = target.parentNode.parentNode.parentNode
				.getAttribute("board_id");
		url = "/board/" + id + "/delete.json";
		var request = new XMLHttpRequest();
		request.open("POST", url, true);
		request.send();

		var rvTarget = target.parentNode.parentNode.parentNode.parentNode.parentNode;
		var rvParent = rvTarget.parentNode;

		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) {

				rvParent.removeChild(rvTarget);
			}
		}
	}

	window.onload = initPage; //함수를 기억만 하고 있음.. initPage();라고 하면 바로 실행 될 수 있음
</script>

</head>
<body>
	<div id="list_wrap">
		<a href="/">HOME</a>
		<h1>PHOTO LIST</h1>
		
		<c:choose>
		<c:when test="${not empty sessionScope.userId}">
		<h2>QUICK UPLOAD</h2>
		<div id="formArea">
			<form action="/board" method="post" enctype=multipart/form-data>
				<label for="title"> photo title: </label> <input type="text"
					placeholder="photo title" name="title"><br>
				<textarea rows="10" cols="45" name="comment"
					placeholder="photo comment"></textarea>
				<br> <input type="file" value="파일 선택" name="file"><br>
				<input type="reset" value="내용지우기"> <input type="submit"
					value="사진올리기">
			</form>
		</div>
		</c:when>
		</c:choose>
		<!-- 	LIST화면 -->

		<c:forEach var="data" items="${iterator}">
			<div class="oneContent">

				<div class="show_wrap">
					<div id="photo_area" board_id="${data.id}">
						<a href="/board/${data.id}">
							<div id="title">${data.title}</div>
						</a>
							<div id="image_area">
								<div class="delButton">
									<img src="http://bookriot.com/wp-content/uploads/2013/07/x.png"
										width=10px height=10px>
								</div>
								<a href="/board/${data.id}">
								
									<div id="image">
						<c:if test="${not empty data.fileName}">
										<img src="/images/${data.fileName}">
						</c:if>
						
						<c:if test="${empty data.fileName}">
										<img src="/images/noimage.png">
						</c:if>
									</div>
									
								</a>
							</div>
					</div>

					<div id="comment">${data.comment}</div>
				</div>

				<hr>
				<!-- 여기서부터 댓글 -->
				<div class="commentCounter">test</div>
				<div class="commnets">
					<div id="commentsArea">
						<c:forEach items="${data.attachComment}" var="comment">
							<c:if test="${not empty comment.id}">
								<span>${comment.content}</span>
								<br>
							</c:if>

						</c:forEach>
					</div>
					<hr>
					<form action="/board/${data.id}/attachComment" method="post">
						<input type="hidden" name="id" value="${data.id}"> <input
							type="text" placeholder="댓글은 이곳에 적어주세요......"
							name="attachComment"> <input type="submit" value="댓글 달기">
					</form>
					<br>
				</div>
			</div>
		</c:forEach>
	</div>






</body>
</html>