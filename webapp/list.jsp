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
		<ul>
			<li>
			<br> 제목: ${data.title} <br> 
				comment:${data.comment} <br> 
				사진 이름: ${data.fileName} <br> 
				<img src="/images/${data.fileName}" widths=200, height=300> <br>
			</li>
		</ul>
	</c:forEach>






</body>
</html>